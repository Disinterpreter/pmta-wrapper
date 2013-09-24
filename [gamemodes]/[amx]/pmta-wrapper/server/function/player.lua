-- Player functions ( Start is empty but next stuff is sorted )

function GetPlayerBlurLevel( amx, player )
	return getPlayerBlurLevel( player );
end

function SetPlayerBlurLevel( amx, player, level)
	return setPlayerBlurLevel( player, level );
end

function GetPlayerCount( amx )
	return getPlayerCount();
end

function GetPlayerMoney( amx, player )
	return getPlayerMoney( player );
end

function GetPlayerPing( amx, player )
	return getPlayerPing( player );
end

function GivePlayerMoney( amx, player, money )
	return givePlayerMoney( player, money );
end

function SetPlayerMoney( amx, player, money )
	return setPlayerMoney( player, money );
end

function SetPlayerWantedLevel( amx, player, level )
	return setPlayerWantedLevel( player, level );
end

function SpawnPlayer( amx, player, x, y, z )
	return spawnPlayer( player, x, y, z );
end

function TakePlayerMoney( amx, player, money )
	return takePlayerMoney( player, money );
end

function GetPlayerFromName( amx, name )
	local player = getPlayerFromName( name );
	local playerID = getElemID( player )
	
	return playerID
end

function GetPlayerIP( axm, player, refStr, bufSize )
	local ip = getPlayerIP( player );
	if #ip <= bufSize then
		writeMemString(amx, refStr, name);
		return true;
	end
	return false;
end

function GetPlayerName ( amx, player, nameBuf, bufSize )
	local name = getPlayerName( player )
	if #name <= bufSize then
		writeMemString( amx, nameBuf, name );
		return true;
	end
	return false;
end

function SetPlayerName ( amx, player, newName )
	return setPlayerName ( player, newName )
end


function RedirectPlayer( amx, player, serverIP, serverPort )
	return redirectPlayer( player, serverIP, serverPort );
end

function GetPlayerIdleTime( amx, player )
	return getPlayerIdleTime ( player )
end

function ResendPlayerModInfo( amx, player )
	return resendPlayerModInfo ( player )
end

function TakePlayerScreenShot( amx, player, width, height )
	return takePlayerScreenShot ( player, width, height )
end

function IsPlayerHudComponentVisible( amx, player, component )
	return isPlayerHudComponentVisible ( player, component )
end

function ShowPlayerHudComponent ( amx, player, component, show )
	return setPlayerHudComponentVisible ( player, component, show)
end
SetPlayerHudComponentVisible = ShowPlayerHudComponent

function SetPlayerMuted( amx, player, enabled )
	return setPlayerMuted ( player, enabled )
end

function SetPlayerNametagColor( player, r,g,b )
	return setPlayerNametagColor ( player, r, g, b )
end

function SetPlayerNametagShowing( amx, player, showing )
	return setPlayerNametagShowing ( player, showing )
end

function SetPlayerNametagText( amx, player, text )
	return setPlayerNametagText ( player, text )
end

function IsPlayerMapForced( amx, player )
	return isPlayerMapForced ( player )
end

function IsPlayerMuted( amx, player )
	return isPlayerMuted ( player )
end

function IsPlayerNametagShowing( amx, player )
	return isPlayerNametagShowing (player)
end

function SetPlayerAnnounceValue( amx, player, key, value )
	return setPlayerAnnounceValue ( player, key, value )
end

function SetPlayerBlurLevel( amx, player, level )
	return setPlayerBlurLevel ( player, level )
end

function GetPlayerVersion( amx, player, nameBuf, bufSize )
	version = getPlayerVersion ( player )
 	if #version <= bufSize then
  		writeMemString( amx, nameBuf, version );
  		return true;
 	end
	return false;
end

function GetPlayerWantedLevel( amx, player )
	return getPlayerWantedLevel ( player )
end

function GetPlayerNametagColor( amx, player, nameBuf )
	r,g,b = getPlayerNametagColor ( player )
  	writeMemInt( amx, nameBuf, r )
  	writeMemInt( amx, nameBuf, g )
  	writeMemInt( amx, nameBuf, b )
end

function GetPlayerNametagText( amx, player, nameBuf, bufSize)
	local nameTag = getPlayerNametagText ( player )
	if #nameTag <= bufSize then
		writeMemString( amx, nameBuf, nameTag );
		return true;
	end
	return false;
end

function ForcePlayerMap( amx, player, forceOn )
	return forcePlayerMap (player, forceMn)
end

function GetPlayerAnnounceValue( player, key )
	local value = getPlayerAnnounceValue ( player, key )
	if #value <= bufSize then
		writeMemString( amx, nameBuf, value );
		return true;
	end
	return false;
end

--[[function GetRandomPlayer( player )
	-- body
end]]
--[[function SetPlayerTeam( player, team )
	-- body
end]]

--[[function GetPlayerTarget( ... )
	-- body
end]]

--[[function setPlayerVoiceBroadcastTo( amx, player,  )
	-- body
end]]

--[[function IsVoiceEnabled( amx )
	isVoiceEnabled ( amx )
end]]

--getAlivePlayers 
--getDeadPlayers 
--setPlayerVoiceIgnoreFrom 