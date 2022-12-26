RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end 
QBCore = exports['qb-core']:GetCoreObject() end)

RegisterServerEvent('qb-repair:costRepair', function()
    local src = source
    local moneycharge = math.random(250, 600)
    local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveMoney('bank', moneycharge, "repair-bill")
        exports['qb-management']:AddMoney('mechanic', moneycharge)
        QBCore.Functions.Notify('Repair Done', 'success')
end)