-- When the resource is started - set all players' wheels to the offroad ones
function onResourceStart()
	for i, player in ipairs(getElementsByType("player")) do
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player)
			if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
				addVehicleUpgrade(veh, 1025)
			end
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, onResourceStart)

-- When a player spawns - set their wheels to the offroad ones
function onPlayerSpawn()
	setTimer(function(player)
		if isPedInVehicle(player) then
			local veh = getPedOccupiedVehicle(player)
			if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
				addVehicleUpgrade(veh, 1025)
			end
		end
	end, 1000, 1, source)
end
addEventHandler("onPlayerSpawn", root, onPlayerSpawn)

-- When a player hits a vehicle change pickup - set their wheels to the offroad ones
addEvent("onPlayerPickUpRacePickup", true)
function onPlayerPickUpRacePickup(pickupID, pickupType, vehicleModel)
	if pickupType == "vehiclechange" then
		if isPedInVehicle(source) then
			local veh = getPedOccupiedVehicle(source)
			if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
				addVehicleUpgrade(veh, 1025)
			end
		end
	end
end
addEventHandler("onPlayerPickUpRacePickup", root, onPlayerPickUpRacePickup)

-- When a player hits any checkpoint except the last one - set their wheels to the offroad ones
-- This is done so that if there is a vehicle change checkpoint, the offroad wheels would get set to the new vehicle
addEvent("onPlayerReachCheckpoint", true)
function onPlayerReachCheckpoint()
	if isPedInVehicle(source) then
		local veh = getPedOccupiedVehicle(source)
		if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
			addVehicleUpgrade(veh, 1025)
		end
	end
end
addEventHandler("onPlayerReachCheckpoint", root, onPlayerReachCheckpoint)

-- When a player hits the last checkpoint aka finishes the race - set their wheels to the offroad ones
-- This is done so that if there is a vehicle change checkpoint as the last one, the offroad wheels would get set to the new vehicle
addEvent("onPlayerFinish", true) 
function onPlayerFinish()
	if isPedInVehicle(source) then
		local veh = getPedOccupiedVehicle(source)
		if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
			addVehicleUpgrade(veh, 1025)
		end
	end
end
addEventHandler("onPlayerFinish", root, onPlayerFinish)

-- When an admin gives a vehicle to a player - set that given vehicle's wheels to the offroad ones
function onElementModelChange()
	if getElementType(source) == "vehicle" then
		setTimer(function(veh)
			if (getVehicleType(veh) == "Automobile") or (getVehicleType(veh) == "Monster Truck") or (getVehicleType(veh) == "Quad") then
				addVehicleUpgrade(veh, 1025)
			end
		end, 50, 1, source)
	end
end
addEventHandler("onElementModelChange", root, onElementModelChange)