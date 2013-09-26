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
	triggerClientEvent('setAMXVersion', player, amxVersionString())
	triggerClientEvent('setPlayerID', player, playerID)
	
	if playerJoined then
		if getRunningGameMode() then
			gameModeInit(player)
		end
		table.each(
			g_LoadedAMXs,
			function(amx)
			
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


function OnPlayerSpawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
	procCallOnAll("OnPlayerSpawn", getElemID(source), posX, posY, posZ, spawnRotation, 0, theSkin, theInterior, theDimension );
end
addEventHandler ( "onPlayerSpawn", getRootElement(), OnPlayerSpawn )

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
addEventHandler ( "onConsole", getRootElement(), OnConsole )


-- Player Events
function OnPlayerWasted(totalAmmo, killer, killerWeapon, bodyPart)
	if killer then
		procCallOnAll("OnPlayerWasted", getElemID(source), totalAmmo, getElementType(killer), getElemID(killer), killerWeapon, bodyPart);
	else
		procCallOnAll("OnPlayerWasted", getElemID(source), totalAmmo, "", -1, -1, bodyPart);
	end
	
end
addEventHandler( "onPlayerWasted", getRootElement( ), OnPlayerWasted);

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

function OnMarkerHit( hitElement, matchingDimension )
    local elementType = getElementType( hitElement )
	if elementType == "player" then
		procCallOnAll("OnPlayerMarkerHit", getElemID(source), getElemID(hitElement), matchingDimension);
	elseif elementType == "vehicle" then
		procCallOnAll("OnVehicleMarkerHit", getElemID(source), getElemID(hitElement), matchingDimension);
	elseif elementType == "ped" then
		procCallOnAll("OnPedMarkerHit", getElemID(source), getElemID(hitElement), matchingDimension);
	end
end
addEventHandler( "onMarkerHit", getRootElement(), OnMarkerHit )

function OnMarkerLeave( hitElement, matchingDimension )
    local elementType = getElementType( hitElement )
	if elementType == "player" then
		procCallOnAll("OnPlayerMarkerLeave", getElemID(source), getElemID(hitElement), matchingDimension);
	elseif elementType == "vehicle" then
		procCallOnAll("OnVehicleMarkerLeave", getElemID(source), getElemID(hitElement), matchingDimension);
	elseif elementType == "ped" then
		procCallOnAll("OnPedMarkerLeave", getElemID(source), getElemID(hitElement), matchingDimension);
	end
end
addEventHandler( "onMarkerLeave", getRootElement(), OnMarkerLeave )

function OnPlayerVehicleEnter ( theVehicle, seat, jacked )
	local j = -1;
	if jacked then
		j = getElemID(jacked);
	end
	procCallOnAll("OnPlayerVehicleEnter", getElemID(source), getElemID(theVehicle), seat, j);
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), OnPlayerVehicleEnter )

function OnPlayerVehicleExit ( theVehicle, seat, jacker )
	local j = -1;
	if jacked then
		j = getElemID(jacker);
	end
	procCallOnAll("OnPlayerVehicleExit", getElemID(source), getElemID(theVehicle), seat, j);
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), OnPlayerVehicleExit )