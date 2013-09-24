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

////////////////////////////////////////////////////
////////////////////////////////////////////////////
//////////////// Native Functions ///////////////////
////////////////////////////////////////////////////


// Chat natives
native OutputChatBox(playerid, text[], r = 255, g = 255, b = 255, colorCoded = 0);
native OutputChatBoxToAll(text[], r = 255, g = 255, b = 255, colorCoded = 0);

////////////////////////////////////////////////////
// Player natives
//native forcePlayerMap 
//native getAlivePlayers 
//native getDeadPlayers 
//native getPlayerAnnounceValue 
native GetPlayerCount();
native GetPlayerMoney(playerid);
//native getPlayerNametagColor 
//native getPlayerNametagText
native GetPlayerPing(playerid);
//native getPlayerTeam 
//native getPlayerVersion 
//native getPlayerWantedLevel 
//native getRandomPlayer
native GivePlayerMoney(playerid, money);
//native isPlayerMapForced 
//native isPlayerMuted 
//native isPlayerNametagShowing 
//native setPlayerAnnounceValue 
native SetPlayerMoney(playerid, money);
//native setPlayerMuted 
//native setPlayerNametagColor 
//native setPlayerNametagShowing 
//native setPlayerNametagText 
//native setPlayerTeam 
native setPlayerWantedLevel( playerid, level );
//native isPlayerHudComponentVisible 
//native showPlayerHudComponent 
//native setPlayerHudComponentVisible
native SpawnPlayer(playerid, Float:X, Float:Y, Float:Z);
native takePlayerMoney( playerid, money );
native GetPlayerFromName(name[]);
native GetPlayerIP(playerid, ip[], bufSize);
native GetPlayerName(playerid, const nuberplate[], buf);
native SetPlayerName(playerid, newName[], bufSize);
native RedirectPlayer(playerid, host[], port);
//native getPlayerIdleTime 
//native resendPlayerModInfo 
//native isVoiceEnabled 
//native setPlayerVoiceBroadcastTo 
//native setPlayerVoiceIgnoreFrom 
//native takePlayerScreenShot


////////////////////////////////////////////////////
//Element-Player natives
native GetPlayerPosition(playerid, &Float:X, &Float:Y, &Float:Z);
native SetPlayerPosition(playerid, Float:X, Float:Y, Float:Z);
native SetPlayerAlpha(playerid, alpha);
native SetPlayerHealth(playerid, Float:Health);
native SetPlayerFrozen(playerid, state2);
native GetPlayerAlpha(playerid);
native GetPlayerHealth(playerid, &Float:Health);
native GetPlayerFrozen(playerid);
native GetPlayerBlurLevel(playerid);
native SetPlayerBlurLevel(playerid, level);


////////////////////////////////////////////////////
//Camera natives
native FadeCamera(playerid, fadestate);
native GetCameraInterior(playerid);
native GetCameraMatrix(playerid, &Float:refCameraX, &Float:refCameraY, &Float:refCameraZ, &Float:refTargetX, &Float:refTargetY, &Float:refTargetZ, &Float:refRoll, &Float:refFov );
//native GetCameraTarget(playerid)
native SetCameraInterior(playerid, interior);
native SetCameraMatrix(playerid, Float:X, Float:Y, Float:Z);
native SetCameraTarget(playerid, playerid2);


