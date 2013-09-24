--PED functions

function CreatePed( amx, model, fX, fY, fZ, fRot, bSynced )
	local ped = createPed( model, fX, fY, fZ, fRot, bSynced );
	local pedID = addElem(g_Peds, ped);
	return pedID; 
end

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

function GetPedFightingStyle( amx, ped )
	return getPedFightingStyle( ped );
end
GetPlayerFightingStyle = GetPedFightingStyle;

function GetPedGravity( amx, ped )
	return getPedGravity( ped );
end
GetPlayerGravity = GetPedGravity;

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

function GetPedStat( amx, ped, stat, refValue )
	local f = getPedStat( ped, stat );
	writeMemFloat( amx, refValue, f ); 
end
GetPlayerStat = GetPedStat;

function GetPedTotalAmmo( amx, ped )
	return getPedTotalAmmo( ped );
end
GetPlayerTotalAmmo = GetPedTotalAmmo;

function GetPedWalkingStyle( amx, ped )
	return getPedWalkingStyle( ped );
end
GetPlayerWalkingStyle = GetPedWalkingStyle;

function GetPedWeapon( amx, ped )
	return getPedWeapon( ped );
end
GetPlayerWeapon = GetPedWeapon;

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

function IsPedOnFire( amx, ped )
	return isPedOnFire( ped );
end
IsPlayerOnFire = IsPedOnFire;

function IsPedOnGround( amx, ped )
	return isPedOnGround( ped );
end
IsPlayerOnGround = IsPedOnGroud;

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



--[[

--CLIENT ONLY
function GetPedMoveState( amx, ped )
	return getPedMoveState( ped );
end]]

--getPedTarget
--[[
--CLIENT ONLLY
function GetPedVoice( amx, ped )
	return getPedVoice( ped );
end
]]

--[[

function GetPedWeaponMuzzlePosition( amx, ped )

end]]


--[[
--CLIENT ONLY
function setPedAimTarget( amx, ped, x, y, z )

end]]



--GetPedClothes
--GetPedContactElement