resourceRoot = getResourceRootElement(getThisResource())
g_Me = getLocalPlayer()

g_Elements = {}

local screenWidth, screenHeight = guiGetScreenSize()

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		triggerServerEvent('onLoadedAtClient', resourceRoot, g_Me)
	end,
	false
)

function setAMXVersion(ver)
	g_AMXVersion = ver
end

function setPlayerID(id)
	g_PlayerID = id
end



