QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("natas-freerepair:client:mfr", function(source)
    local localPlayerPed = GetPlayerPed(-1)
    local localVehicle = GetVehiclePedIsIn(localPlayerPed, false)
    SetVehicleFixed(localVehicle) 
    print('^2Natas-Snippet-^6 LS Customs Client Fuction Loaded')
 end)