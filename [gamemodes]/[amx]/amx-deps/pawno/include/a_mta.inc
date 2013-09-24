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
native DisplayInfo(playerid, str[]);
native ChangeInfo(playerid, infoid, str[]);
////////////////////////////////////////////////////
// Player natives
native GetPlayerCount();
native GetPlayerMoney(playerid);
native GivePlayerMoney(playerid, money);
native SetPlayerMoney(playerid, money);
native setPlayerWantedLevel( playerid, level );
native GetPlayerPing(playerid);
native SpawnPlayer(playerid, Float:X, Float:Y, Float:Z);
native takePlayerMoney( playerid, money );
native GetPlayerFromName(name[]);
native GetPlayerIP(playerid, ip[], bufSize);
native GetPlayerName(playerid, const nuberplate[], buf);
native SetPlayerName(playerid, newName[], bufSize);
native RedirectPlayer(playerid, host[], port);
native AddPlayerClothes( Playerid, clothestex[], clothesmodel[], clothestype );
native DoesPlayerHaveJetPack( Playerid );
native GetPlayerAmmoInClip( Playerid );
native GetPlayerArmor( Playerid );
native GetPlayerFightingStyle( Playerid );
native GetPlayerGravity( Playerid );
native GetPlayerOccupiedVehicle( Playerid );
native GetPlayerOccupiedVehicleSeat( Playerid );
native GetPlayerStat( Playerid, statid, &Float:value );
native GetPlayerTotalAmmo( Playerid );
native GetPlayerWalkingStyle( Playerid );
native GetPlayerWeapon( Playerid );
native GetPlayerWeaponSlot( Playerid );
native IsPlayerChoking( Playerid );
native IsPlayerDoingGangDriveby( Playerid );
native IsPlayerHeadless( Playerid );
native IsPlayerInVehicle( Playerid );
native IsPlayerOnFire( Playerid );
native IsPlayerOnGround( Playerid );
native SetPlayerAnalogControlState( Playerid, analog[], &Float:fstate );
native SetPlayerAnimation( Playerid );
native SetPlayerAnimationProgress( Playerid );
native SetPlayerArmor( Playerid, Float:armor );
native SetPlayerChoking( Playerid, choking );
native SetPlayerDoingGangDriveby( Playerid, driveby );
native SetPlayerFightingStyle( Playerid, style );
native SetPlayerGravity( Playerid, Float:gravity );
native SetPlayerHeadless( Playerid, headless );
native SetPlayerOnFire( Playerid, onfire );
native SetPlayerStat( Playerid, statid, Float:value );
native SetPlayerWeaponSlot( Playerid, slotid );
native SetPlayerWalkingStyle( Playerid, styleid );
native WarpPlayerIntoVehicle( Playerid, vehicleid );
native GetPlayerBlurLevel(playerid);
native SetPlayerBlurLevel(playerid, level);
//native getPlayerIdleTime 
//native resendPlayerModInfo 
//native isVoiceEnabled 
//native setPlayerVoiceBroadcastTo 
//native setPlayerVoiceIgnoreFrom 
//native takePlayerScreenShot
//native GetPlayerClothes( Playerid );
//native GetPlayerContactElement( Playerid );
//native GetPlayerMoveState( Playerid );
//native getPlayerTarget( Playerid );
//native GetPlayerVoice( Playerid );
//native GetPlayerWeaponMuzzlePosition( Playerid );
//native IsPlayerDoingTask( Playerid ); ( CLIENT ONLY )
//native SetPlayerAimTarget( Playerid, Float:x, Float:y, Float:z ); ( CLIENT ONLY )
//native getPlayerNametagColor 
//native getPlayerNametagText
//native getPlayerTeam 
//native getPlayerVersion 
//native getPlayerWantedLevel 
//native getRandomPlayer
//native isPlayerMapForced 
//native isPlayerMuted 
//native isPlayerNametagShowing 
//native setPlayerAnnounceValue 
//native setPlayerMuted 
//native setPlayerNametagColor 
//native setPlayerNametagShowing 
//native setPlayerNametagText 
//native setPlayerTeam 
//native isPlayerHudComponentVisible 
//native showPlayerHudComponent 
//native setPlayerHudComponentVisible
//native forcePlayerMap 
//native getAlivePlayers 
//native getDeadPlayers 
//native getPlayerAnnounceValue 

