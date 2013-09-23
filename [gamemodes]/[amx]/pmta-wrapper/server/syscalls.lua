﻿function argsToMTA(amx, prototype, ...)
	if type(amx) == 'userdata' then
		local amxName = table.find(g_LoadedAMXs, 'cptr', amx)
		if not amxName then
			print('argsToMTA: No amx found for provided cptr')
			return 0
		end
		amx = g_LoadedAMXs[amxName]
	end
	
	local args = { ... }
	local val
	local argMissing = false
	local colorArgs
	for i,val in ipairs(args) do
		vartype = prototype[i]
		if vartype == 'b' then			-- boolean
			val = val ~= 0
		elseif vartype == 'c' then		-- color
			if not colorArgs then
				colorArgs = {}
			end
			colorArgs[i] = { binshr(val, 24) % 0x100, binshr(val, 16) % 0x100, binshr(val, 8) % 0x100 }		-- r, g, b
			val = val % 0x100			-- a
		elseif vartype == 'p' then		-- player
			val = g_Players[val] and g_Players[val].elem
		elseif vartype == 'z' then		-- bot/ped
			val = g_Bots[val] and g_Bots[val].elem
		elseif vartype == 't' then		-- team
			val = val ~= 0 and g_Teams[val]
		elseif vartype == 'v' then		-- vehicle
			val = g_Vehicles[val] and g_Vehicles[val].elem
		elseif vartype == 'o' then		-- object
			val = g_Objects[val] and g_Objects[val].elem
		elseif vartype == 'u' then		-- pickup
			val = g_Pickups[val] and g_Pickups[val].elem
		elseif vartype == 'h' then		-- file handle
			val = amx.files[val]
		elseif vartype == 'x' then		-- textdraw
			val = amx.textdraws[val]
		elseif vartype == 'm' then		-- menu
			val = amx.menus[val]
		elseif vartype == 'g' then		-- gang zone
			val = amx.gangzones[val] and amx.gangzones[val].elem
		elseif vartype == 'k' then		-- native marker
			val = g_Markers[val] and g_Markers[val].elem
		elseif vartype == 'l' then		-- slothbots
			val = g_SlothBots[val] and g_SlothBots[val].elem
		elseif vartype == 'd' then		-- database result
			val = amx.dbresults[val]
		elseif vartype == 'a' then		-- 3D text label
			val = amx.textlabels[val]
		end
		if val == nil then
			val = false
			argMissing = true
		end
		args[i] = val
	end
	if colorArgs then
		local indexOffset = 0
		for i,colorArg in pairs(colorArgs) do
			for j,color in ipairs(colorArg) do
				table.insert(args, i+j-1 + indexOffset, color)
			end
			indexOffset = indexOffset + 3
		end
	end
	
	return args, argMissing
end
local argsToMTA = argsToMTA

function argsToSAMP(amx, prototype, ...)
	if type(amx) == 'userdata' then
		local amxName = table.find(g_LoadedAMXs, 'cptr', amx)
		if not amxName then
			print('argsToSAMP: No amx found for provided cptr')
			return 0
		end
		amx = g_LoadedAMXs[amxName]
	end
	
	local args = { ... }
	for i,v in ipairs(args) do
		if type(v) == 'nil' then
			args[i] = 0
		elseif type(v) == 'boolean' then
			args[i] = v and 1 or 0
		elseif type(v) == 'string' then
			-- keep unmodified
		elseif type(v) == 'number' then
			if prototype[i] == 'f' then
				args[i] = float2cell(v)
			end
		elseif type(v) == 'userdata' then
			args[i] = isElement(v) and getElemID(v)
		else
			args[i] = 0
		end
	end
	return args
end

function syscall(amx, svc, prototype, ...)		-- svc = service number (= index in native functions table) or name of native function
	if type(amx) == 'userdata' then
		local amxName = table.find(g_LoadedAMXs, 'cptr', amx)
		if not amxName then
			return 0
		end
		amx = g_LoadedAMXs[amxName]
	end
	local fnName = type(svc) == 'number' and amx.natives[svc] or svc
	local fn = prototype.fn or _G[fnName]
	if not fn and not prototype.client then
		outputDebugString('syscall: function ' .. tostring(fn) .. 'doesn\'t exist', 1)
		return
	end

	local args, argMissing = argsToMTA(amx, prototype, ...)
	
	if argMissing then
		return 0
	end
	--[[
	local logstr = fnName .. '('
	for i,argval in ipairs(args) do
		if i > 1 then
			logstr = logstr .. ', '
		end
		logstr = logstr .. tostring(argval)
	end
	logstr = logstr .. ')'
	print(logstr)
	outputConsole(logstr)
	--]]

	local result
	if prototype.client then
		local player = table.remove(args, 1)
		clientCall(player, fnName, amx.name, unpack(args))
	else
		result = fn(amx, unpack(args))
		if type(result) == 'boolean' then
			result = result and 1 or 0
		end
	end
	--print('syscall returned ' .. tostring(result or 0))
	return result or 0
