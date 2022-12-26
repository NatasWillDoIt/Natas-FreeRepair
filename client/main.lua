QBCore = exports['qb-core']:GetCoreObject()
VehicleStatus = {}
local PlayerJob = {}
--Zone Checks 
local isInsideDutyZone = false
local isInsideVehiclePlateZone = false
local plateZones = {}

local dutyTargetBoxID = 'dutyTarget'
local stashTargetBoxID = 'stashTarget'


--On/Off Duty
local function RegisterDutyTarget()
    local coords = Config.Locations['duty']
    local boxData = Config.Targets[dutyTargetBoxID] or {}

    if boxData and boxData.created then
        return
    end

    if PlayerJob.type ~= 'mechanic' then
        return
    end

    local label = Lang:t('labels.sign_in')
    if onDuty then
        label = Lang:t('labels.sign_off')
    end

    if Config.UseTarget then
        exports['qb-target']:AddBoxZone(dutyTargetBoxID, coords, 1.5, 1.5, {
            name = dutyTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        }, {
            options = {{
                type = "server",
                event = "QBCore:ToggleDuty",
                label = label,
            }},
            distance = 2.0
        })

        Config.Targets[dutyTargetBoxID] = {created = true}
    else
        local zone = BoxZone:Create(coords, 1.5, 1.5, {
            name = dutyTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        })
        zone:onPlayerInOut(function (isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText("[E] " .. label, 'left')
            else
                exports['qb-core']:HideText()
            end

            isInsideDutyZone = isPointInside
        end)

        Config.Targets[dutyTargetBoxID] = {created = true, zone = zone}
    end
end

RegisterNetEvent('qb-mechanicjob:client:mfr', function()
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