////////////////////////////////////////////////////
//Element natives

////////////////////////////////////////////////////
//Element natives
native GetPedPosition( pedid, &Float:X, &Float:Y, &Float:Z );
native SetPedPosition( pedid, Float:X, Float:Y, Float:Z );
native GetPedRotation( pedid, &Float:rotX, &Float:rotY, &Float:rotZ );
native SetPedRotation( pedid, Float:rotX, Float:rotY, Float:rotZ );
native GetPedInterior( pedid );
native SetPedInterior( pedid, interior );
native GetPedDimension( pedid );
native SetPedDimension( pedid, dimension );
native GetPedVelocity( pedid, &Float:velX, &Float:velY, &Float:velZ );
native SetPedVelocity( pedid, Float:velX, Float:velY, Float:velZ );
native GetPedAlpha( pedid );
native SetPedAlpha( pedid, alpha );
native GetPedHealth( pedid, &Float:Health );
native SetPedHealth( pedid, Float:health );
native IsPedFrozen( pedid );
native SetPedFrozen( pedid, frozen );
native GetPedSkin( pedid );
native SetPedSkin( pedid, skin );
native IsPedInWater( pedid );

native GetVehiclePosition( vehicleid, &Float:X, &Float:Y, &Float:Z );
native SetVehiclePosition( vehicleid, Float:X, Float:Y, Float:Z );
native GetVehicleRotation( vehicleid, &Float:rotX, &Float:rotY, &Float:rotZ );
native SetVehicleRotation( vehicleid, Float:rotX, Float:rotY, Float:rotZ );
native GetVehicleInterior( vehicleid );
native SetVehicleInterior( vehicleid, interior );
native GetVehicleDimension( vehicleid );
native SetVehicleDimension( vehicleid, dimension );
native GetVehicleVelocity( vehicleid, &Float:velX, &Float:velY, &Float:velZ );
native SetVehicleVelocity( vehicleid, Float:velX, Float:velY, Float:velZ );
native GetVehicleAlpha( vehicleid );
native SetVehicleAlpha( vehicleid, alpha );
native GetVehicleHealth( vehicleid, &Float:Health );
native SetVehicleHealth( vehicleid, Float:health );
native IsVehicleFrozen( vehicleid );
native SetVehicleFrozen( vehicleid, frozen );
native GetVehicleModel( vehicleid );
native SetVehicleModel( vehicleid, model );
native IsVehicleInWater( vehicleid );

native GetPlayerPosition( playerid, &Float:X, &Float:Y, &Float:Z );
native SetPlayerPosition( playerid, Float:X, Float:Y, Float:Z );
native GetPlayerRotation( playerid, &Float:rotX, &Float:rotY, &Float:rotZ );
native SetPlayerRotation( playerid, Float:rotX, Float:rotY, Float:rotZ );
native GetPlayerInterior( playerid );
native SetPlayerInterior( playerid, interior );
native GetPlayerDimension( playerid );
native SetPlayerDimension( playerid, dimension );
native GetPlayerVelocity( playerid, &Float:velX, &Float:velY, &Float:velZ );
native SetPlayerVelocity( playerid, Float:velX, Float:velY, Float:velZ );
native GetPlayerAlpha( playerid );
native SetPlayerAlpha( playerid, alpha );
native GetPlayerHealth( playerid, &Float:Health );
native SetPlayerHealth( playerid, Float:health );
native IsPlayerFrozen( playerid );
native SetPlayerFrozen( playerid, frozen );
native GetPlayerSkin( playerid );
native SetPlayerSkin( playerid, skin );
native IsPlayerInWater( playerid );


