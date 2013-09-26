function OnClientRenderItems ()
	local items = getElementsByType("RenderItem");
	function comp(i, i2)
		return tonumber(getElementData(i, "ordering")) < tonumber(getElementData(i2, "ordering"));
	end
	table.sort(items, comp);
	for i,item in ipairs(items) do
		if getElementData(item, "player") == getLocalPlayer() then
			local fnName = getElementData(item, "fn");
			local args = getElementData(item, "args");
			
			--[[for k, v in pairs(args) do
				outputChatBox("arg " .. type(v) .. " val " .. v);
			end]]
			
			_G[fnName](unpack(args));
		end
	end
end
addEventHandler ( "onClientRender", root, OnClientRenderItems )