RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end 
QBCore = exports['qb-core']:GetCoreObject() end)

RegisterNetEvent('natas-freerepair:costRepair', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('bank', 500, "paid-invoice")
    exports['qb-management']:AddMoney('hayes', config.Repair)
     TriggerClientEvent('QBCore:Notify', src, 'Repair Done!!', 'success')
     TriggerServerEvent('jim-payments:client:PayPopup', data, true)
end)