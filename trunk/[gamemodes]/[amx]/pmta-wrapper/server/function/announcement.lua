function GetGameType ( amx, bufSize, refGame )
	local gametype = getGameType (  );
	if #gametype <= bufSize then
		writeMemString(amx, refGame, gametype);
		return true;
	end
	return false;
end

function GetMapName ( amx, refMap, bufSize )
	local mapName = getMapName (  );
	if #mapName <= bufSize then
		writeMemString(amx, refMap, mapName);
		return true;
	end
	return false;
end

function GetRuleValue ( amx, key, refKey, bufSize )
	local value = getRuleValue ( key );
	if #value <= bufSize then
		writeMemString(amx, refKey, value);
		return true;
	end
	return false;
end

function RemoveRuleValue ( amx, key )
	return removeRuleValue ( key );
end

function SetGameType ( amx, gameType )
	return setGameType ( gameType );
end

function SetMapName ( amx, mapName )
	return setMapName ( mapName );
end

function SetRuleValue( amx, key, value )
	return setRuleValue ( key, value );
end