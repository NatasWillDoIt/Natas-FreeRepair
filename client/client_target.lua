QBCore = exports['qb-core']:GetCoreObject()
local img = "nui://qs-inventory/html/"

exports['qb-target']:AddBoxZone("EastsideRepairZone", vector3(891.09, -2117.75, 30.46), 50, 60, 
  {
    name = "EastsideRepairZone", 
    heading = 355.0, 
    debugPoly = false, 
    minZ = 27.46, 
    maxZ = 31.46, 
  }, {
    options = { 
      { 
        num = 1,
        img = "sandwich",
        type = "client", 
        event = "natas-freerepair:client:mfr",
        icon = 'fa fa-screwdriver-wrench',
        label = 'Repair Vehicle', 
        targeticon = 'fa fa-screwdriver-wrench', 
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end 
          return true
        end,
        job = {["police"] = 0, ["ambulance"] = 0, ["mechanic"] = 0}, 
      }
    },
    distance = 2.5, 
  })
  --LS Customs Main Shop
  exports['qb-target']:AddBoxZone("LSMainRepair", vector3(-335.83, -136.66, 38.53), 30, 50, 
  { 
    name = "LSMainRepair", 
    heading = 250.00, 
    debugPoly = false, 
    minZ = 37.73, 
    maxZ = 41.73, 
  }, {
    options = { 
      { 
        num = 2, 
        type = "client",
        event = "natas-freerepair:client:mfr", 
        icon = 'fa fa-screwdriver-wrench', 
        label = 'Repair Vehicle', 
        targeticon = 'fa fa-screwdriver-wrench',
        canInteract = function(entity, distance, data) 
          if IsPedAPlayer(entity) then return false end 
          return true
        end,
        job = {["police"] = 0, ["ambulance"] = 0, ["mechanic"] = 0}, 
      }
    },
    distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
    print('^2Natas-FreeRepair-^6 LS Customs Client Repair MainZone Loaded'),
    print('^2Natas-FreeRepair-^6 Script Preview https://www.youtube.com/watch?v=mmCmKxgr6hQ')
  })

--Police MDPR 
exports['qb-target']:AddBoxZone("PoliceStationRepair", vector3(484.59, -1020.65, 27.21), 15, 11, { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
name = "PoliceStationRepair", 
heading = 250.00, 
debugPoly = false, 
minZ = 23.45, 
maxZ = 27.45, 
}, {
options = { 
  { 
    num = 4, 
    type = "client",
    event = "natas-freerepair:client:mfr", 
    icon = 'fa fa-screwdriver-wrench', 
    label = 'Free Police Reapir', 
    targeticon = 'fa fa-screwdriver-wrench',
    canInteract = function(entity, distance, data) 
      if IsPedAPlayer(entity) then return false end 
      return true
    end,
    job = {["police"] = 0, ["ambulance"] = 0}, 
  }
},
distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
})

--Police MDPR 
exports['qb-target']:AddBoxZone("PillboxStationRepair", vector3(331.61, -550.5, 28.04), 20, 30, { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
name = "PillboxStationRepair", 
heading = 350.00, 
debugPoly = false, 
minZ = 26.44, 
maxZ = 30.44, 
}, {
options = { 
  { 
    num = 5, 
    type = "client",
    event = "natas-freerepair:client:mfr", 
    icon = 'fa fa-screwdriver-wrench', 
    label = ' Free Medical Repair', 
    targeticon = 'fa fa-screwdriver-wrench',
    canInteract = function(entity, distance, data) 
      if IsPedAPlayer(entity) then return false end 
      return true
    end,
    job = {["police"] = 0, ["ambulance"] = 0}, 
  }
},
distance = 2.5, 
})

--Police MDPR 
exports['qb-target']:AddBoxZone("OGBennyRepair", vector3(-216.41, -1325.18, 30.19), 20, 25, { 
name = "OGBennyRepair", 
heading = 0.0, 
debugPoly = false, 
minZ = 27.59, 
maxZ = 31.59, 
}, {
options = { 
  { 
    num = 5, 
    type = "client",
    event = "natas-freerepair:client:mfr", 
    icon = 'fa fa-screwdriver-wrench', 
    label = ' Bennys Quick Fix', 
    targeticon = 'fa fa-screwdriver-wrench',
    canInteract = function(entity, distance, data) 
      if IsPedAPlayer(entity) then return false end 
      return true
    end,
    job = {["police"] = 0, ["mechanic"] = 0}, 
  }
},
distance = 2.5, 
})