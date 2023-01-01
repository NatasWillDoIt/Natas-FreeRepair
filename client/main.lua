QBCore = exports['qb-core']:GetCoreObject()
VehicleStatus = {}
local PlayerJob = {}
local img = image
local img = "nui://qs-inventory/html/"
local playerjob= PlayerJob.type
--Zone Checks 
local isInsideDutyZone = false
local isInsideVehiclePlateZone = false
local dutyTargetBoxID = 'dutyTarget'
local stashTargetBoxID = 'stashTarget'


RegisterNetEvent('natas-freerepair:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('info.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('info.mrs')
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message = Lang:t('email.message', {value = gender, value2 = charinfo.lastname, value3 = amount}),
            button = {}
        })
    end)
end)

function IsMechanicJob(job) --Checks for Job Mechanic
    for k, v in pairs(Config.MechanicJob) do
        if job == v then
            return true
        end
    end
    return false
end

local function IsValidJob(jobList) --Checks QB-Core Job.lua for job
	for k, v in pairs(jobList) do
		if v == PlayerJob.name then
			return true
		end
	end
	return false
end

local function CheckOnDuty() --Checks to see is Player(sources on duty)
    	if Config.OnDutyOnly then
		return PlayerJob.onduty
	end
	return true
end

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

RegisterNetEvent('natas-freerepair:client:mfr', function()
    local playerPed = PlayerPedId()
    local img = image
    local img = "nui://qs-inventory/html/"
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    FreezeEntityPosition(vehicle, true)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"}) --Will Play the fix emote while in vehicle fix it
    QBCore.Functions.Progressbar("Repairing", "Repairing", math.random(5000, 10000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('natas-free-repair:server:costRepair')
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'airwrench', 0.4)
        SetVehicleDeformationFixed(vehicle)
        FreezeEntityPosition(vehicle, false)
        SetVehicleEngineHealth(vehicle, 9999)
        SetVehiclePetrolTankHealth(vehicle, 9999)
        SetVehicleFixed(vehicle)
    end, function() -- Cancel
        QBCore.Functions.Notify('Cancelled preparing equipement', 'error')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})      
    end, "fa-duotone fa-hammer") --Progress Bar Icon ("fa-duotone fa-hammer") is the name u can change [More Icons here](https://fontawesome.com/)
end)