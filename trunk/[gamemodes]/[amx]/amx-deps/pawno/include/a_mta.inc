/*  MTA AMX compatibility layer
 *
 *  Extension functions
 */

#if defined _amx_included
	#endinput
#endif
#define _amx_included

#include <core>
#include <float>
#include <string>
#include <file>
#include <time>
#include <datagram>
// Util
native print(const string[]);
native printf(const format[], {Float,_}:...);
native format(output[], len, const format[], {Float,_}:...);
native Float:asin(Float:value);
native Float:acos(Float:value);
native Float:atan(Float:value);
native Float:atan2(Float:x, Float:y);

// MTA
native lua(const fn[], {Float,_}:...);
native amxRegisterPawnPrototypes(const prototype[][]);
native amxVersion(&Float:ver);
native amxVersionString(buffer[], maxsize);
native md5hash(str[], const buf[], bufsize);

// Callbacks
forward OnGameModeInit();
forward OnPlayerConnect(playerid);
forward OnPlayerChat(playerid, msg[], msgType);
forward OnPlayerConsole(playerid, text[]);
forward OnPlayerCommand(playerid, cmd[], args[]);
forward OnPlayerSpawn(playerid, Float:X, Float:Y, Float:Z, Float:Rot, teamid, skin, interior, dimension);
forward OnPlayerDamage(playerid, attackerid, weaponid, bodypart, Float:loss);

// Player natives
native SpawnPlayer(playerid, Float:X, Float:Y, Float:Z);
native FadeCamera(playerid, fadestate);
native SetCameraTarget(playerid, playerid2);
native GetPlayerPosition(playerid, &Float:X, &Float:Y, &Float:Z);
native GetPlayerName(playerid, const nuberplate[], buf);
native SetPlayerName(playerid, newName[], bufSize);
native GetPlayerMoney(playerid);
native GetPlayerPing(playerid);
native GivePlayerMoney(playerid, money);
native SetPlayerMoney(playerid, money);
native GetPlayerIP(playerid);
native GetPlayerFromName(name[]);
native RedirectPlayer(playerid, host[], port);
native SetPlayerAlpha(playerid, alpha);
native SetPlayerHealth(playerid, Float:Health);
native SetPlayerFrozen(playerid, state2);
native GetPlayerAlpha(playerid);
native GetPlayerHealth(playerid, &Float:Health);
native GetPlayerFrozen(playerid);







//Camera natives
native GetCameraInterior(playerid);
native GetCameraMatrix(playerid, &Float:refCameraX, &Float:refCameraY, &Float:refCameraZ, &Float:refTargetX, &Float:refTargetY, &Float:refTargetZ, &Float:refRoll, &Float:refFov );
//native GetCameraTarget(playerid)
native SetCameraInterior(playerid, interior);
native SetCameraMatrix(playerid, Float:X, Float:Y, Float:Z);


// Vehicle natives
native AddVehicleUpgrade(vehicleid, upgradeid); 
native AttachTrailerToVehicle(vehicleid, vehicleid2); 
native BlowVehicle(vehicleid); 
native DetachTrailerFromVehicle(vehicleid); 
native CreateVehicle(model, Float:X, Float:Y, Float:Z);
navive FixVehicle (vehicleid);
//navive GetVehicleColor
//navive getVehicleCompatibleUpgrades
native GetVehicleController(vehicleid);
native GetVehicleDoorState(vehicleid, door); 
native GetVehicleEngineState(vehicleid); 
native GetVehicleLandingGearDown(vehicleid); 
native GetVehicleLightState(vehicleid); 
native GetVehicleName (vehicleid, const vehiclename[], buf);
native GetVehicleOccupant(vehicleid);
//native GetVehicleOccupants 
native GetVehicleOverrideLights(vehicleid); 
native GetVehiclePaintjob(vehicleid); 
native GetVehiclePanelState(vehicleid, panel); 
native GetVehicleSirensOn(vehicleid); 
//native GetVehiclesOfType
//native GetVehicleTowedByVehicle


native GetVehiclePosition(vehicleid, &Float:X, &Float:Y, &Float:Z);
native SetVehicleAlpha(vehicleid, Float:Alpha);
native GetVehiclePlateText (vehicleid, const nuberplate[], buf);
native SetVehiclePlateText (vehicleid, nuberplate[]);
native GetVehicleHealth (vehicleid, &Float:Health);
native SetVehicleHealth (vehicleid, Float:Health);
native SetVehicleLocked (vehicleid, locked);
native RespawnVehicle (vehicleid);
native GetVehicleType (vehicleid, const vehicletype[], buf);















































// Weapon
native GetSlotFromWeapon(idweapon);
native GetWeaponIDFromName(weaponname[]);
native GetWeaponNameFromID(weaponid, const name[], bufsize);
native GiveWeapon(playerid, weaponid);
native SetWeaponAmmo( playerid, weaponid, ammo );
native TakeAllWeapons( playerid );
native TakeWeapon( playerid, weaponid );
//native GetOriginalWeaponProperty
//native GetWeaponProperty
//native SetWeaponProperty
