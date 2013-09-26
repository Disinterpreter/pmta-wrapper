resourceRoot = getResourceRootElement(getThisResource())
g_Me = getLocalPlayer()

g_Elements = {}

local screenWidth, screenHeight = guiGetScreenSize()

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		triggerServerEvent('onLoadedAtClient', resourceRoot, g_Me)
		local w, h = guiGetScreenSize();
		setElementData(g_Me, "screenWidth", w);
		setElementData(g_Me, "screenHeight", h);
	end,
	false
)

function setAMXVersion(ver)
	g_AMXVersion = ver
end

function setPlayerID(id)
	g_PlayerID = id
end

