function OnClientKey(button, press)
	serverEvent.OnClientKey(button, press);
end
addEventHandler("onClientKey", root, OnClientKey)