g_LoadedAMXs = {}

g_Players = {}
g_Vehicles = {}
g_Peds = {}
g_Guis = {}
g_Objects = {}
g_Markers = {}
g_Pickups = {}
g_Blips = {}

function initGameModeGlobals()

end

addEventHandler('onResourceStart', g_ResRoot,
	function()
		if not amxVersion then
			outputDebugString('The amx module (king.dll/so) isn\'t loaded. It is required for amx to function. Please add it to your server config and restart your server.', 1)
			return
		end
		
		table.each(getElementsByType('player'), joinHandler)
		
		local plugins = get('amx.plugins')
		if plugins then
			table.each(plugins:split(), amxLoadPlugin)
		end
		
		local filterscripts = get('amx.filterscripts')
		if filterscripts then
			filterscripts = filterscripts:split()
			for i,filterscript in ipairs(filterscripts) do
				local filterres = getResourceFromName('amx-fs-' .. filterscript)
				if filterres then
					if getResourceState(filterres) == 'running' then
						stopResource(filterres)
					end
					startResource(filterres)
				else
					outputDebugString('No filterscript named "' .. filterscript .. '" exists', 2)
				end
			end
		end
	end,
	false
)

local function loadResourceAMXs(res)
	local amxFiles = getResourceAMXFiles(res)
	if amxFiles and #amxFiles > 0 then
		table.each(amxFiles, loadAMX, res)
	end
end
addEventHandler('onResourceStart', root, loadResourceAMXs)

function loadAMX(fileName, res)
	local resName = getResourceName(res)
	if not resName:match('^amx%-') then
		outputDebugString('Not loading ' .. fileName .. ', resource name must start with "amx-"', 1)
		return false
	end
	outputDebugString('Loading ' .. fileName)
	local amx = { name = fileName:match('(.*)%.'), res = res }
	if resName:match('^amx%-fs%-') then
		amx.type = 'filterscript'
	else
		amx.type = 'gamemode'
	end
	
	local hAMX = fileOpen(':' .. getResourceName(res) .. '/' .. fileName, true)
	if not hAMX then
		outputDebugString('Error opening ' .. fileName, 1)
		return false
	end
	
	-- read header
	amx.flags = readWORDAt(hAMX, 8)
	amx.COD = readDWORDAt(hAMX, 0xC)
	amx.DAT = readDWORD(hAMX)
	amx.HEA = readDWORD(hAMX)
	amx.STP = readDWORD(hAMX)
	amx.main = readDWORD(hAMX)
	amx.publics = readDWORD(hAMX)
	amx.natives = readDWORD(hAMX)
	amx.libraries = readDWORD(hAMX)

	-- read tables with names of public and syscall functions
	amx.publics = readPrefixTable(hAMX, amx.publics, amx.natives - amx.publics, true)
	amx.natives = readPrefixTable(hAMX, amx.natives, amx.libraries - amx.natives, false)
	amx.libraries = nil
	
	fileClose(hAMX)
	
	local alreadyGameModeRunning = getRunningGameMode() and true
	
	if alreadyGameModeRunning and amx.type == 'gamemode' then
		outputDebugString('Not loading ' .. fileName .. ' - a gamemode is already running', 1)
		return false
	end
	
	amx.cptr = amxLoad(getResourceName(res), amx.name .. '.amx')
	if not amx.cptr then
		outputDebugString('Error loading ' .. fileName, 1)
		return false
	end
	
	-- set up reading/writing of code and data section
	amx.memCOD = setmetatable({ amx = amx.cptr }, { __index = amxMTReadCODCell })
	amx.memDAT = setmetatable({ amx = amx.cptr }, { __index = amxMTReadDATCell, __newindex = amxMTWriteDATCell })
	
	g_LoadedAMXs[amx.name] = amx
	
	-- run initialization
	if amx.type == 'gamemode' then
		initGameModeGlobals()
		procCallOnAll('OnGameModeInit')
		table.each(g_Players, 'elem', gameModeInit)
	else
		procCallInternal(amx, 'OnFilterScriptInit')
	end
	procCallInternal(amx, amx.main)
	
	for id,player in pairs(g_Players) do
		procCallInternal(amx, 'OnPlayerConnect', id)
	end
	
	triggerEvent('onAMXStart', getResourceRootElement(res), amx.res, amx.name)
	return amx
