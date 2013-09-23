-- implements a mouse look for spectating e.g. vehicles, as MTA's setCameraTarget only supports players

local screenWidth, screenHeight = guiGetScreenSize()

local phi, theta = false, false
local target
local distance = false

local sin = math.sin
local cos = math.cos
local pi = math.pi


local function scale(factor, baseX, baseY, baseZ, x, y, z)
	return baseX + factor*(x-baseX), baseY + factor*(y-baseY), baseZ + factor*(z-baseZ)
end

