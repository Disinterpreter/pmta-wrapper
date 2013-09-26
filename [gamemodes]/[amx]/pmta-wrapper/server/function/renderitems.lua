function AddRenderItem( amx, player, fnName, fmt, order, ... )
	local elem = createElement("RenderItem");
	setElementData(elem, "player", player);
	setElementData(elem, "fn", fnName);
	setElementData(elem, "ordering", order);
	local args = { ... }
	for k,val in ipairs(args) do
		if fmt:sub(k, k) == 's' then
			args[k] = readMemString(amx, val)
		elseif fmt:sub(k, k) == 'f' then
			args[k] = cell2float(amx.memDAT[val]);
		else
			args[k] = amx.memDAT[val];
		end
	end
	setElementData(elem, "args", args);
	return addElem(g_RenderItems, elem);
end

function RemoveRenderItem( amx, item )
	removeElem(g_RenderItems, item);
	destroyElement(item);
end