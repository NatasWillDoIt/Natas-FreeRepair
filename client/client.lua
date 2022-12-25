QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('natas-freerepair:client:mfr', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    FreezeEntityPosition(vehicle, true)
    QBCore.Functions.Progressbar("Repairing", "Repairing", math.random(3000, 4000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('repair:costRepair')
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'airwrench', 0.4)
        SetVehicleDeformationFixed(vehicle)
        FreezeEntityPosition(vehicle, false)
        SetVehicleEngineHealth(vehicle, 9999)
        --SetVehiclePetrolTankHealth(vehicle, 9999)
        SetVehicleFixed(vehicle)
    end, function() -- Cancel
        QBCore.Functions.Notify('Cancelled preparing equipement', 'error')
    end)
end)