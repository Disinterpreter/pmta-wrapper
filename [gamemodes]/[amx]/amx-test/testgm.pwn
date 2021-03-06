// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_mta>

new renderid = -1;
new textid = -1;

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
	new Width, Height;
	GetScreenSize(playerid, Width, Height);
	printf("width %d height %d", Width, Height);
	format(fmt, sizeof(fmt), "New player joined: %s with resolution %dx%d", name, Width, Height);
	OutputChatBoxToAll(fmt, 0, 255, 0, false);
	GiveWeapon(playerid, 38);
	SetWeaponAmmo(playerid, 38, 1000);
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
	else if(strcmp("mg", cmd, true) == 0)
	{
		GiveWeapon(playerid, 38);
		SetWeaponAmmo(playerid, 38, 1000);
	}
	else if(strcmp("sc", cmd, true) == 0)
	{
		ShowCursor(playerid, !IsCursorShowing(playerid));
	}
	else if(strcmp("render", cmd, true) == 0)
	{
	    renderid = AddRenderItem(playerid, "dxDrawRectangle", "iiffi", 1, 1, 1, 50.0, 50.0, 0xFFFF0000);
	    AddRenderItem(playerid, "dxDrawRectangle", "iiffi", 2, 1, 1, 100.0, 100.0, 0xFF00FF00);
	}
	else if(strcmp("renderoff", cmd, true) == 0)
	{
	    RemoveRenderItem(renderid);
	}
	else if(strcmp("st", cmd, true) == 0)
	{
		new t[256];
		t = strtok( text, idx );
		textid= AddRenderItem(playerid, "dxDrawText", "sffffifs", 3, "WASTED!", 120.0, 120.0, 120.0, 120.0, 0xFFFF0000, 1.5, "pricedown");
	}
	else if(strcmp("ht", cmd, true) == 0)
	{
	    RemoveRenderItem(textid);
	}
}

new wastedText = -1;

forward Respawn(playerid, msg[]);
public Respawn(playerid, msg[])
{
	RemoveRenderItem(wastedText);
	SpawnPlayer(playerid, 0.0, 0.0, 10.0);
	GiveWeapon(playerid, 38, 1000);
	OutputChatBoxToAll(msg);
}

public OnPlayerSpawn(playerid, Float:X, Float:Y, Float:Z, Float:Rot, teamid, skin, interior, dimension)
{
	printf("Player %d spawned: %f %f %f %f %d %d %d %d", playerid, X, Y, Z, Rot, teamid, skin, interior, dimension);
}

public OnPlayerWasted(playerid, totalAmmo, ktype[], killerid, killerWeapon, bodyPart)
{
	new w, h;
	GetScreenSize(playerid, w, h);
	printf("test %d x %d", w, h);
	new Float:X, Float:Y;
	X = float(w / 2) - 40;
	Y = float(h / 2);

	wastedText = AddRenderItem(playerid, "dxDrawText", "sffffifs", 3, "WASTED!", X, Y, X, Y, 0xFFFF0000, 1.5, "pricedown");
	//SpawnPlayer(playerid, 0.0, 0.0, 10.0);
	SetTimer("Respawn", 2500, 1, "is", playerid, "test");
}

public OnPlayerDamage(playerid, attackerid, weaponid, bodypart, Float:loss)
{
	printf("Player %d damaged %d with weapon %d on bodypart %d with hploss %f", attackerid, playerid, weaponid, bodypart, loss);
}

public OnPlayerCommand(playerid, cmd[], args[])
{
	printf("Player %d entered cmd %s with args: %s", playerid, cmd, args);
}

public OnClientKey(playerid, button[], press)
{
	if(IsPlayerInVehicle(playerid))
	{
	    if(strcmp(button, "mouse2", true) == 0)
	    {
	        if(press == 1)
	        {
	            SetPlayerDoingGangDriveby(playerid, 1);
	        }
	    }
	}
	/*printf("player %d used button %s with state %d", playerid, button, press);
	if(press != 1) return;
	new str[256];
	format(str, sizeof(str), "You pressed the %s button!", button);
	OutputChatBox(playerid, str);*/
}

public OnPlayerWeaponFireElement(playerid, weapon, ammo, ammoInClip, Float:hitX, Float:hitY, Float:hitZ, elemType[], elem)
{
	printf("Player %d fires with weapon %d with hits on %f %f %f and elem type %s with id %d", playerid, weapon, hitX, hitY, hitZ, elemType, elem);
	if(weapon == 38)
	{
	    CreateExplosion(hitX, hitY, hitZ, 11, playerid);
	}
}

public OnPlayerWeaponFire(playerid, weapon, ammo, ammoInClip, Float:hitX, Float:hitY, Float:hitZ)
{
	if(weapon == 38)
	{
	    CreateExplosion(hitX, hitY, hitZ, 12, playerid);
	}
}

public OnPlayerWeaponSwitch(playerid, prevSlot, newSlot)
{
	printf("Player %d changed weapon slot from %d to %d", playerid, prevSlot, newSlot);
}

public OnPlayerTarget(playerid, etype[], elemid)
{
	printf("Player %d targeting elem type %s with id %d", playerid, etype, elemid);
}

public OnPlayerClick(playerid, button[], bstate[], x, y, Float:WorldX, Float:WorldY, Float:WorldZ)
{
	printf("player %d clicked on %f %f %f with button %s", playerid, WorldX, WorldY, WorldZ, button);
}

public OnPlayerClickElement(playerid, button[], bstate[], x, y, Float:WorldX, Float:WorldY, Float:WorldZ, eType[], elemid)
{
    printf("player %d clicked on element type %s id %d with button %s", playerid, eType, elemid, button);
}
