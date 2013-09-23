resourceRoot = getResourceRootElement(getThisResource())
g_Me = getLocalPlayer()

g_AMXs = {}

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

function addAMX(name, type)
	g_AMXs[name] = { name = name, type = type }
end

function removeAMX(amxName)
	local amx = g_AMXs[amxName]
	
	setElementAlpha(g_Me, 255)
	g_AMXs[amxName] = nil
end

function setPlayerID(id)
	g_PlayerID = id
end



