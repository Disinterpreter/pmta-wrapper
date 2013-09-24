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
	
	local vehID = addElem(g_Vehicles, vehicle)
	
	return vehID
end

function FixVehicle ( amx, vehicle )
	return fixVehicle ( vehicle )
end

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

function GetVehicleType ( amx, vehicle, nameBuf, bufSize )
	local vehType = getVehicleType ( vehicle )
	if #vehType <= bufSize then
		writeMemString( amx, nameBuf, vehType );
		return true;
	end
	return false;
end

function IsVehicleLocked( amx, vehicle )
	return isVehicleLocked( vehicle );
end

function IsVehicleOnGround( amx, vehicle )
	return isVehicleOnGround( vehicle );
end


function RespawnVehicle ( amx, vehicle )
	return respawnVehicle ( vehicle )
end

function SetVehicleLocked ( amx ,vehicle, locked )
	return setVehicleLocked ( vehicle, locked )
end

function SpawnVehicle( amx, vehicle, x, y, z )
	return spawnVehicle( vehicle, x, y, z );
end

function SetVehiclePlateText ( amx, vehicle, nuberplate )
	return setVehiclePlateText ( vehicle, nuberplate )
end

function GetVehicleTowingVehicle( amx, invehicle )
	local vehicle = getVehicleTowingVehicle( invehicle )
	
	local vehicleID = getElemID( vehicle )
	
	return vehicleID
end

function GetVehicleTurnVelocity( amx, invehicle, refTurnX, refTurnY, refTurnZ )
	local turnX, turnY, turnZ = getVehicleTurnVelocity( invehicle )
	
	WriteMemFloat( amx, refTurnX, turnX );
	WriteMemFloat( amx, refTurnY, turnY );
	WriteMemFloat( amx, refTurnZ, turnZ );
end

function GetVehicleTurretPosition( amx, vehicle, refX, refY )
	local x, y = getVehicleTurretPosition( vehicle );
	
	WriteMemFloat( amx, refX, x );
	WriteMemFloat( amx, refY, y );
end

function GetVehicleUpgradeOnSlot( amx, vehicle, slot )
	return getVehicleUpgradeOnSlot( vehicle, slot );
end

function GetVehicleUpgradeSlotName( amx, id, nameBuf, bufSize )
	local name = getVehicleUpgradeSlotName( id );
	if #name <= bufSize then
		writeMemString( amx, nameBuf, name );
		return true;
	end
	return false;
end

function GetVehicleWheelStates( amx, vehicle, refState1, refState2, refState3, refState4 )
	local state1, state2, state3, state4 = getVehicleWheelStates( vehicle );
	
	WriteMemInt( amx, refState1, state1 );
	WriteMemInt( amx, refState2, state2 );
	WriteMemInt( amx, refState3, state3 );
	WriteMemInt( amx, refState4, state4 );
end

function GetVehicleDoorOpenRatio( amx, vehicle, refRatio, )
	local ratio = getVehicleDoorOpenRatio( vehicle );
	
	WriteMemFloat( amx, refRatio, ratio );
end

function IsVehicleDamageProof( amx, vehicle )
	return isVehicleDamageProof( vehicle );
end

function IsVehicleFuelTankExplodable( amx, vehicle )
	return isVehicleFuelTankExplodable( vehicle );
end

function RemoveVehicleUpgrade( amx, vehicle, upgradeid )
	return removeVehicleUpgrade( vehicle, upgradeid );
end

function ResetVehicleExplosionTime( amx, vehicle )
	return resetVehicleExplosionTime( vehicle );
end

function ResetVehicleIdleTime( amx, vehicle )
	return resetVehicleIdleTime( vehicle );
end

function SetVehicleDamageProof( amx, vehicle, damageproof )
	return setVehicleDamageProof( vehicle, damageproof )
end

function SetVehicleDoorState( amx, vehicle, door, state )
	return setVehicleDoorState( vehicle, door, state );
end

function SetVehicleDoorsUndamageable( amx, vehicle, undamage )
	return setVehicleDoorsUndamageable( vehicle, undamage );
end

function SetVehicleEngineState( amx, vehicle, state )
	return setVehicleEngineState( vehicle, state );
end

function SetVehicleFuelTankExplodable( amx, vehicle, enabled )
	return setVehicleFuelTankExplodable( vehicle, enabled );
end

function SetVehicleIdleRespawnDelay( amx, vehicle, delay )
	return setVehicleIdleRespawnDelay( vehicle );
end

function SetVehicleLandingGearDown( amx, vehicle, enabled )
	return setVehicleLandingGearDown( vehicle, enabled );
end

function SetVehicleLightState( amx, vehicle, light, lightstate )
	return setVehicleLightState( vehicle, light, lightstate );
end

function SetVehicleOverrideLights( amx, vehicle, value )
	return setVehicleOverrideLights( vehicle, value );
end

