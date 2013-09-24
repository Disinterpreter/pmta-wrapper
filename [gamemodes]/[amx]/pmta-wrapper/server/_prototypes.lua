g_SAMPSyscallPrototypes = {	
	------------------------------------------------------------------------
	-- Chat
	OutputChatBox = { 'p', 's', 'i', 'i', 'i', 'b' },
	OutputChatBoxToAll = { 's' , 'i', 'i', 'i', 'b' },

	-- Testing funcs
	DisplayInfo = { 'p', 's' },
	ChangeInfo = { 'p', 'i', 's' },

	------------------------------------------------------------------------
	-- Vehicle
	AddVehicleUpgrade = { 'v', 'i' },
	AttachTrailerToVehicle = { 'v', 'v' },
	BlowVehicle = { 'v' },
	DetachTrailerFromVehicle = { 'v' },
	CreateVehicle = {'i', 'f', 'f', 'f'},
	FixVehicle = { 'v' },
	GetVehicleController = { 'v' },
	GetVehicleDoorState = { 'v', 'i' },
	GetVehicleEngineState = { 'v' },
	GetVehicleLandingGearDown = { 'v' },
	GetVehicleLightState = { 'v' },
	GetVehicleName = { 'v', 'r', 'i' },
	GetVehicleOccupant = { 'v' },
	GetVehicleOverrideLights = { 'v' },
	GetVehiclePaintjob = { 'v' },
	GetVehiclePanelState = { 'v', 'i' },
	GetVehicleSirensOn = { 'v' },
	GetVehicleType = { 'v', 'r', 'i' },
	IsVehicleLocked = { 'v' },
	IsVehicleOnGround = { 'v' },
	RespawnVehicle = { 'v' },
	SetVehicleLocked = { 'v', 'b' },
	SpawnVehicle = { 'v', 'f', 'f', 'f' },
	SetVehiclePlateText = { 'v', 's' },
	--GetVehicleColor
	--getVehicleCompatibleUpgrades
	--GetVehicleOccupants
	--GetVehiclesOfType
	--GetVehicleTowedByVehicle
	--getVehicleTowingVehicle 
	--getVehicleTurnVelocity 
	--getVehicleTurretPosition 
	--getVehicleUpgradeOnSlot 
	--getVehicleUpgrades 
	--getVehicleUpgradeSlotName 
	--getVehicleWheelStates 
	--getVehicleDoorOpenRatio 
	--getVehicleHandling 
	--getModelHandling 
	--getOriginalHandling 
	--isVehicleDamageProof 
	--isVehicleFuelTankExplodable 
	--removeVehicleUpgrade 
	--resetVehicleExplosionTime 
	--resetVehicleIdleTime 
	--setVehicleColor 
	--setVehicleDamageProof 
	--setVehicleDoorState 
	--setVehicleDoorsUndamageable 
	--setVehicleEngineState 
	--setVehicleFuelTankExplodable 
	--setVehicleIdleRespawnDelay 
	--setVehicleLandingGearDown 
	--setVehicleLightState 
	--setVehicleOverrideLights 
	--setVehiclePaintjob 
	--setVehiclePanelState 
	--setVehicleRespawnDelay 
	--setVehicleRespawnPosition 
	--setVehicleSirensOn 
	--setVehicleTurretPosition 
	--setVehicleDoorOpenRatio 
	--setVehicleHandling 
	--setModelHandling 
	--setVehicleTurnVelocity 
	--setVehicleWheelStates 
	--toggleVehicleRespawn 
	--getTrainDirection 
	--getTrainSpeed 
	--getVehicleHeadLightColor 
	--getVehicleModelFromName 
	--getVehicleNameFromModel 
	--isTrainDerailable 
	--isTrainDerailed 
	--isVehicleBlown 
	--isVehicleTaxiLightOn 
	--setTrainDerailable 
	--setTrainDerailed 
	--setTrainDirection 
	--setTrainSpeed 
	--setVehicleHeadLightColor 
	--setVehicleTaxiLightOn 
	--getVehicleVariant 
	--setVehicleVariant 
	--getVehicleSirenParams 
	--removeVehicleSirens 
	--getVehicleSirens 
	--addVehicleSirens 
	--setVehicleSirens 

	------------------------------------------------------------------------
	--Element
	GetPedPosition = { 'e', 'r', 'r', 'r' },
	SetPedPosition = { 'e', 'f', 'f', 'f' },
	GetPedRotation = { 'e', 'r', 'r', 'r' },
	SetPedRotation = { 'e', 'f', 'f', 'f' },
	GetPedInterior  = { 'e' },
	SetPedInterior  = { 'e', 'i' },
	GetPedDimension  = { 'e' },
	SetPedDimension  = { 'e', 'i' },
	GetPedVelocity = { 'e', 'r', 'r', 'r' },
	SetPedVelocity = { 'e', 'f', 'f', 'f' },
	GetPedAlpha = { 'e' },
	SetPedAlpha = { 'e', 'i' },
	GetPedHealth = { 'e', 'r' },
	SetPedHealth = { 'e', 'f' },
	IsPedFrozen = { 'e' },
	SetPedFrozen = { 'e', 'b' },
	GetPedSkin = { 'e' },
	SetPedSkin = { 'e', 'i' },
	IsPedInWater = { 'e' },
	
	GetVehiclePosition = {'v', 'r', 'r', 'r'},
	SetVehiclePosition = { 'v', 'f', 'f', 'f' },
	GetVehicleRotation = { 'v', 'r', 'r', 'r' },
	SetVehicleRotation = { 'v', 'f', 'f', 'f' },
	GetVehicleInterior  = { 'v' },
	SetVehicleInterior  = { 'v', 'i' },
	GetVehicleDimension  = { 'v' },
	SetVehicleDimension  = { 'v', 'i' },
	GetVehicleVelocity = { 'v', 'r', 'r', 'r' },
	SetVehicleVelocity = { 'v', 'f', 'f', 'f' },
	GetVehicleAlpha = { 'v' },
	SetVehicleAlpha = { 'v', 'i' },
	GetVehicleHealth = { 'v', 'r' },
	SetVehicleHealth = { 'v', 'f' },
	IsVehicleFrozen = { 'v' },
	GetVehicleFrozen = { 'v' },
	SetVehicleFrozen = { 'v', 'b' },
	GetVehicleModel = { 'v' },
	SetVehicleModel = { 'v', 'i' },
	IsVehicleInWater = { 'v' },
	
	GetPlayerPosition = {'p', 'r', 'r', 'r'},
	SetPlayerPosition = { 'p', 'f', 'f', 'f' },
	GetPlayerRotation = { 'p', 'r', 'r', 'r' },
	SetPlayerRotation = { 'p', 'f', 'f', 'f' },
	GetPlayerInterior  = { 'p' },
	SetPlayerInterior  = { 'p', 'i' },
	GetPlayerDimension  = { 'p' },
	SetPlayerDimension  = { 'p', 'i' },
	GetPlayerVelocity = { 'p', 'r', 'r', 'r' },
	SetPlayerVelocity = { 'p', 'f', 'f', 'f' },
	GetPlayerAlpha = { 'p' },
	SetPlayerAlpha = { 'p', 'i' },
	GetPlayerHealth = { 'p', 'r' },
	SetPlayerHealth = { 'p', 'f' },
	IsPlayerFrozen = { 'p' },
	SetPlayerFrozen = { 'p', 'b' },
	GetPlayerSkin = { 'p' },
	SetPlayerSkin = { 'p', 'i' },
	IsPlayerInWater = { 'p' },
	
	--[[
	clearElementVisibleTo 
	cloneElement 
	createElement 
	destroyElement 
	getAllElementData 
	getAttachedElements 
	getElementAlpha 
	getElementAttachedOffsets 
	getElementCollisionsEnabled 
	getElementAttachedTo 
	getElementByID 
	getElementByIndex 
	getElementChild 
	getElementChildren 
	getElementChildrenCount 
	getElementColShape 
	getElementData 

	getElementID 
	getElementParent 
	getElementsByType 
	getElementsWithinColShape 
	getElementType  
	getElementZoneName 
	getRootElement 
	isElement 
	isElementAttached 
	isElementDoubleSided 
	isElementVisibleTo 
	isElementWithinColShape 
	removeElementData 
	setElementAlpha 
	setElementCollisionsEnabled 
	setElementData 
	setElementDoubleSided 


	setElementID 
	setElementParent 
	setElementSyncer  
	setElementVisibleTo 
	attachElements 
	detachElements  
	getElementSyncer 
	setElementAttachedOffsets 
	setLowLODElement 
	getLowLODElement 
	isElementLowLOD

	]]
	
	------------------------------------------------------------------------
	-- Player
	
	GetPlayerBlurLevel = { 'p' },
	GetPlayerCount = { },
	GetPlayerMoney = { 'p' },
	GetPlayerPing = { 'p' },
	GivePlayerMoney = { 'p', 'i' },
	SetPlayerBlurLevel = { 'p', 'i' },
	SetPlayerMoney = { 'p', 'i' },
	SetPlayerWantedLevel = { 'p', 'i' },
	SpawnPlayer	= { 'p', 'f', 'f', 'f' },
	TakePlayerMoney = { 'p', 'i' },
	GetPlayerFromName = { 's' },
	GetPlayerIP = { 'p', 'r', 'i' },
	GetPlayerName = { 'p', 'r', 'i' },
	SetPlayerName = { 'p', 's' },
	RedirectPlayer = { 'p', 's', 'i' },
	AddPlayerClothes = { 'p', 's', 's', 'i' },
	DoesPlayerHaveJetPack = { 'p' },
	GetPlayerAmmoInClip = { 'p' },
	GetPlayerArmor = { 'p' },
	GetPlayerFightingStyle = { 'p' },
	GetPlayerGravity = { 'p' },
	GetPlayerOccupiedVehicle = { 'p' },
	GetPlayerOccupiedVehicleSeat = { 'p' },
	GetPlayerStat = { 'p', 'i', 'r' },
	GetPlayerTotalAmmo = { 'p' },
	GetPlayerWalkingStyle = { 'p' },
	GetPlayerWeapon = { 'p' },
	GetPlayerWeaponSlot = { 'p' },
	IsPlayerChoking = { 'p' },
	IsPlayerDoingGangDriveby = { 'p' },
	IsPlayerHeadless = { 'p' },
	IsPlayerInVehicle = { 'p' },
	IsPlayerOnFire = { 'p' },
	IsPlayerOnGround = { 'p' },
	SetPlayerAnalogControlState = { 'p', 's', 'f' },
	SetPlayerAnimation = { 'p' },
	SetPlayerAnimationProgress = { 'p' },
	SetPlayerArmor = { 'p', 'f' },
	SetPlayerChoking = { 'p', 'b' },
	SetPlayerDoingGangDriveby = { 'p', 'b' },
	SetPlayerFightingStyle = { 'p', 'i' },
	SetPlayerGravity = { 'p', 'f' },
	SetPlayerHeadless = { 'p', 'b' },
	SetPlayerOnFire = { 'p', 'b' },
	SetPlayerStat = { 'p', 'i', 'f' },
	SetPlayerWeaponSlot = { 'p', 'i' },
	SetPlayerWalkingStyle = { 'p', 'i' },
	WarpPlayerIntoVehicle = { 'p', 'v' },
	GetPlayerIdleTime = { 'p' },
	ResendPlayerModInfo = { 'p' },
	TakePlayerScreenShot = { 'p', 'i', 'i' },
	IsPlayerHudComponentVisible = {'p', 's'},
	ShowPlayerHudComponent = { 'p', 's', 'b' },
	SetPlayerHudComponentVisible = { 'p', 's', 'b' },
	SetPlayerMuted = { 'p', 'b' },
	SetPlayerNametagColor = { 'p', 'i', 'i', 'i' },
	SetPlayerNametagShowing = { 'p', 'b' },
	SetPlayerNametagText = { 'p', 's' },
	IsPlayerMapForced = { 'p' },
	IsPlayerMuted = { 'p' },
	IsPlayerNametagShowing = { 'p' },
	SetPlayerAnnounceValue = { 'p', 's', 's' },
	SetPlayerBlurLevel = { 'p', 'i' },
	GetPlayerVersion = { 'p' },
	GetPlayerWantedLevel = { 'p' },
	GetPlayerNametagColor = { 'p' },
	GetPlayerNametagText = { 'p' },
	ForcePlayerMap = { 'p', 'b' },
	GetPlayerAnnounceValue = { 'p', 's' },

	--SetPlayerAimTarget = { 'p', 'f', 'f', 'f' }, ( CLIENT ONLY )
	--IsPlayerDoingTask ( CLIENT ONLY )
	--GetPlayerWeaponMuzzlePosition
	--getPlayerTarget
	--GetPlayerVoice
	--GetPlayerClothes
	--GetPlayerContactElement
	--GetPlayerMoveState
	--resendPlayerModInfo 
	--isVoiceEnabled 
	--setPlayerVoiceBroadcastTo 
	--setPlayerVoiceIgnoreFrom 
	--takePlayerScreenShot
	--setPlayerMuted 
	--setPlayerNametagColor 
	--setPlayerNametagShowing 
	--setPlayerTeam 
	--isPlayerHudComponentVisible 
	--showPlayerHudComponent 
	--setPlayerHudComponentVisible
	--isPlayerMapForced 
	--isPlayerMuted 
	--isPlayerNametagShowing 
	--setPlayerAnnounceValue 
	--getPlayerTeam 
	--getPlayerVersion 
	--getPlayerWantedLevel 
	--getRandomPlayer
	--forcePlayerMap 
	--getAlivePlayers 
	--getDeadPlayers 
	--getPlayerAnnounceValue 
	--getPlayerNametagColor 
	--getPlayerNametagText
	--IsVoiceEnabled = {  },
	------------------------------------------------------------------------
	-- Ped functions
	CreatePed = { 'i', 'f', 'f', 'f', 'f', 'i' },
	AddPedClothes = { 'e', 's', 's', 'i' },
	DoesPedHaveJetPack = { 'e' },
	GetPedAmmoInClip = { 'e' },
	GetPedArmor = { 'e' },
	GetPedFightingStyle = { 'e' },
	GetPedGravity = { 'e' },
	GetPedOccupiedVehicle = { 'e' },
	GetPedOccupiedVehicleSeat = { 'e' },
	GetPedStat = { 'e', 'i', 'r' },
	GetPedTotalAmmo = { 'e' },
	GetPedWalkingStyle = { 'e' },
	GetPedWeapon = { 'e' },
	GetPedWeaponSlot = { 'e' },
	IsPedChoking = { 'e' },
	IsPedDoingGangDriveby = { 'e' },
	IsPedHeadless = { 'e' },
	IsPedInVehicle = { 'e' },
	IsPedOnFire = { 'e' },
	IsPedOnGround = { 'e' },
	SetPedAnalogControlState = { 'e', 's', 'f' },
	SetPedAnimation = { 'e' },
	SetPedAnimationProgress = { 'e' },
	SetPedArmor = { 'e', 'f' },
	SetPedChoking = { 'e', 'b' },
	SetPedDoingGangDriveby = { 'e', 'b' },
	SetPedFightingStyle = { 'e', 'i' },
	SetPedGravity = { 'e', 'f' },
	SetPedHeadless = { 'e', 'b' },
	SetPedOnFire = { 'e', 'b' },
	SetPedStat = { 'e', 'i', 'f' },
	SetPedWeaponSlot = { 'e', 'i' },
	SetPedWalkingStyle = { 'e', 'i' },
	WarpPedIntoVehicle = { 'e', 'v' },
	--SetPedAimTarget = { 'e', 'f', 'f', 'f' }, ( CLIENT ONLY )
	--IsPedDoingTask ( CLIENT ONLY )
	--GetPedWeaponMuzzlePosition
	--GetPedVoice
	--getPedTarget
	--GetPedMoveState
	--GetPedClothes
	--GetPedContactElement
	--- ......
	
	------------------------------------------------------------------------
	-- Camera
	FadeCamera = { 'p', 'b' },
	GetCameraInterior = { 'p' },
	GetCameraMatrix = { 'p', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r' },
	SetCameraInterior = { 'p', 'i' },
	SetCameraMatrix = { 'p', 'f', 'f', 'f' },
	SetCameraTarget = { 'p', 'p' },
	--GetCameraTarget = { 'p' },
	------------------------------------------------------------------------
	-- Weapon
	GetSlotFromWeapon = { 'i' },
	GetWeaponIDFromName = { 's' },
	GetWeaponNameFromID = { 'i', 'r', 'i' },
	GiveWeapon = { 'p', 'i' },
	SetWeaponAmmo = { 'p', 'i', 'i' },
	TakeAllWeapons = { 'p' },
	TakeWeapon = { 'p', 'i' },
	--GetOriginalWeaponProperty
	--GetWeaponProperty
	--SetWeaponProperty

	
	------------------------------------------------------------------------
	-- Other
	acos = {'f'},
	asin = {'f'},
	atan = {'f'},
	atan2 = {'f', 'f'},

	db_close = {'i'},
	db_free_result = {'i'},
	db_field_name = {'d', 'i', 'r', 'i'},
	db_get_field = {'d', 'i', 'r', 'i'},
	db_get_field_assoc = {'d', 's', 'r', 'i'},
	db_next_row = {'d'},
	db_num_fields = {'d'},
	db_num_rows = {'d'},
	db_open = {'s'},
	db_query = {'i', 's'},
	
	floatstr = {'s'},
	format = {'r', 'i', 's'},

	memcpy = {'r', 'r', 'i', 'i', 'i'},
}