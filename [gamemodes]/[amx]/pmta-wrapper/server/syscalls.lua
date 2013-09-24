function argsToMTA(amx, prototype, ...)
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
		elseif vartype == 'v' then		-- vehicle
			val = g_Vehicles[val] and g_Vehicles[val].elem
		elseif vartype == 'e' then
			val = g_Peds[val] and g_Peds[val].elem
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

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>> Implementation of PAWN API <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-- Chat
function OutputChatBox( amx, player, text, r, g, b, colorCoded )
	return outputChatBox( text, player, r, g, b, colorCoded );
end

function OutputChatBoxToAll( amx, text, r, g, b, colorCoded )
	return outputChatBox( text, getRootElement(), r, g, b, colorCoded );
end



-----------------------------------------------------
-- Vehicle ( Sorted )

function AddVehicleUpgrade(amx, vehicle, upgradeID)
	return addVehicleUpgrade(vehicle, upgradeID);
end

function AttachTrailerToVehicle(amx, trailer, vehicle)
	return attachTrailerToVehicle(vehicle, trailer);
end

function BlowVehicle ( vehicle )
	return blowVehicle ( vehicle )
end

function DetachTrailerFromVehicle(amx, puller)
	return detachTrailerFromVehicle(puller)
end

function CreateVehicle(amx, model, x, y, z)
	local vehicle = createVehicle(model, x, y, z, 0, 0, 90.0)
	
	if vehicle == false then
		return false
	end
	
	local vehID = addElem(amx, 'vehicles', vehicle)
	
	return vehID
end

function FixVehicle ( amx, vehicle )
	return fixVehicle ( vehicle )
end


--[[
function GetVehicleColor( amx, vehicle )

end

function getVehicleCompatibleUpgrades( amx, vehicle )

end
]]

function GetVehicleController( amx, vehicle )
	local player = getVehicleController( vehicle );
	
	local playerID = getElemID( player )
	
	return playerID
end

function GetVehicleDoorState(amx, vehicle, door)
	return getVehicleDoorState(vehicle, door)
end

function GetVehicleEngineState( amx, vehicle )
	return getVehicleEngineState( vehicle );
end

function GetVehicleLandingGearDown( amx, vehicle )
	return getVehicleLandingGearDown( vehicle );
end

function GetVehicleLightState( amx, vehicle )
	return getVehicleLightState( vehicle );
end

function GetVehicleName ( amx, vehicle, nameBuf, bufSize )
	local vehName =  getVehicleName ( vehicle )
	if #vehName <= bufSize then
		writeMemString( amx, nameBuf, vehName );
		return true;
	end
	return false;
end

function GetVehicleOccupant( amx, vehicle )
	local player = getVehicleOccupant( vehicle );
	
	local playerID = getElemID( player )
	
	return playerID
end


--[[
function GetVehicleOccupants( amx, vehicle )

end
]]

function GetVehicleOverrideLights( amx, vehicle )
	return getVehicleOverrideLights( vehicle );
end


function GetVehiclePaintjob(amx, vehicle)
	return getVehiclePaintjob(vehicle)
end

function GetVehiclePanelState(amx, vehicle, panel)
	return getVehiclePanelState(vehicle, panel)
end

function GetVehicleSirensOn(amx, vehicle)
	return getVehicleSirensOn(vehicle)
end

--[[

function GetVehiclesOfType( amx, model )

end
]]

--[[
function GetVehicleTowedByVehicle( )

end
]]

--getVehicleTowingVehicle 
--getVehicleTurnVelocity 
--getVehicleTurretPosition 

function GetVehicleType ( amx, vehicle, nameBuf, bufSize )
	local vehType = getVehicleType ( vehicle )
	if #vehType <= bufSize then
		writeMemString( amx, nameBuf, vehType );
		return true;
	end
	return false;
end

--getVehicleUpgradeOnSlot 
--getVehicleUpgrades 
--getVehicleUpgradeSlotName 
--getVehicleWheelStates 
--getVehicleDoorOpenRatio 
--getVehicleHandling 
--getModelHandling 
--getOriginalHandling 
--isVehicleDamageProof 
--isVehicleFuelTankExplodable 
function IsVehicleLocked( amx, vehicle )
	return isVehicleLocked( vehicle );
end

