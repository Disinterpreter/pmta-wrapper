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

forward OnGameModeInit();
native GetPlayerPosition(playerid, &Float:X, &Float:Y, &Float:Z);
native CreateVehicle(model, Float:X, Float:Y, Float:Z);
native GetVehiclePosition(vehicleid, &Float:X, &Float:Y, &Float:Z);
native SetVehicleAlpha(model, Float:Alpha);
