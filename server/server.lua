RegisterServerEvent('repair:costRepair', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney('bank', Config.Money, "repair-bill")
        exports['qb-management']:AddMoney('mechanic', Config.Money)
        TriggerClientEvent('QBCore:Notify', src, 'Repair Done!!', 'success')
end)