function IsVehicleOnGround( amx, vehicle )
	return isVehicleOnGround( vehicle );
end

--removeVehicleUpgrade 
--resetVehicleExplosionTime 
--resetVehicleIdleTime 


function RespawnVehicle ( amx, vehicle )
	return respawnVehicle ( vehicle )
end

--setVehicleColor 
--setVehicleDamageProof 
--setVehicleDoorState 
--setVehicleDoorsUndamageable 
--setVehicleEngineState 
--setVehicleFuelTankExplodable 
--setVehicleIdleRespawnDelay 
--setVehicleLandingGearDown 
--setVehicleLightState 

function SetVehicleLocked ( amx ,vehicle, locked )
	return setVehicleLocked ( vehicle, locked )
end

--setVehicleOverrideLights 
--setVehiclePaintjob 
--setVehiclePanelState 
--setVehicleRespawnDelay 
--setVehicleRespawnPosition 
--setVehicleSirensOn 
--setVehicleTurretPosition 
--setVehicleDoorOpenRatio 
--setVehicleHandling 
--setModelHandling 
--setVehicleTurnVelocity 
--setVehicleWheelStates 

function SpawnVehicle( amx, vehicle, x, y, z )
	return spawnVehicle( vehicle, x, y, z );
end

--toggleVehicleRespawn 
--getTrainDirection 
--getTrainSpeed 
--getVehicleHeadLightColor 
--getVehicleModelFromName 
--getVehicleNameFromModel 
--isTrainDerailable 
--isTrainDerailed 
--isVehicleBlown 
--isVehicleTaxiLightOn 
--setTrainDerailable 
--setTrainDerailed 
--setTrainDirection 
--setTrainSpeed 
--setVehicleHeadLightColor 
--setVehicleTaxiLightOn 
--getVehicleVariant 
--setVehicleVariant 
--getVehicleSirenParams 
--removeVehicleSirens 
--getVehicleSirens 
--addVehicleSirens 
--setVehicleSirens 

function SetVehiclePlateText ( amx, vehicle, nuberplate )
	return setVehiclePlateText ( vehicle, nuberplate )
end




------------------------------------------------------------------------
--Element-Vehicle functions


function GetVehiclePosition(amx, vehicle, refX, refY, refZ)
	local x, y, z = getElementPosition(vehicle);
	writeMemFloat(amx, refX, x)
	writeMemFloat(amx, refY, y)
	writeMemFloat(amx, refZ, z)


end

function SetVehiclePosition( amx, vehicle, x, y, z )
	return setElementPosition( vehicle, x, y, z );
end

function GetVehicleHealth ( amx, vehicle, refHealth )
	local health = getElementHealth( vehicle );
	writeMemFloat( amx, refHealth, health );
end

function SetVehicleHealth ( amx, vehicle, health )
	return setElementHealth ( vehicle, health )
end

function SetVehicleAlpha( amx, vehicle, alpha )
	return setElementAlpha( vehicle, alpha );
end

function GetVehicleAlpha( amx, vehicle )
	return getElementAlpha( vehicle );
end


------------------------------------------------------------------------
-- Player functions ( Start is empty but next stuff is sorted )

--forcePlayerMap 
--getAlivePlayers 
--getDeadPlayers 
--getPlayerAnnounceValue 
--getPlayerBlurLevel 

function GetPlayerBlurLevel( amx, player )
	return getPlayerBlurLevel( player );
end

function SetPlayerBlurLevel( amx, player, level)
	return SetPlayerBlurLevel( player, level );
end

function GetPlayerCount( amx )
	return getPlayerCount();
end

function GetPlayerMoney( amx, player )
	return getPlayerMoney( player );
end

--getPlayerNametagColor 
--getPlayerNametagText

function GetPlayerPing( amx, player )
	return getPlayerPing( player );
end

--getPlayerTeam 
--getPlayerVersion 
--getPlayerWantedLevel 
--getRandomPlayer

function GivePlayerMoney( amx, player, money )
	return givePlayerMoney( player, money );
end

--isPlayerMapForced 
--isPlayerMuted 
--isPlayerNametagShowing 
--setPlayerAnnounceValue 
--setPlayerBlurLevel

function SetPlayerMoney( amx, player, money )
	return setPlayerMoney( player, money );
end