end

----------------------------------------------
--  Start of SA-MP API implementation

local skinReplace = {
	-- invalid skins
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[8] = 0,
	[42] = 0,
	[65] = 0,
	[74] = 0,
	[86] = 0,
	[119] = 0,
	[149] = 0,
	[208] = 0,
	[273] = 0,
	
	-- story skins
	[1] = 261,		-- The Truth
	[2] = 37,		-- Mack
	[265] = 284,	-- Police
	[266] = 281,	--  "
	[267] = 280,	--  "
	[268] = 72,		-- Paul
	[269] = 105,	-- Big Smoke
	[270] = 107,	-- Sweet
	[271] = 106,	-- Ryder
	[272] = 112,	-- Black jacket, white pants
	[290] = 57,		-- Rosenberg
	[291] = 111,	-- Jeans jacket, black pants
	[292] = 109,	-- Ese
	[293] = 83,		-- O.G. LOC
	[294] = 120,	-- Wuzi
	[295] = 165,	-- Toreno
	[296] = 249,	-- Pimp
	[297] = 24,		-- Madd Dog
	[298] = 192,	-- Cathalena
	[299] = 124		-- Claude
}

function acos(amx, f)
	return float2cell(math.acos(f))
end


function asin(amx, f)
	return float2cell(math.asin(f))
end


function atan(amx, f)
	return float2cell(math.atan(f))
end


function atan2(amx, x, y)
	return float2cell(math.atan2(y, x))
end


function db_close(amx, db)
	sqlite3CloseDB(amx.cptr, db)
end


function db_free_result(amx, dbResultID)
	amx.dbresults[dbResultID] = nil
end


function db_field_name(amx, dbresult, fieldIndex, outbuf, maxlength)
	local colname = dbresult.columns[fieldIndex+1]
	if #colname < maxlength then
		writeMemString(amx, outbuf, colname)
		return true
    end
    return false
end


function db_get_field(amx, dbresult, fieldIndex, outbuf, maxlength)
	if dbresult[dbresult.row] then
        local data = dbresult[dbresult.row][fieldIndex+1]
        if #data < maxlength then
			writeMemString(amx, outbuf, data)
			return true
		end
	end
    return false
end


function db_get_field_assoc(amx, dbresult, fieldName, outbuf, maxlength)
	local fieldIndex = table.find(dbresult.columns, fieldName)
	return fieldIndex and db_get_field(amx, dbresult, fieldIndex-1, outbuf, maxlength)
end


function db_next_row(amx, dbresult)
	dbresult.row = dbresult.row + 1
end


function db_num_fields(amx, dbresult)
	return #dbresult.columns
end


function db_num_rows(amx, dbresult)
	return #dbresult
end


function db_open(amx, dbName)
	return sqlite3OpenDB(amx.cptr, dbName)
end


function db_query(amx, db, query)
	local dbresult = sqlite3Query(amx.cptr, db, query)
	if type(dbresult) == 'table' then
		dbresult.row = 1
		return table.insert(amx.dbresults, dbresult)
	end
	return 0
end


function floatstr(amx, str)
	return float2cell(tonumber(str) or 0)
end


function format(amx, outBuf, outBufSize, fmt, ...)
	local args = { ... }
	local i = 0
        
	fmt = fmt:gsub('[^%%]%%$', '%%%%'):gsub('%%i', '%%d')
	for c in fmt:gmatch('%%[%-%d%.]*(%*?%a)') do
		i = i + 1
		if c:match('^%*') then
			c = c:sub(2)
			table.remove(args, i)
		end
		if c == 'd' then
			args[i] = amx.memDAT[args[i]]
		elseif c == 'f' then
			args[i] = cell2float(amx.memDAT[args[i]])
		elseif c == 's' then
			args[i] = readMemString(amx, args[i])
		else
			i = i - 1
		end
    end
    fmt = fmt:gsub('(%%[%-%d%.]*)%*(%a)', '%1%2')
    local result = fmt:format(unpack(args))
    if #result+1 <= outBufSize then
		writeMemString(amx, outBuf, result)
	end
end

g_SAMPSyscallPrototypes = {	



	acos = {'f'},
	asin = {'f'},
	atan = {'f'},
	atan2 = {'f', 'f'},

	db_close = {'i'},
	db_free_result = {'i'},
	db_field_name = {'d', 'i', 'r', 'i'},
	db_get_field = {'d', 'i', 'r', 'i'},
	db_get_field_assoc = {'d', 's', 'r', 'i'},
	db_next_row = {'d'},
	db_num_fields = {'d'},
	db_num_rows = {'d'},
	db_open = {'s'},
	db_query = {'i', 's'},
	
	floatstr = {'s'},
	format = {'r', 'i', 's'},

	memcpy = {'r', 'r', 'i', 'i', 'i'},
}