////////////////////////////////////////////////////
// Vehicle natives
native AddVehicleUpgrade(vehicleid, upgradeid); 
native AttachTrailerToVehicle(vehicleid, vehicleid2); 
native BlowVehicle(vehicleid); 
native DetachTrailerFromVehicle(vehicleid); 
native CreateVehicle(model, Float:X, Float:Y, Float:Z);
native FixVehicle (vehicleid);
//navive GetVehicleColor(
//navive getVehicleCompatibleUpgrades(
native GetVehicleController(vehicleid);
native GetVehicleDoorState(vehicleid, door); 
native GetVehicleEngineState(vehicleid); 
native GetVehicleLandingGearDown(vehicleid); 
native GetVehicleLightState(vehicleid); 
native GetVehicleName (vehicleid, const vehiclename[], buf);
native GetVehicleOccupant(vehicleid);
//native GetVehicleOccupants(
native GetVehicleOverrideLights(vehicleid); 
native GetVehiclePaintjob(vehicleid); 
native GetVehiclePanelState(vehicleid, panel); 
native GetVehicleSirensOn(vehicleid); 
//native GetVehiclesOfType(
//native GetVehicleTowedByVehicle(
//native GetVehicleTowingVehicle (
//native GetVehicleTurnVelocity( 
//native GetVehicleTurretPosition (
native GetVehicleType (vehicleid, const vehicletype[], buf);
//native GetVehicleUpgradeOnSlot( 
//native GetVehicleUpgrades( 
//native GetVehicleUpgradeSlotName( 
//native GetVehicleWheelStates( 
//native GetVehicleDoorOpenRatio( 
//native GetVehicleHandling(
//native GetModelHandling(
//native GetOriginalHandling(
//native IsVehicleDamageProof( 
//native IsVehicleFuelTankExplodable( 
native IsVehicleLocked( vehicleid );
native IsVehicleOnGround( vehicleid );
//native RemoveVehicleUpgrade( 
//native ResetVehicleExplosionTime( 
//native ReSetVehicleIdleTime( 
native RespawnVehicle (vehicleid);
//native SetVehicleColor( 
//native SetVehicleDamageProof( 
//native SetVehicleDoorState( 
//native SetVehicleDoorsUndamageable( 
//native SetVehicleEngineState( 
//native SetVehicleFuelTankExplodable( 
//native SetVehicleIdleRespawnDelay( 
//native SetVehicleLandingGearDown( 
//native SetVehicleLightState( 
native SetVehicleLocked (vehicleid, locked);
//native SetVehicleOverrideLights( 
//native SetVehiclePaintjob( 
//native SetVehiclePanelState( 
//native SetVehicleRespawnDelay( 
//native SetVehicleRespawnPosition( 
//native SetVehicleSirensOn( 
//native SetVehicleTurretPosition( 
//native SetVehicleDoorOpenRatio( 
//native SetVehicleHandling( 
//native SetModelHandling( 
//native SetVehicleTurnVelocity( 
//native SetVehicleWheelStates( 
native SpawnVehicle( vehicleid, Float:x, Float:y, Float:z );
//native ToggleVehicleRespawn( 
//native GetTrainDirection( 
//native GetTrainSpeed( 
//native GetVehicleHeadLightColor( 
//native GetVehicleModelFromName( 
//native GetVehicleNameFromModel( 
//native IsTrainDerailable( 
//native IsTrainDerailed( 
//native IsVehicleBlown( 
//native IsVehicleTaxiLightOn( 
//native SetTrainDerailable( 
//native SetTrainDerailed( 
//native SetTrainDirection( 
//native SetTrainSpeed( 
//native SetVehicleHeadLightColor( 
//native SetVehicleTaxiLightOn( 
//native GetVehicleVariant( 
//native SetVehicleVariant( 
//native GetVehicleSirenParams( 
//native RemoveVehicleSirens( 
//native GetVehicleSirens( 
//native AddVehicleSirens( 
//native SetVehicleSirens(
//native GetVehiclePlateText (vehicleid, const nuberplate[], buf);
native SetVehiclePlateText (vehicleid, nuberplate[]);



////////////////////////////////////////////////////
//Element-Vehicle natives
native GetVehiclePosition(vehicleid, &Float:X, &Float:Y, &Float:Z);
native SetVehiclePosition(vehicleid, Float:X, Float:Y, Float:Z);
native GetVehicleHealth (vehicleid, &Float:Health);
native SetVehicleHealth (vehicleid, Float:Health);
native SetVehicleAlpha(vehicleid, alpha);
native GetVehicleAlpha(vehicleid);



////////////////////////////////////////////////////
// Weapon natives
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














// Utility
//----------------------------------------------------------

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

//------------------------------------------------

stock strrest(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}
	new offset = index;
	new result[128];
	while ((index < length) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

//----------------------------------------------------------
// Tokenise by a delimiter
// Return string and index of the end determined by the
// provided delimiter in delim

stock token_by_delim(const string[], return_str[], delim, start_index)
{
	new x=0;
	while(string[start_index] != EOS && string[start_index] != delim) {
	    return_str[x] = string[start_index];
	    x++;
	    start_index++;
	}
	return_str[x] = EOS;
	if(string[start_index] == EOS) start_index = (-1);
	return start_index;
}

//----------------------------------------------------------

stock isNumeric(const string[])
{
  new length=strlen(string);
  if (length==0) return false;
  for (new i = 0; i < length; i++)
    {
      if (
            (string[i] > '9' || string[i] < '0' && string[i]!='-' && string[i]!='+') // Not a number,'+' or '-'
             || (string[i]=='-' && i!=0)                                             // A '-' but not at first.
             || (string[i]=='+' && i!=0)                                             // A '+' but not at first.
         ) return false;
    }
  if (length==1 && (string[0]=='-' || string[0]=='+')) return false;
  return true;
}