--setPlayerMuted 
--setPlayerNametagColor 
--setPlayerNametagShowing 
--setPlayerNametagText 
--setPlayerTeam 

function SetPlayerWantedLevel( amx, player, level )
	return setPlayerWantedLevel( player, level );
end

--isPlayerHudComponentVisible 
--showPlayerHudComponent 
--setPlayerHudComponentVisible

function SpawnPlayer( amx, player, x, y, z )
	return spawnPlayer( player, x, y, z );
end

function TakePlayerMoney( amx, player, money )
	return takePlayerMoney( player, money );
end

function GetPlayerFromName( amx, name )
	local player = getPlayerFromName( name );
	local playerID = getElemID( player )
	
	return playerID
end

function GetPlayerIP( axm, player, refStr, bufSize )
	local ip = getPlayerIP( player );
	if #ip <= bufSize then
		writeMemString(amx, refStr, name);
		return true;
	end
	return false;
end

function GetPlayerName ( amx, player, nameBuf, bufSize )
	local name = getPlayerName( player )
	if #name <= bufSize then
		writeMemString( amx, nameBuf, name );
		return true;
	end
	return false;
end

function SetPlayerName ( amx, player, newName )
	return setPlayerName ( player, newName )
end


function RedirectPlayer( amx, player, serverIP, serverPort )
	return redirectPlayer( player, serverIP, serverPort );
end

--getPlayerIdleTime 
--resendPlayerModInfo 
--isVoiceEnabled 
--setPlayerVoiceBroadcastTo 
--setPlayerVoiceIgnoreFrom 
--takePlayerScreenShot





------------------------------------------------------------------------
--PED functions

function CreatePed( amx, model, fX, fY, fZ, fRot, bSynced )
	local ped = createPed( model, fX, fY, fZ, fRot, bSynced );
	local pedID = addElem(g_Peds, ped);
	return pedID; 
end

function SetPedAlpha( amx, ped, alpha )
	return setElementAlpha( ped, alpha );
end
SetPlayerAlpha = SetPedAlpha;

function SetPedHealth( amx, ped, health )
	return setElementHealth( ped, health );
end
SetPlayerHealth = SetPedHealth;

function SetPedFrozen( amx, ped, state )
	return setElementFrozen( ped, state );
end
SetPlayerFrozen = SetPedFrozen;

function GetPedAlpha( amx, ped )
	return getElementAlpha( ped );
end
GetPlayerAlpha = GetPedAlpha;

function GetPedHealth( amx, ped, refHealth )
	local health = getElementHealth( ped );
	writeMemFloat( amx, refHealth, health );
end
GetPlayerHealth = GetPedHealth;

function GetPedFrozen( axm, ped )
	return isElementFrozen( ped );
end
GetPlayerFrozen = GetPedFrozen;

function GetPedPosition( amx, ped, refX, refY, refZ )
	local x, y, z = getElementPosition( ped );
	writeMemFloat( amx, refX, x );
	writeMemFloat( amx, refY, y );
	writeMemFloat( amx, refZ, z );
end
GetPlayerPosition = GetPedPosition;

function SetPedPosition( amx, ped, fX, fY, fZ )
	return setElementPosition( ped, fX, fY, fZ );
end
SetPlayerPosition = SetPedPosition;

function AddPedClothes( amx, ped, clothestex, clothesmodel, clothestype )
	return addPedClothes( ped, clothestex, clothesmodel, clothestype );
end
AddPlayerClothes = AddPedClothes;

function DoesPedHaveJetPack( amx, ped )
	return doesPedHaveJetPack( ped );
end
DoesPlayerHaveJetPack = DoesPedHaveJetPack;

function GetPedAmmoInClip( amx, ped )
	return getPedAmmoInClip( ped );
end
GetPlayerAmmoInClip = GetPedAmmoInClip;

function GetPedArmor( amx, ped )
	return getPedArmor( ped );
end
GetPlayerArmor = GetPedArmor;

--GetPedClothes
--GetPedContactElement

function GetPedFightingStyle( amx, ped )
	return getPedFightingStyle( ped );
end
GetPlayerFightingStyle = GetPedFightingStyle;

function GetPedGravity( amx, ped )
	return getPedGravity( ped );
end
GetPlayerGravity = GetPedGravity;

