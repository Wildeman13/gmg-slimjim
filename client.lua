local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("pdunlock", "Unlock a vehicle", {}, false, function(source, args)
    local playerId = source
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    local searchDistance = 5.0

    -- Check if the player has the police job
    if xPlayer ~= nil and xPlayer.PlayerData.job.name == "police" or xPlayer.PlayerData.job.name == "mechanic" then
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local nearbyVehicles = QBCore.Functions.GetClosestVehicles(playerPos, searchDistance)

        for _, vehicle in ipairs(nearbyVehicles) do
            local isLocked = GetVehicleDoorLockStatus(vehicle) == 2
            if isLocked then
                TaskPlayAnim(playerPed, "mini@biotech@blowtorch_def","cam_blowtorch_start_loop",8.0, -8.0, 10000, 16, 0, false, false, false))
	            QBCore.Functions.Progressbar("unlocking_vehicle", "Working the lock", 10000, false, true, {
		            disableMovement = false,
		            disableCarMovement = false,
		            disableMouse = false,
		            disableCombat = true,
	            }, {}, {}, {}, function()
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                TriggerClientEvent("QBCore:Notify", playerId, "Vehicle unlocked!")
                return
            end)
            end
        TriggerClientEvent("QBCore:Notify", playerId, "No nearby locked vehicles found!")
        end
    else
        TriggerClientEvent("QBCore:Notify", playerId, "You must be a PD or Mechanic to use this command!")
    end
end