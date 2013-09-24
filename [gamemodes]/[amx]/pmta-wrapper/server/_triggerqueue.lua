_triggerClientEvent = triggerClientEvent

local playerData = {}			-- { player = { loaded = bool, pending = {...} } }

local function joinHandler(player)
	playerData[player or source] = { loaded = false, pending = {} }
end

addEventHandler('onResourceStart', getResourceRootElement(getThisResource()),
	function()
		for i,player in ipairs(getElementsByType('player')) do
			joinHandler(player)
		end
	end,
	false
)

addEventHandler('onPlayerJoin', getRootElement(), joinHandler)

addEvent('onLoadedAtClient', true)
addEventHandler('onLoadedAtClient', getResourceRootElement(getThisResource()),
	function(player)
		playerData[player].loaded = true
		for i,event in ipairs(playerData[player].pending) do
			_triggerClientEvent(player, event.name, event.source, unpack(event.args))
		end
		playerData[player].pending = nil
	end,
	false
)

addEventHandler('onPlayerQuit', getRootElement(),
	function()
		playerData[source] = nil
	end
)