--[[

--CLIENT ONLY
function GetPedMoveState( amx, ped )
	return getPedMoveState( ped );
end]]

function GetPedOccupiedVehicle( amx, ped )
	local vehicle = getPedOccupiedVehicle( ped );
	
	local vehicleID = getElemID( vehicle )
	
	return vehicleID
end
GetPlayerOccupiedVehicle = GetPedOccupiedVehicle;

function GetPedOccupiedVehicleSeat( amx, ped )
	return getPedOccupiedVehicleSeat( ped );
end
GetPlayerOccupiedVehicleSeat = GetPedOccupiedVehicleSeat;

function GetPedSkin( amx, ped )
	return getElementModel( ped );
end
GetPlayerSkin = GetPedSkin;

function GetPedStat( amx, ped, stat, refValue )
	local f = getPedStat( ped, stat );
	writeMemFloat( amx, refValue, f ); 
end
GetPlayerStat = GetPedStat;

--getPedTarget

function GetPedTotalAmmo( amx, ped )
	return getPedTotalAmmo( ped );
end
GetPlayerTotalAmmo = GetPedTotalAmmo;

--[[
--CLIENT ONLLY
function GetPedVoice( amx, ped )
	return getPedVoice( ped );
end
]]

function GetPedWalkingStyle( amx, ped )
	return getPedWalkingStyle( ped );
end
GetPlayerWalkingStyle = GetPedWalkingStyle;

function GetPedWeapon( amx, ped )
	return getPedWeapon( ped );
end
GetPlayerWeapon = GetPedWeapon;

--[[

function GetPedWeaponMuzzlePosition( amx, ped )

end]]


function GetPedWeaponSlot( amx, ped )
	return getPedWeaponSlot( ped );
end
GetPlayerWeaponSlot = GetPedWeaponSlot;

function IsPedChoking( amx, ped )
	return isPedChoking( ped );
end
IsPlayerChoking = IsPedChoking;

function IsPedDoingGangDriveby( amx, ped )
	return isPedDoingGangDriveby( ped );
end
IsPlayerDoingGangDriveBy = IsPedDoingGangDriveby;

function IsPedDoingTask( amx, ped )
	return isPedDoingTask( ped );
end
IsPlayerDoingTask = IsPedDoingTask;

function IsPedFrozen( amx, ped )
	return isElementFrozen( ped );
end
IsPlayerFrozen = IsPedFrozen;

function IsPedHeadless( amx, ped )
	return isPedHeadless( ped );
end
IsPlayerHeadless = IsPedHeadless;

function IsPedInVehicle( amx, ped )
	return isPedInVehicle( ped );
end
IsPlayerInVehicle = IsPedInVehicle;

function IsPedInWater( amx, ped )
	return isElementInWater( ped );
end
IsPlayerInWater = IsPedInWater;

function IsPedOnFire( amx, ped )
	return isPedOnFire( ped );
end
IsPlayerOnFire = IsPedOnFire;

function IsPedOnGround( amx, ped )
	return isPedOnGround( ped );
end
IsPlayerOnGround = IsPedOnGroud;

--[[
--CLIENT ONLY
function setPedAimTarget( amx, ped, x, y, z )

end]]


function SetPedAnalogControlState( amx, ped, control, analogstate )
	return setPedAnalogControlState( ped, control, analogstate );
end
SetPlayerAnalogControlState = SetPedAnalogControlState;

function SetPedAnimation( amx, ped )
	return setPedAnimation( ped );
end
SetPlayerAnimation = SetPedAnimation;

function SetPedAnimationProgress( amx, ped )
	return setPedAnimationProgress( ped );
end
SetPlayerAnimationProgress = SetPedAnimationProgress;

function SetPedArmor( amx, ped, armor )
	return setPedArmor( ped, armor );
end
SetPlayerArmor = SetPedArmor;

function SetPedChoking( amx, ped, choking )
	return setPedChoking( ped, choking );
end
SetPlayerChoking = SetPedChoking;

function SetPedDoingGangDriveby( amx, ped, bstate )
	return setPedDoingGangDriveby( ped, bstate );
end
SetPlayerDoingDriveBy = SetPedDoingGangDriveby;

function SetPedFightingStyle( amx, ped, style )
	return setPedFightingStyle( ped, style );
