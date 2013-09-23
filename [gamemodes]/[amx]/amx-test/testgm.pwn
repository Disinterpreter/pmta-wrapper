// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_mta>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	printf("OnGameModeInit()");
	new id = CreateVehicle(540, 50.0, 50.0, 50.0);
	new Float:X, Float:Y, Float:Z;
	GetVehiclePosition(id, X, Y, Z);
	printf("Vehicle pos: %f %f %f", X, Y, Z);
	return 1;
}

public OnPlayerConnect(playerid)
{
	printf("OnPlayerConnect(%d);", playerid);
	FadeCamera(playerid, 1);
	SpawnPlayer(playerid, 0.0, 0.0, 10.0);
	SetCameraTarget(playerid, playerid);
}