function SetVehiclePaintjob( amx, vehicle, paintjobid )
	return setVehiclePaintjob( vehicle, paintjob );
end

function SetVehiclePanelState( amx, vehicle, panelID, state )
	return setVehiclePanelState ( vehicle, panelID, state );
end

function SetVehicleRespawnDelay( amx, vehicle, timeDelay )
	return setVehicleRespawnDelay( vehicle, timeDelay );
end

function SetVehicleRespawnPosition( amx, vehicle, x, y, z )
	return setVehicleRespawnPosition( vehicle, x, y, z );
end

function SetVehicleSirensOn( amx, vehicle, enabled )
	return setVehicleSirensOn( vehicle, enabled );
end

function SetVehicleTurretPosition( amx, vehicle, x, y, z )
	return setVehicleTurretPosition( vehicle, x, y, z );
end

function SetVehicleDoorOpenRatio( amx, vehicle, door, ratio )
	return setVehicleDoorOpenRatio( vehicle, door, ratio );
end

function SetVehicleTurnVelocity( amx, vehicle, turnX, turnY, turnZ )
	return setVehicleTurnVelocity( vehicle, turnX, turnY, turnZ );
end

function SetVehicleWheelStates( amx, vehicle, frontLeft )
	return setVehicleWheelStates( vehicle, frontLeft );
end

function ToggleVehicleRespawn( amx, vehicle, respawn )
	return toggleVehicleRespawn( vehicle, respawn );
end

function GetTrainDirection( amx, vehicle )
	return getTrainDirection( vehicle );
end

function GetTrainSpeed( amx, vehicle )
	return getTrainSpeed( vehicle );
end

function GetVehicleHeadLightColor( amx, vehicle, refR, refG, refB )
	local r, g, b = getVehicleHeadLightColor( vehicle )
	
	WriteMemInt( amx, refR, r );
	WriteMemInt( amx, refG, g );
	WriteMemInt( amx, refB, b );
end

function GetVehicleModelFromName( amx, name )
	return getVehicleModelFromName( name );
end

function GetVehicleNameFromModel( amx, id, nameBuf, bufSize )
	local vehName = GetVehicleNameFromModel( id );
	if #vehName <= bufSize then
		writeMemString( amx, nameBuf, vehName );
		return true;
	end
	return false;
end

function IsTrainDerailable( amx, vehicle )
	return isTrainDerailable( vehicle );
end

function IsTrainDerailed( amx, vehicle )
	return isTrainDerailed( vehicle );
end

function IsVehicleBlown( amx, vehicle )
	return isVehicleBlown( vehicle );
end

function IsVehicleTaxiLightOn( amx, vehicle )
	return isVehicleTaxiLightOn( vehicle );
end

function SetTrainDerailable( amx, vehicle, derailable )
	return setTrainDerailable( vehicle, derailable );
end

function SetTrainDerailed( amx, vehicle, derailed )
	return setTrainDerailed( vehicle, derailed );
end

function SetTrainDirection( amx, vehicle, clockwise )
	return setTrainDirection( vehicle, clockwise );
end

function SetTrainSpeed( amx, vehicle, speed )
	return setTrainSpeed( amx, vehicle, speed );
end

function SetVehicleHeadLightColor( amx, vehicle, r, g, b )
	return setVehicleHeadLightColor( vehicle, r, g, b );
end

function SetVehicleTaxiLightOn( amx, vehicle, lightState )
	return setVehicleTaxiLightOn( vehicle, lightstate );
end

function GetVehicleVariant( amx, vehicle, refVar1, refVar2 )
	local var1, var2 = getVehicleVariant( vehicle );
	
	WriteMemInt( amx, refVar1, var1 );
	WriteMemInt( amx, refVar2, var2 );
end

function SetVehicleVariant( amx, vehicle )
	return setVehicleVariant( vehicle );
end

function RemoveVehicleSirens( amx, vehicle )
	return removeVehicleSirens( vehicle );
end

function AddVehicleSirens( amx, vehicle, sirenCount, sirenType )
	return addVehicleSirens( vehicle, sirenCount, sirenType );
end

function SetVehicleSirens( amx, vehicle, sirenPoint, posX, posY, posZ, red, green, blue )
	return setVehicleSirens( vehicle, sirenPoint, posX, posY, posZ, red, green, blue );
end

--[[
function SetVehicleColor( amx, vehicle )
	
end]]

--[[
function GetVehicleColor( amx, vehicle )

end

function getVehicleCompatibleUpgrades( amx, vehicle )

end
]]

--[[
function GetVehicleOccupants( amx, vehicle )

end
]]

--[[

function GetVehiclesOfType( amx, model )

end
]]

--[[
function GetVehicleTowedByVehicle( )

end
]]

--getVehicleUpgrades  
--getVehicleHandling 
--getModelHandling 
--getOriginalHandling 
--setVehicleHandling 
--setModelHandling 
--getVehicleSirenParams 
--getVehicleSirens 