end
SetPlayerFightingStyle = SetPedFightingStyle;

function SetPedFrozen( amx, ped, frozen )
	return setElementFrozen( ped, frozen );
end
SetPlayerFrozen = SetPedFrozen;

function SetPedGravity( amx, ped, value )
	return setPedGravity( ped, value );
end
SetPlayerGravity = SetPedGravity;

function SetPedHeadless( amx, ped, headless )
	return setPedHeadless( ped, headless );
end
SetPlayerHeadless = SetPedHeadless;

function SetPedOnFire( amx, ped, onfire )
	return setPedOnFire( ped, onfire );
end
SetPlayerOnFire = SetPedOnFire;

function SetPedStat( amx, ped, stat, fvalue )
	return setPedStat( ped, stat, fvalue );
end
SetPlayerStat = SetPedStat;

function SetPedWeaponSlot( amx, ped, weaponslot )
	return setPedWeaponSlot( ped, weaponslot );
end
SetPlayerWeaponSlot = SetPedWeaponSlot;

function SetPedWalkingStyle( amx, ped, style )
	return setPedWalkingStyle( ped, style );
end
SetPlayerWalkingStyle = SetPedWalkingStyle;

function WarpPedIntoVehicle( amx, ped, vehicle )
	return warpPedIntoVehicle( ped, vehicle );
end
WarpPlayerIntoVehicle = WarpPedIntoVehicle;
------------------------------------------------------------------------
-- Camera functions
function FadeCamera( amx, player, state )
	return fadeCamera( player, state );
end

function SetCameraTarget( amx, player, target )
	return setCameraTarget( player, target );
end


function GetCameraInterior( amx, player )
	return getCameraInterior( player );
end

function GetCameraMatrix( amx, player, refCameraX, refCameraY, refCameraZ, refTargetX, refTargetY, refTargetZ, refRoll, refFov )
	local cameraX, cameraY, cameraZ, targetX, targetY, targetZ, roll, fov = getCameraMatrix( player );
	writeMemFloat(amx, refCameraX, cameraX)
	writeMemFloat(amx, refCameraY, cameraY)
	writeMemFloat(amx, refCameraZ, cameraZ)
	writeMemFloat(amx, refTargetX, targetX)
	writeMemFloat(amx, refTargetY, targetY)
	writeMemFloat(amx, refTargetZ, targetZ)
	writeMemFloat(amx, refRoll, roll)
	writeMemFloat(amx, refFov, fov)
end

--[[
function GetCameraTarget( amx, player )
	local playerID = getElemID( player )
	
	return playerID
end]]

function SetCameraInterior( amx, player, interior )
	return setCameraInterior( player, interior );
end

function SetCameraMatrix( amx, player, positionX, positionY, positionZ )
	return setCameraMatrix( player, positionX, positionY, positionZ );
end



------------------------------------------------------------------------
--Weapon functions ( Sorted )
function GetSlotFromWeapon( amx, weapon )
	return getSlotFromWeapon( weapon );
end

function GetWeaponIDFromName( amx, name )
	return getWeaponIDFromName( name );
end

function GetWeaponNameFromID( amx, id, nameBuf, bufSize )
	local name = getWeaponNameFromID( id );
	if #name <= bufSize then
		writeMemString( amx, nameBuf, name );
		return true;
	end
	return false;
end

function GiveWeapon( amx, player, weapon )
	return giveWeapon( player, weapon );
end

function SetWeaponAmmo( amx, player, weapon, totalAmmo )
	return setWeaponAmmo( player, weapon, totalAmmo );
end

function TakeAllWeapons( amx, player )
	return takeAllWeapons( player );
end

function TakeWeapon( amx, player, weaponid )
	return takeWeapon( player, weaponid );
end

--[[
function GetOriginalWeaponProperty( amx, player, weaponid )
	return getOriginalWeaponProperty( player, weaponid );
end

function GetWeaponProperty( amx, player, weaponid )
	return getWeaponProperty( player, weaponid );
end

function SetWeaponProperty( amx, player, weaponid )
	return setWeaponProperty( player, weaponid );
end]]
















