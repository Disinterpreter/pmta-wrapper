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

// Player natives
native SpawnPlayer(playerid, Float:X, Float:Y, Float:Z);
native FadeCamera(playerid, fadestate);
native SetCameraTarget(playerid, playerid2);
native GetPlayerPosition(playerid, &Float:X, &Float:Y, &Float:Z);


// Vehicle natives
native CreateVehicle(model, Float:X, Float:Y, Float:Z);
native GetVehiclePosition(vehicleid, &Float:X, &Float:Y, &Float:Z);
native SetVehicleAlpha(model, Float:Alpha);
