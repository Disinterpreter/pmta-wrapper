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
		
		procCallOnAll('OnPlayerConnect', playerID)
	end
end
addEventHandler('onPlayerJoin', root, joinHandler)

addEventHandler('onPlayerQuit', root,
	function(reason)
		local playerID = getElemID(source)
		g_Players[playerID] = nil
	end
)


-- Chat Events

function OnPlayerChat(message, messageType)
	procCallOnAll("OnPlayerChat", getElemID(source), tostring(message), messageType)
end
addEventHandler("onPlayerChat", root, OnPlayerChat)

function OnConsole ( text )
	if ( getElementType ( source ) == "player" ) then
		procCallOnAll("OnPlayerConsole", getElemID(source), tostring(text))
	end
end
addEventHandler ( "onConsole", getRootElement(), OnConsole ) -- add an event handler for onConsole


-- Player Events
function OnPlayerSpawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
	procCallOnAll("OnPlayerSpawn", getElemID(source), float2cell(posX), float2cell(posY), float2cell(posZ), float2cell(spawnRotation), 0, theSkin, theInterior, theDimension )
end
addEventHandler ( "onPlayerSpawn", getRootElement(), OnPlayerSpawn )


function OnPlayerDamage ( attacker, weapon, bodypart, loss )
	procCallOnAll("OnPlayerDamage", getElemID(source), getElemID(attacker), weapon, bodypart, float2cell(loss))
end
addEventHandler ( "onPlayerDamage", getRootElement (), OnPlayerDamage )

function OnPlayerCommand ( command, ... )
	local args = { ... }
	local args = table.concat(args)
	procCallOnAll("OnPlayerCommand", getElemID(source), command, tostring(args))
end
addEventHandler("onPlayerCommand", root, OnPlayerCommand)