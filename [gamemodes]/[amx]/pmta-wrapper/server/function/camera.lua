-- Camera functions
function FadeCamera( amx, player, state )
	return fadeCamera( player, state );
end

function SetCameraTarget( amx, player, target )
	return setCameraTarget( player, target );
end


function GetCameraInterior( amx, player )
	return getCameraInterior( player );
end

function GetCameraMatrix( amx, player, refCameraX, refCameraY, refCameraZ, refTargetX, refTargetY, refTargetZ, refRoll, refFov )
	local cameraX, cameraY, cameraZ, targetX, targetY, targetZ, roll, fov = getCameraMatrix( player );
	writeMemFloat(amx, refCameraX, cameraX)
	writeMemFloat(amx, refCameraY, cameraY)
	writeMemFloat(amx, refCameraZ, cameraZ)
	writeMemFloat(amx, refTargetX, targetX)
	writeMemFloat(amx, refTargetY, targetY)
	writeMemFloat(amx, refTargetZ, targetZ)
	writeMemFloat(amx, refRoll, roll)
	writeMemFloat(amx, refFov, fov)
end

function SetCameraInterior( amx, player, interior )
	return setCameraInterior( player, interior );
end

function SetCameraMatrix( amx, player, positionX, positionY, positionZ )
	return setCameraMatrix( player, positionX, positionY, positionZ );
end

--[[
function GetCameraTarget( amx, player )
	local playerID = getElemID( player )
	
	return playerID
end]]