------------------------------------------------------------------------
--Other functions

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
	------------------------------------------------------------------------
	-- Chat
	OutputChatBox = { 'p', 's', 'i', 'i', 'i', 'b' },
	OutputChatBoxToAll = { 's' , 'i', 'i', 'i', 'b' },


	------------------------------------------------------------------------
	-- Vehicle
	AddVehicleUpgrade = { 'v', 'i' },
	AttachTrailerToVehicle = { 'v', 'v' },
	BlowVehicle = { 'v' },
	DetachTrailerFromVehicle = { 'v' },
	CreateVehicle = {'i', 'f', 'f', 'f'},
	FixVehicle = { 'v' },
	--GetVehicleColor
	--getVehicleCompatibleUpgrades
	GetVehicleController = { 'v' },
	GetVehicleDoorState = { 'v', 'i' },
	GetVehicleEngineState = { 'v' },
	GetVehicleLandingGearDown = { 'v' },
	GetVehicleLightState = { 'v' },
	GetVehicleName = { 'v', 'r', 'i' },
	GetVehicleOccupant = { 'v' },
	--GetVehicleOccupants
	GetVehicleOverrideLights = { 'v' },
	GetVehiclePaintjob = { 'v' },
	GetVehiclePanelState = { 'v', 'i' },
	GetVehicleSirensOn = { 'v' },
	--GetVehiclesOfType
	--GetVehicleTowedByVehicle
	--getVehicleTowingVehicle 
	--getVehicleTurnVelocity 
	--getVehicleTurretPosition 
	GetVehicleType = { 'v', 'r', 'i' },
	--getVehicleUpgradeOnSlot 
	--getVehicleUpgrades 
	--getVehicleUpgradeSlotName 
	--getVehicleWheelStates 
	--getVehicleDoorOpenRatio 
	--getVehicleHandling 
	--getModelHandling 
	--getOriginalHandling 
	--isVehicleDamageProof 
	--isVehicleFuelTankExplodable 
	IsVehicleLocked = { 'v' },
	IsVehicleOnGround = { 'v' },
	--removeVehicleUpgrade 
	--resetVehicleExplosionTime 
	--resetVehicleIdleTime 
	RespawnVehicle = { 'v' },
	--setVehicleColor 
	--setVehicleDamageProof 
	--setVehicleDoorState 
	--setVehicleDoorsUndamageable 
	--setVehicleEngineState 
	--setVehicleFuelTankExplodable 
	--setVehicleIdleRespawnDelay 
	--setVehicleLandingGearDown 
	--setVehicleLightState 
	SetVehicleLocked = { 'v', 'b' },
	--setVehicleOverrideLights 
	--setVehiclePaintjob 
	--setVehiclePanelState 
	--setVehicleRespawnDelay 
	--setVehicleRespawnPosition 
	--setVehicleSirensOn 
	--setVehicleTurretPosition 
	--setVehicleDoorOpenRatio 
	--setVehicleHandling 
	--setModelHandling 
	--setVehicleTurnVelocity 
	--setVehicleWheelStates 
	SpawnVehicle = { 'v', 'f', 'f', 'f' },
	--toggleVehicleRespawn 
	--getTrainDirection 
	--getTrainSpeed 
	--getVehicleHeadLightColor 
	--getVehicleModelFromName 
	--getVehicleNameFromModel 
	--isTrainDerailable 
	--isTrainDerailed 
	--isVehicleBlown 
	--isVehicleTaxiLightOn 
	--setTrainDerailable 
	--setTrainDerailed 
	--setTrainDirection 
	--setTrainSpeed 
	--setVehicleHeadLightColor 
	--setVehicleTaxiLightOn 
	--getVehicleVariant 
	--setVehicleVariant 
	--getVehicleSirenParams 
	--removeVehicleSirens 
	--getVehicleSirens 
	--addVehicleSirens 
	--setVehicleSirens 
	SetVehiclePlateText = { 'v', 's' },

	------------------------------------------------------------------------
	--Element-Vehicle
	GetVehiclePosition = {'v', 'r', 'r', 'r'},
	SetVehiclePosition = { 'v', 'f', 'f', 'f' },
	GetVehicleHealth = { 'v', 'r' },
	SetVehicleHealth = { 'v', 'f' };
	SetVehicleAlpha = { 'v', 'i' };
	GetVehicleAlpha = { 'v' };
	
	--- ......
	
	
	------------------------------------------------------------------------
	-- Player
	
	--forcePlayerMap 
	--getAlivePlayers 
	--getDeadPlayers 
	--getPlayerAnnounceValue 
	GetPlayerBlurLevel = { 'p' },
	GetPlayerCount = { },
	GetPlayerMoney = { 'p' },
	--getPlayerNametagColor 
	--getPlayerNametagText
	GetPlayerPing = { 'p' },
	--getPlayerTeam 
	--getPlayerVersion 
	--getPlayerWantedLevel 
	--getRandomPlayer
	GivePlayerMoney = { 'p', 'i' },
	--isPlayerMapForced 
	--isPlayerMuted 
	--isPlayerNametagShowing 
	--setPlayerAnnounceValue 
	SetPlayerBlurLevel = { 'p', 'i' },
	SetPlayerMoney = { 'p', 'i' },
	--setPlayerMuted 
	--setPlayerNametagColor 
	--setPlayerNametagShowing 
	--setPlayerNametagText 
	--setPlayerTeam 
	SetPlayerWantedLevel = { 'p', 'i' },
	--isPlayerHudComponentVisible 
	--showPlayerHudComponent 
	--setPlayerHudComponentVisible
	SpawnPlayer	= { 'p', 'f', 'f', 'f' },
	TakePlayerMoney = { 'p', 'i' },
	GetPlayerFromName = { 's' },
	GetPlayerIP = { 'p', 'r', 'i' },
	GetPlayerName = { 'p', 'r', 'i' },
	SetPlayerName = { 'p', 's' },
	RedirectPlayer = { 'p', 's', 'i' },
	--getPlayerIdleTime 
	--resendPlayerModInfo 
	--isVoiceEnabled 
	--setPlayerVoiceBroadcastTo 
	--setPlayerVoiceIgnoreFrom 
	--takePlayerScreenShot
	SetPlayerAlpha = { 'p', 'i' },
	SetPlayerHealth = { 'p', 'f' },
	SetPlayerFrozen = { 'p', 'b' },
	GetPlayerAlpha = { 'p' },
	GetPlayerHealth = { 'p', 'r' },
	GetPlayerFrozen = { 'p' },
	GetPlayerPosition = { 'p', 'r', 'r', 'r' },
	SetPlayerPosition = { 'p', 'f', 'f', 'f' },
	AddPlayerClothes = { 'p', 's', 's', 'i' },
	DoesPlayerHaveJetPack = { 'p' },
	GetPlayerAmmoInClip = { 'p' },
	GetPlayerArmor = { 'p' },
	--GetPlayerClothes
	--GetPlayerContactElement
	GetPlayerFightingStyle = { 'p' },
	GetPlayerGravity = { 'p' },
	--GetPlayerMoveState
	GetPlayerOccupiedVehicle = { 'p' },
	GetPlayerOccupiedVehicleSeat = { 'p' },
	GetPlayerSkin = { 'p' },
	GetPlayerStat = { 'p', 'i', 'r' },
	--getPlayerTarget
	GetPlayerTotalAmmo = { 'p' },
	--GetPlayerVoice
	GetPlayerWalkingStyle = { 'p' },
	GetPlayerWeapon = { 'p' },
	--GetPlayerWeaponMuzzlePosition
	GetPlayerWeaponSlot = { 'p' },
	IsPlayerChoking = { 'p' },
	IsPlayerDoingGangDriveby = { 'p' },
	--IsPlayerDoingTask ( CLIENT ONLY )
	IsPlayerFrozen = { 'p' },
	IsPlayerHeadless = { 'p' },
	IsPlayerInVehicle = { 'p' },
	IsPlayerInWater = { 'p' },
	IsPlayerOnFire = { 'p' },
	IsPlayerOnGround = { 'p' },
	--SetPlayerAimTarget = { 'p', 'f', 'f', 'f' }, ( CLIENT ONLY )
	SetPlayerAnalogControlState = { 'p', 's', 'f' },
	SetPlayerAnimation = { 'p' },
	SetPlayerAnimationProgress = { 'p' },
	SetPlayerArmor = { 'p', 'f' },
	SetPlayerChoking = { 'p', 'b' },
	SetPlayerDoingGangDriveby = { 'p', 'b' },
	SetPlayerFightingStyle = { 'p', 'i' },
	SetPlayerFrozen = { 'p', 'b' },
	SetPlayerGravity = { 'p', 'f' },
	SetPlayerHeadless = { 'p', 'b' },
	SetPlayerOnFire = { 'p', 'b' },
	SetPlayerStat = { 'p', 'i', 'f' },
	SetPlayerWeaponSlot = { 'p', 'i' },
	SetPlayerWalkingStyle = { 'p', 'i' },
	WarpPlayerIntoVehicle = { 'p', 'v' },




	------------------------------------------------------------------------
	-- Ped functions
	CreatePed = { 'i', 'f', 'f', 'f', 'f', 'i' },
	GetPedPosition = { 'e', 'r', 'r', 'r' },
	SetPedPosition = { 'e', 'f', 'f', 'f' },
	SetPedAlpha = { 'e', 'i' },
	SetPedHealth = { 'e', 'f' },
	SetPedFrozen = { 'e', 'b' },
	GetPedAlpha = { 'e' },
	GetPedHealth = { 'e', 'r' },
	GetPedFrozen = { 'e' },
	AddPedClothes = { 'e', 's', 's', 'i' },
	DoesPedHaveJetPack = { 'e' },
	GetPedAmmoInClip = { 'e' },
	GetPedArmor = { 'e' },
	--GetPedClothes
	--GetPedContactElement
	GetPedFightingStyle = { 'e' },
	GetPedGravity = { 'e' },
	--GetPedMoveState
	GetPedOccupiedVehicle = { 'e' },
	GetPedOccupiedVehicleSeat = { 'e' },
	GetPedSkin = { 'e' },
	GetPedStat = { 'e', 'i', 'r' },
	--getPedTarget
	GetPedTotalAmmo = { 'e' },
	--GetPedVoice
	GetPedWalkingStyle = { 'e' },
	GetPedWeapon = { 'e' },
	--GetPedWeaponMuzzlePosition
	GetPedWeaponSlot = { 'e' },
	IsPedChoking = { 'e' },
	IsPedDoingGangDriveby = { 'e' },
	--IsPedDoingTask ( CLIENT ONLY )
	IsPedFrozen = { 'e' },
	IsPedHeadless = { 'e' },
	IsPedInVehicle = { 'e' },
	IsPedInWater = { 'e' },
	IsPedOnFire = { 'e' },
	IsPedOnGround = { 'e' },
	--SetPedAimTarget = { 'e', 'f', 'f', 'f' }, ( CLIENT ONLY )
	SetPedAnalogControlState = { 'e', 's', 'f' },
	SetPedAnimation = { 'e' },
	SetPedAnimationProgress = { 'e' },
	SetPedArmor = { 'e', 'f' },
	SetPedChoking = { 'e', 'b' },
	SetPedDoingGangDriveby = { 'e', 'b' },
	SetPedFightingStyle = { 'e', 'i' },
	SetPedFrozen = { 'e', 'b' },
	SetPedGravity = { 'e', 'f' },
	SetPedHeadless = { 'e', 'b' },
	SetPedOnFire = { 'e', 'b' },
	SetPedStat = { 'e', 'i', 'f' },
	SetPedWeaponSlot = { 'e', 'i' },
	SetPedWalkingStyle = { 'e', 'i' },
	WarpPedIntoVehicle = { 'e', 'v' },
	--- ......
	
	------------------------------------------------------------------------
	-- Camera
	FadeCamera = { 'p', 'b' },
	GetCameraInterior = { 'p' },
	GetCameraMatrix = { 'p', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r' },
	--GetCameraTarget = { 'p' };
	SetCameraInterior = { 'p', 'i' },
	SetCameraMatrix = { 'p', 'f', 'f', 'f' },
	SetCameraTarget = { 'p', 'p' },

	------------------------------------------------------------------------
	-- Weapon
	GetSlotFromWeapon = { 'i' },
	GetWeaponIDFromName = { 's' },
	GetWeaponNameFromID = { 'i', 'r', 'i' },
	GiveWeapon = { 'p', 'i' },
	SetWeaponAmmo = { 'p', 'i', 'i' },
	TakeAllWeapons = { 'p' },
	TakeWeapon = { 'p', 'i' },
	--GetOriginalWeaponProperty
	--GetWeaponProperty
	--SetWeaponProperty

	
	------------------------------------------------------------------------
	-- Other
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