function CreateMarker( amx, x, y, z )	local marker = createMarker( x, y, z );		if not marker then		return false;	end		local markerID = addElem( g_Markers, marker );		return markerID;endfunction GetMarkerColor( amx, marker, refR, refG, refB )	local r, g, b = getMarkerColor( marker );	WriteMemInt( amx, refR, r );	WriteMemInt( amx, refG, g );	WriteMemInt( amx, refB, b );endfunction GetMarkerIcon( amx, marker, buf, bufSize )	local icon = getMarkerIcon( marker );	if #icon <= bufSize then		writeMemString( amx, buf, icon );		return true;	end	return false;endfunction GetMarkerSize( amx, marker, refSize )	local size = getMarkerSize( marker );	WriteMemFloat( amx, refSize, size );end	function GetMarkerTarget( amx, marker, refX, refY, refZ )	local x, y, z = getMarkerTarget( marker );	WriteMemInt( amx, refX, x );	WriteMemInt( amx, refY, y );	WriteMemInt( amx, refZ, z );endfunction GetMarkerType( amx, marker, buf, bufSize )	local type = getMarkerType( marker );	if #type <= bufSize then		writeMemString( amx, buf, type );		return true;	end	return false;endfunction SetMarkerColor( amx, marker, r, g, b )	return setMarkerColor( marker, r, g, b );endfunction SetMarkerIcon( amx, marker, icon )	return setMarkerIcon( marker, icon );endfunction SetMarkerSize( amx, marker, size )	return setMarkerSize( marker, size );endfunction SetMarkerTarget( amx, marker, x, y, z )	return setMarkerTarget( marker, x, y, z );endfunction SetMarkerType( amx, marker, type )	return setMarkerType( marker, type );end--getMarkerCount --isElementWithinMarker 