--------------------------------
-- Server -> Client
local IDs = {}
addEvent('onClientCallback', true)
addEventHandler('onClientCallback', root,
	function(id, fnName, ...)
		local t = {...}
		for k,v in pairs(t) do
			if type(v) == "table" then
				if v[1] == "userdata" then
					--outputChatBox("found userdata!")
					t[k] = IDs[v[2]]
					--outputChatBox('usedata: ' .. v[2] .. '   ..... ' .. type(IDs[v[2]]))
				end
			end
		end
		
		if id ~= nil then
			--outputChatBox("iddd: " .. id);
		end
		
		for k, v in pairs(IDs) do
			--outputChatBox("sss " .. k .. " v " .. type(v))
		end
		
		for k, v in pairs(t) do
			--outputChatBox("args " .. k .. " v " .. type(v))
		end
		
		local var = _G[fnName](unpack(t))
		--outputChatBox("newvar: " .. type(var));
		t = nil
		if type(var) == "userdata" and id ~= nil then
			IDs[id] = var
		end
		--outputChatBox("replied")
	end
)
--------------------------------

--------------------------------
-- Client -> Server

local CRs = {}

local _resume = coroutine.resume
function coroutine.resume(cr, ...)
	local ret = { _resume(cr, ...) }
	if coroutine.status(cr) == 'dead' then
		CRs[CRs[cr]] = nil
		CRs[cr] = nil
	end
	if not ret[1] then
		outputDebugString(ret[2], 1)
		return false
	end
	table.remove(ret, 1)
	return unpack(ret)
end

addEvent('onServerCallbackReply', true)
addEventHandler('onServerCallbackReply', root,
	function(crID, ...)
		coroutine.resume(CRs[crID], ...)
	end
)

local function wrapHandler(fn)
	return function(...)
		local cr = coroutine.create(fn)
		local id = #CRs + 1
		CRs[id] = cr
		CRs[cr] = id
		coroutine.resume(cr, ...)
	end
end

local _addEventHandler = addEventHandler
function addEventHandler(event, elem, fn, getPropagated)
	return _addEventHandler(
		event,
		elem,
		(event == 'onClientRender' or event == 'onClientPreRender') and fn or wrapHandler(fn),
		getPropagated
	)
end

local _addCommandHandler = addCommandHandler
function addCommandHandler(command, fn)
	return _addCommandHandler(command, wrapHandler(fn))
end

local serverMT = {}
function serverMT:__index(fnName)
	return function(...)
		triggerServerEvent('onServerCallback', getLocalPlayer(), CRs[coroutine.running()], fnName, ...)
		return coroutine.yield()
	end
end
server = setmetatable({}, serverMT)


