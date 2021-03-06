--Weapon functions ( Sorted )
function GetSlotFromWeapon( amx, weapon )
	return getSlotFromWeapon( weapon );
end

function GetWeaponIDFromName( amx, name )
	return getWeaponIDFromName( name );
end

function GetWeaponNameFromID( amx, id, nameBuf, bufSize )
	local name = getWeaponNameFromID( id );
	if #name <= bufSize then
		writeMemString( amx, nameBuf, name );
		return true;
	end
	return false;
end

function GiveWeapon( amx, player, weapon, ammo, current )
	return giveWeapon( player, weapon, ammo, current );
end

function SetWeaponAmmo( amx, player, weapon, totalAmmo, ammoInClip )
	return setWeaponAmmo( player, weapon, totalAmmo, ammoInClip );
end

function TakeAllWeapons( amx, player )
	return takeAllWeapons( player );
end

function TakeWeapon( amx, player, weaponid, ammo )
	return takeWeapon( player, weaponid, ammo );
end

--[[
function GetOriginalWeaponProperty( amx, player, weaponid )
	return getOriginalWeaponProperty( player, weaponid );
end

function GetWeaponProperty( amx, player, weaponid )
	return getWeaponProperty( player, weaponid );
end

function SetWeaponProperty( amx, player, weaponid )
	return setWeaponProperty( player, weaponid );
end]]