////////////////////////////////////////////////////
//Element-Ped natives
native CreatePed(modelid, Float:X, Float:Y, Float:Z, Float:Rot = 0.0, sync = 1);
native AddPedClothes( pedid, clothestex[], clothesmodel[], clothestype );
native DoesPedHaveJetPack( pedid );
native GetPedAmmoInClip( pedid );
native GetPedArmor( pedid );
native GetPedFightingStyle( pedid );
native GetPedGravity( pedid );
native GetPedOccupiedVehicle( pedid );
native GetPedOccupiedVehicleSeat( pedid );
native GetPedStat( pedid, statid, &Float:value );
native GetPedTotalAmmo( pedid );
native GetPedWalkingStyle( pedid );
native GetPedWeapon( pedid );
native GetPedWeaponSlot( pedid );
native IsPedChoking( pedid );
native IsPedDoingGangDriveby( pedid );
native IsPedHeadless( pedid );
native IsPedInVehicle( pedid );
native IsPedOnFire( pedid );
native IsPedOnGround( pedid );
native SetPedAnalogControlState( pedid, analog[], &Float:fstate );
native SetPedAnimation( pedid );
native SetPedAnimationProgress( pedid );
native SetPedArmor( pedid, Float:armor );
native SetPedChoking( pedid, choking );
native SetPedDoingGangDriveby( pedid, driveby );
native SetPedFightingStyle( pedid, style );
native SetPedGravity( pedid, Float:gravity );
native SetPedHeadless( pedid, headless );
native SetPedOnFire( pedid, onfire );
native SetPedStat( pedid, statid, Float:value );
native SetPedWeaponSlot( pedid, slotid );
native SetPedWalkingStyle( pedid, styleid );
native WarpPedIntoVehicle( pedid, vehicleid );
//native GetPedMoveState( pedid );
//native GetPedClothes( pedid );
//native GetPedContactElement( pedid );
//native SetPedAimTarget( pedid, Float:x, Float:y, Float:z ); ( CLIENT ONLY )
//native IsPedDoingTask( pedid ); ( CLIENT ONLY )
//native GetPedWeaponMuzzlePosition( pedid );
//native getPedTarget( pedid );
//native GetPedVoice( pedid );

////////////////////////////////////////////////////
//Camera natives
native FadeCamera(playerid, fadestate);
native GetCameraInterior(playerid);
native GetCameraMatrix(playerid, &Float:refCameraX, &Float:refCameraY, &Float:refCameraZ, &Float:refTargetX, &Float:refTargetY, &Float:refTargetZ, &Float:refRoll, &Float:refFov );
native SetCameraInterior(playerid, interior);
native SetCameraMatrix(playerid, Float:X, Float:Y, Float:Z);
native SetCameraTarget(playerid, playerid2);
//native GetCameraTarget(playerid)

////////////////////////////////////////////////////
// Vehicle natives
native AddVehicleUpgrade(vehicleid, upgradeid); 
native AttachTrailerToVehicle(vehicleid, vehicleid2); 
native BlowVehicle(vehicleid); 
native DetachTrailerFromVehicle(vehicleid); 
native CreateVehicle(model, Float:X, Float:Y, Float:Z);
native FixVehicle (vehicleid);
native GetVehicleController(vehicleid);
native GetVehicleDoorState(vehicleid, door); 
native GetVehicleEngineState(vehicleid); 
native GetVehicleLandingGearDown(vehicleid); 
native GetVehicleLightState(vehicleid); 
native GetVehicleName (vehicleid, const vehiclename[], buf);
native GetVehicleOccupant(vehicleid);
native GetVehicleOverrideLights(vehicleid); 
native GetVehiclePaintjob(vehicleid); 
native GetVehiclePanelState(vehicleid, panel); 
native GetVehicleSirensOn(vehicleid); 
native GetVehicleType (vehicleid, const vehicletype[], buf);
native IsVehicleLocked( vehicleid );
native IsVehicleOnGround( vehicleid );
native SpawnVehicle( vehicleid, Float:x, Float:y, Float:z );
native RespawnVehicle (vehicleid);
native SetVehicleLocked (vehicleid, locked);
native SetVehiclePlateText (vehicleid, nuberplate[]);
//native GetVehicleOccupants(
//native GetVehiclesOfType(
//native GetVehicleTowedByVehicle(
//native GetVehicleTowingVehicle (
//native GetVehicleTurnVelocity( 
//native GetVehicleTurretPosition (
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
//native RemoveVehicleUpgrade( 
//native ResetVehicleExplosionTime( 
//native ReSetVehicleIdleTime( 
//native SetVehicleColor( 
//native SetVehicleDamageProof( 
//native SetVehicleDoorState( 
//native SetVehicleDoorsUndamageable( 
//native SetVehicleEngineState( 
//native SetVehicleFuelTankExplodable( 
//native SetVehicleIdleRespawnDelay( 
//native SetVehicleLandingGearDown( 
//native SetVehicleLightState( 
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
//navive GetVehicleColor(
//navive getVehicleCompatibleUpgrades(
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
