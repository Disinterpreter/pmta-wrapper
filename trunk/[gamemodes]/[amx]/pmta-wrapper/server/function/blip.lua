function CreateBlip( amx, x, y, z, icon, size, r, g, b, a, ordering, visibleDistance )
	local blip = createBlip( x, y, z, icon, size, r, g, b, a, ordering, visibleDistance, getRootElement() );
	
	if not blip then
		return false;
	end
	
	local blipID = addElem( g_Blips, blip );
	
	return blipID;
end

function CreateBlipAttachedTo( amx, elem, icon, size, r, g, b, a, ordering, visibleDistance )
	local blip = createBlipAttachedTo( elem, icon, size, r, g, b, a, ordering, visibleDistance, getRootElement() );
	
	if not blip then
		return false;
	end
	
	local blipID = addElem( g_Blips, blip );
	
	return blipID;
end
CreateBlipAttachedToPlayer = CreateBlipAttachedTo;
CreateBlipAttachedToVehicle = CreateBlipAttachedTo;
CreateBlipAttachedToMarker = CreateBlipAttachedTo;
CreateBlipAttachedToPed = CreateBlipAttachedTo;


--[[function CreateBlipAttachedTo( ... )
	-- body
end]]

function GetBlipColor( amx, blip, refR, refG, refB, refA )
	local r,g,b,a = getBlipColor( blip );
	writeMemInt( amx, refR, r );
	writeMemInt( amx, refG, g );
	writeMemInt( amx, refB, b );
	writeMemInt( amx, refA, a );
	return true;
end

function GetBlipIcon( amx, blip )
	return getBlipIcon ( blip );
end

function GetBlipSize( amx, blip )
	return getBlipSize ( blip );
end

function SetBlipColor( amx, blip, r, g, b, a )
	return setBlipColor ( blip, r, g, b, a );
end

function SetBlipIcon( amx, blip, icon )
	return setBlipIcon ( blip, icon );
end

function SetBlipSize( amx, blip, iconSize )
	return setBlipSize ( blip, iconSize );
end

function GetBlipOrdering( amx, blip )
	return getBlipOrdering ( blip );
end

function SetBlipOrdering( amx, blip, ordering )
	return setBlipOrdering ( blip, ordering );
end

function GetBlipVisibleDistance( amx, blip, refDistance )
	local distance = getBlipVisibleDistance ( blip );
	writeMemFloat( amx, refDistance, distance );
	return true;
end

function SetBlipVisibleDistance( amx, blip, distance )
	return setBlipVisibleDistance ( blip, distance );
end