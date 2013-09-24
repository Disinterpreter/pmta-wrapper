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

--getPlayerIdleTime 
--resendPlayerModInfo 
--isVoiceEnabled 
--setPlayerVoiceBroadcastTo 
--setPlayerVoiceIgnoreFrom 
--takePlayerScreenShot
--isPlayerHudComponentVisible 
--showPlayerHudComponent 
--setPlayerHudComponentVisible
--setPlayerMuted 
--setPlayerNametagColor 
--setPlayerNametagShowing 
--setPlayerNametagText 
--setPlayerTeam 
--isPlayerMapForced 
--isPlayerMuted 
--isPlayerNametagShowing 
--setPlayerAnnounceValue 
--setPlayerBlurLevel
--getPlayerTeam 
--getPlayerVersion 
--getPlayerWantedLevel 
--getRandomPlayer
--getPlayerNametagColor 
--getPlayerNametagText
--forcePlayerMap 
--getAlivePlayers 
--getDeadPlayers 
--getPlayerAnnounceValue 
--getPlayerBlurLevel 
