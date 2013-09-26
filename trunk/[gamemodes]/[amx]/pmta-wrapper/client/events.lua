function OnClientKey(button, press)
	serverEvent.OnClientKey(button, press);
end
addEventHandler("onClientKey", root, OnClientKey)

function OnClientPlayerWeaponFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )
	local eType = getElementType(hitElement);
	if eType == "player" or eType == "vehicle" or eType == "ped" or eType == "object" then
		serverEvent.OnPlayerWeaponFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, eType, getElemID(hitElement));
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), OnClientPlayerWeaponFire )

function OnClientPlayerWeaponSwitch ( prevSlot, newSlot )
	serverEvent.OnPlayerWeaponSwitch(prevSlot, newSlot);
end
addEventHandler ( "onClientPlayerWeaponSwitch", getLocalPlayer(), OnClientPlayerWeaponSwitch )

function OnClientPlayerTarget ( target )
	local eType = getElementType(target);
	if eType == "player" or eType == "vehicle" or eType == "ped" or eType == "object" then
		serverEvent.OnPlayerTarget(eType, getElemID(target));
	end
end
addEventHandler ( "onClientPlayerTarget", getLocalPlayer(), OnClientPlayerTarget )

function OnClientClick ( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
	serverEvent.OnPlayerClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ);
	
	if clickedElement then
		local eType = getElementType(clickedElement);
		if eType == "player" or eType == "vehicle" or eType == "ped" or eType == "object" then
			serverEvent.OnPlayerClickElement(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, eType, getElemID(clickedElement));
		end
	end
end
addEventHandler ( "onClientClick", getRootElement(), OnClientClick )