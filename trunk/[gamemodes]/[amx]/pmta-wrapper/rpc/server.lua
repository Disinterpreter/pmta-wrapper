__triggerClientEvent = triggerClientEvent

--------------------------------
-- Client -> Server
local allowedRPC = {
	createPed = true,
	createVehicle = true,
	warpPedIntoVehicle = true
}

addEvent('onServerCallback', true)
addEventHandler('onServerCallback', root,
	function(crID, fnName, ...)
		if allowedRPC[fnName] then
			__triggerClientEvent(source, 'onServerCallbackReply', root, crID, _G[fnName](...))
		end
	end
)


addEvent('onServerCallbackEvent', true)
addEventHandler('onServerCallbackEvent', root,
	function(crID, fnName, ...)
			--outputChatBox("onservercallbackevent called " .. fnName);
			_G["playerEvent"](client, fnName, ...)
	end
)
--------------------------------
-- Server -> Client
CRs = {}

_resume = coroutine.resume
function coroutine.resume(cr, ...)
	local ret = { _resume(cr, ...) }
	if coroutine.status(cr) == 'dead' then
		CRs[CRs[cr]] = nil
		CRs[cr] = nil
	end
	if not ret[1] then
		--outputDebugString(ret[2], 1)
		outputChatBox(ret[2])
		return false
	end
	table.remove(ret, 1)
	return unpack(ret)
end


addEvent('onClientCallbackReply', true)
addEventHandler('onClientCallbackReply', root,
	function(crID, ...)
		outputChatBox("callback");
		local t = { ... }
		local out = nil
		if t[1] ~= nil then
			if type(t[1]) == "table" then
				local z = t[1]
				if z[1] == "userdata" then
					out = z
				end
			end
		end
		if out ~= nil then
			coroutine.resume(CRs[crID], out)
		else
			coroutine.resume(CRs[crID], ...)
		end
	end
)

function wrapHandler(fn)
	return function(...)
		local cr = coroutine.create(fn)
		local id = #CRs + 1
		CRs[id] = cr
		CRs[cr] = id
		coroutine.resume(cr, ...)
	end
end

_addEventHandler = addEventHandler
function addEventHandler(event, elem, fn, getPropagated)
	return _addEventHandler(
		event,
		elem,
		fn or wrapHandler(fn),
		getPropagated
	)
end

_addCommandHandler = addCommandHandler
function addCommandHandler(command, fn)
	return _addCommandHandler(command, wrapHandler(fn))
end


clientMT = {}
function clientMT:__index(fnName)
	if(fnName == "setClient") then
		return function(...)
			self.__elem = ...;
			self.__elemid = nil;
		end
	elseif(fnName == "setID") then
		return function(...)
			self.__elemid = ...;
		end
	else
		return function(...)
			__triggerClientEvent(self.__elem, 'onClientCallback', getRootElement(), self.__elemid, fnName, ...)
		end
	end
end
client = setmetatable({}, clientMT)
_G["client"] = setmetatable({}, clientMT)
_G["clientWrap"] = setmetatable({}, clientMT)