end
addEvent('onAMXStart')

function unloadAMX(amx, notifyClient)
	outputDebugString('Unloading ' .. amx.name .. '.amx')
	
	if amx.type == 'gamemode' then
		procCallInternal(amx, 'OnGameModeExit')
		fadeCamera(root, false, 0)
	elseif amx.type == 'filterscript' then
		procCallInternal(amx, 'OnFilterScriptExit')
	end
	
	amxUnload(amx.cptr)

	if amx.boundkeys then
		for i,key in ipairs(amx.boundkeys) do
			table.each(g_Players, 'elem', unbindKey, g_ControlMapping[key], 'down', procCallInternal)
		end
	end
	
	g_LoadedAMXs[amx.name] = nil
	if getResourceState(amx.res) == 'running' then
		stopResource(amx.res)
	end
	triggerEvent('onAMXStop', getResourceRootElement(amx.res), amx.res, amx.name)
end
addEvent('onAMXStop')

addEventHandler('onResourceStop', getRootElement(),
	function(res)
		local amxs = getResourceAMXFiles(res)
		if not amxs then
			return
		end
		for i,amxfile in ipairs(amxs) do
			local amx = g_LoadedAMXs[amxfile:match('(.*)%.')]
			if amx then
				unloadAMX(amx, true)
			end
		end
	end
)

addEventHandler('onResourceStop', g_ResRoot,
	function()
		table.each(g_LoadedAMXs, unloadAMX, false)
		amxUnloadAllPlugins()
	end
)

function getRunningGameMode()
	for name,amx in pairs(g_LoadedAMXs) do
		if amx.type == 'gamemode' then
			return amx
		end
	end
	return false
end

function getRunningFilterScripts()
	local result = {}
	for name,amx in pairs(g_LoadedAMXs) do
		if amx.type == 'filterscript' then
			result[#result+1] = amx
		end
	end
	return result
end

function readPrefixTable(hFile, offset, length, nameAsKey)
	-- build a name lookup table {name = offset} or {index = name}
	local entryOffset, entryNameOffset
	local result = {}
	for i=0,length/8-1 do
		entryOffset = readDWORDAt(hFile, offset)
		entryName = readString(hFile, readDWORD(hFile))
		if nameAsKey then
			result[entryName] = entryOffset
		else
			result[i] = entryName
		end
		offset = offset + 8
	end
	return result
end

function procCallInternal(amx, nameOrOffset, ...)
	if type(amx) ~= 'table' then
		amx = g_LoadedAMXs[amx]
	end
	if not amx then
		outputDebugString('procCallInternal called with amx=nil, proc name=' .. nameOrOffset, 2)
		return
	end
	
	local prevProc = amx.proc
	amx.proc = nameOrOffset
	local ret
	if type(nameOrOffset) == 'number' then
		if nameOrOffset == amx.main then
			 ret = amxCall(amx.cptr, -1, ...)
		end
	else
		ret = amxCall(amx.cptr, nameOrOffset, ...)
	end
	amx.proc = prevProc
	return ret or 0
end

function procCallOnAll(fnName, ...)
	for name,amx in pairs(g_LoadedAMXs) do
		if amx.type == 'filterscript' and procCallInternal(amx, fnName, ...) ~= 0 and fnName == 'OnPlayerCommandText' then
			return true
		end
	end
	local gamemode = getRunningGameMode()
	if gamemode and gamemode.publics[fnName] and procCallInternal(gamemode, fnName, ...) == 0 then
		return false
	end
	return true
end

function playerEvent(client, fnName, ...)
	--outputChatBox("playerEvent called " .. fnName);
	local args = { ... }
	for k,v in pairs(args) do
		--outputChatBox("type " .. type(v) .. " val " .. v);
		if type(v) == "number" and math.floor(v) ~= v then
			args[k] = float2cell(v);
		end	
	end
	procCallOnAll(fnName, getElemID(client), unpack(args));
end