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
	
	new name[256];
	GetPlayerName(playerid, name, sizeof(name));
	new fmt[256];
	format(fmt, sizeof(fmt), "New player joined: %s", name);
	OutputChatBoxToAll(fmt, 0, 255, 0, false);
}

public OnPlayerChat(playerid, msg[], msgType)
{
	printf("Player %d said: %s with type %d", playerid, msg, msgType);
}

public OnPlayerConsole(playerid, text[])
{
	printf("Player %d typed in console: %s", playerid, text);
	
	new idx;
	new cmd[256];

	cmd = strtok(text, idx);
	
	new Float:X, Float:Y, Float:Z;
	GetPlayerPosition(playerid, X, Y, Z);
	
	if(strcmp("car", cmd, true) == 0) // spawn car
	{

		new id = CreateVehicle(540, X + 5.0, Y, Z);
		WarpPlayerIntoVehicle(playerid, id);
		CreateBlipAttachedToVehicle(id);
	}
	else if(strcmp("cped", cmd, true) == 0) // create ped with alpha
	{
	    new ped = CreatePed(0, X + 2.0, Y, Z);
	    new msg[256];
	    new Float:fX, Float:fY, Float:fZ;
	    GetPedPosition(ped, fX, fY, fZ);
	    format(msg, sizeof(msg), "ped created: %d %f %f %f", ped, fX, fY, fZ);
	    OutputChatBoxToAll(msg);
	    SetPedAlpha(ped, 230);
	}
	else if(strcmp("alpha", cmd, true) == 0)
	{
		SetPlayerAlpha(playerid, 230);
	}
	else if(strcmp("infos", cmd, true) == 0)
	{
		new id = -1;
		id = DisplayInfo(playerid, "TEST BIATCH!!111");
		new str[256];
		format(str, sizeof(str), "Created label with id %d", id);
		ChangeInfo(playerid, id, "kenixgay");
		OutputChatBoxToAll(str);
	}
	else if(strcmp("marker", cmd, true) == 0)
	{
	    new id = CreateMarker(X + 5.0, Y, Z);
	    SetMarkerColor(id, 0, 0, 255);
	    SetMarkerSize(id, 5.0);
	}
}

public OnPlayerSpawn(playerid, Float:X, Float:Y, Float:Z, Float:Rot, teamid, skin, interior, dimension)
{
	printf("Player %d spawned: %f %f %f %f %d %d %d %d", playerid, X, Y, Z, Rot, teamid, skin, interior, dimension);
}

public OnPlayerDamage(playerid, attackerid, weaponid, bodypart, Float:loss)
{
	printf("Player %d damaged %d with weapon %d on bodypart %d with hploss %f", attackerid, playerid, weaponid, bodypart, loss);
}

public OnPlayerCommand(playerid, cmd[], args[])
{
	printf("Player %d entered cmd %s with args: %s", playerid, cmd, args);
}
