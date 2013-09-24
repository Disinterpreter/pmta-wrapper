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

--getVehicleTowingVehicle 
--getVehicleTurnVelocity 
--getVehicleTurretPosition 
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
--removeVehicleUpgrade 
--resetVehicleExplosionTime 
--resetVehicleIdleTime 
--setVehicleColor 
--setVehicleDamageProof 
--setVehicleDoorState 
--setVehicleDoorsUndamageable 
--setVehicleEngineState 
--setVehicleFuelTankExplodable 
--setVehicleIdleRespawnDelay 
--setVehicleLandingGearDown 
--setVehicleLightState 
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
