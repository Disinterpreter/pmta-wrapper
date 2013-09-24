--Element functions
function GetElementAlpha( amx, element )
	return getElementAlpha( element );
end
GetPlayerAlpha = GetElementAlpha;
GetPedAlpha = GetElementAlpha;
GetVehicleAlpha = GetElementAlpha;

function GetElementDimension( amx, element )
	return getElementDimension( element );
end

GetPlayerDimension = GetElementDimension;
GetPedDimension = GetElementDimension;
GetVehicleDimension = GetElementDimension;
GetMarkerDimension = GetElementDimension;
GetObjectDimension = GetElementDimension;
GetPickupDimension = GetElementDimension;
--.....

function GetElementHealth( amx, element, refHealth )
	local health = getElementHealth( element );
	writeMemFloat( amx, refHealth, health );
end

GetPlayerHealth = GetElementHealth;
GetPedHealth = GetElementHealth;
GetVehicleHealth = GetElementHealth;
GetObjectHealth = GetElementHealth;

function GetElementInterior( amx, element )
	return getElementInterior( element );
end

GetPlayerInterior = GetElementInterior;
GetPedInterior = GetElementInterior;
GetVehicleInterior = GetElementInterior;
GetMarkerInterior = GetElementInterior;
GetObjectInterior = GetElementInterior;
GetPickupInterior = GetElementInterior;

function GetElementPosition( amx, element, refX, refY, refZ )
	local x, y, z = getElementPosition( element );
	writeMemFloat( amx, refX, x );
	writeMemFloat( amx, refY, y );
	writeMemFloat( amx, refZ, z );
end

GetPlayerPosition = GetElementPosition;
GetPedPosition = GetElementPosition;
GetVehiclePosition = GetElementPosition;
GetMarkerPosition = GetElementPosition;
GetObjectPosition = GetElementPosition;
GetPickupPosition = GetElementPosition;

function GetElementRotation( amx, element, refRotX, refRotY, refRotZ )
	local rotX, rotY, rotZ = getElementRotation( element );
	writeMemFloat( amx, refRotX, rotX );
	writeMemFloat( amx, refRotY, rotY );
	writeMemFloat( amx, refRotZ, rotZ );
end

GetPlayerRotation = GetElementRotation;
GetPedRotation = GetElementRotation;
GetVehicleRotation = GetElementRotation;
GetMarkerRotation = GetElementRotation;
GetObjectRotation = GetElementRotation;
GetPickupRotation = GetElementRotation;

function GetElementVelocity( amx, element, refVelX, refVelY, refVelZ )
	local velX, velY, velZ = getElementVelocity( element );
	writeMemFloat( amx, refVelX, velX );
	writeMemFloat( amx, refVelY, velY );
	writeMemFloat( amx, refVelZ, velZ );
end

GetPlayerVelocity = GetElementVelocity;
GetPedVelocity = GetElementVelocity;
GetVehicleVelocity = GetElementVelocity;

function IsElementFrozen( amx, element )
	return isElementFrozen( element );
end

GetPlayerFrozen = IsElementFrozen;
GetPedFrozen = IsElementFrozen;
GetVehicleFrozen = IsElementFrozen;

function SetElementDimension( amx, element, dimension )
	return setElementDimension( element, dimension );
end

SetPlayerDimension = SetElementDimension;
SetPedDimension = SetElementDimension;
SetVehicleDimension = SetElementDimension;
SetMarkerDimension = SetElementDimension;
SetObjectDimension = SetElementDimension;
SetPickupDimension = SetElementDimension;

function SetElementFrozen( amx, element, frozen )
	return isElementFrozen( element, frozen );
end

SetPlayerFrozen = SetElementFrozen;
SetPedFrozen = SetElementFrozen;
SetVehicleFrozen = SetElementFrozen;

function SetElementHealth( amx, element, health )
	return setElementHealth( element, health );
end

SetPlayerHealth = SetElementHealth;
SetPedHealth = SetElementHealth;
SetVehicleHealth = SetElementHealth;
SetObjectHealth = SetElementHealth;

function SetElementInterior( amx, element, interior )
	return setElementInterior( element, interior );
end

SetPlayerInterior = SetElementInterior;
SetPedInterior = SetElementInterior;
SetVehicleInterior = SetElementInterior;
SetMarkerInterior = SetElementInterior;
SetObjectInterior = SetElementInterior;
SetPickupInterior = SetElementInterior;
--...

function SetElementPosition( amx, element, x, y, z )
	return setElementPosition( element, x, y, z );
end

SetPlayerPosition = SetElementPosition;
SetPedPosition = SetElementPosition;
SetVehiclePosition = SetElementPosition;
SetMarkerPosition = SetElementPosition;
SetObjectPosition = SetElementPosition;
SetPickupPosition = SetElementPosition;

function SetElementRotation( amx, element, rotX, rotY, rotZ )
	return setElementRotation( element, rotX, rotY, rotZ );
end

SetPlayerRotation = SetElementRotation;
SetPedRotation = SetElementRotation;
SetVehicleRotation = SetElementRotation;
SetMarkerRotation = SetElementRotation;
SetObjectRotation = SetElementRotation;
SetPickupRotation = SetElementRotation;

function SetElementVelocity( amx, element, velX, velY, velZ )
	return setElementRotation( element, velX, velY, velZ );
end

SetPlayerVelocity = SetElementVelocity;
SetPedVelocity = SetElementVelocity;
SetVehicleVelocity = SetElementVelocity;

function GetElementModel( amx, element )
	return getElementModel( element );
end

GetPlayerSkin = GetElementModel;
GetPedSkin = GetElementModel;
GetVehicleModel = GetElementModel;

function IsElementInWater( amx, element )
	return isElementInWater( element );
end

IsPlayerInWater = IsElementInWater;
IsPedInWater = IsElementInWater;
IsVehicleInWater = IsElementInWater;

function SetElementModel( amx, element, model )
	return setElementModel( element, model );
end

SetPlayerSkin = SetElementModel;
SetPedSkin = SetElementModel;
SetVehicleModel = SetElementModel;

function SetElementAlpha( amx, elem, alpha )
	return setElementAlpha ( elem, alpha );
end

SetPedAlpha = SetElementAlpha;
SetPlayerAlpha = SetElementAlpha;
SetVehicleAlpha = SetElementAlpha;
SetObjectAlpha = SetElementAlpha;

--[[
getElementAttachedOffsets 
getElementCollisionsEnabled 
getElementAttachedTo 
getElementByID 
getElementByIndex 
getElementChild 
getElementChildren 
getElementChildrenCount 
getElementColShape 
getElementData 
getElementID 
getElementParent 
getElementsByType 
getElementsWithinColShape 
getElementType 
getElementZoneName 
getRootElement 
isElement 
isElementAttached 
isElementDoubleSided 
isElementVisibleTo 
isElementWithinColShape 
removeElementData 
setElementCollisionsEnabled 
setElementData 
setElementDoubleSided 
setElementID 
setElementParent 
setElementSyncer 
setElementVisibleTo 
attachElements 
detachElements 
getElementSyncer 
setElementAttachedOffsets 
setLowLODElement 
getLowLODElement 
isElementLowLOD
]]