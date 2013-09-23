-------------------------------
-- Players

function gameModeInit(player)

end

function joinHandler(player)
	local playerJoined = not player
	if playerJoined then
		player = source
	end
	
	local playerID = addElem(g_Players, player)
	setElementData(player, 'ID', playerID)
	clientCall(player, 'setAMXVersion', amxVersionString())
	clientCall(player, 'setPlayerID', playerID)
	
	if playerJoined then
		if getRunningGameMode() then
			gameModeInit(player)
		end
		table.each(
			g_LoadedAMXs,
			function(amx)
				-- add amx clientside
				clientCall(player, 'addAMX', amx.name, amx.publics.OnGameModeInit and true)
			end
		)
	end
end
addEventHandler('onPlayerJoin', root, joinHandler)

addEventHandler('onPlayerQuit', root,
	function(reason)
		g_Players[playerID] = nil
	end
)
