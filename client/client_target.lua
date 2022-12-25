QBCore = exports['qb-core']:GetCoreObject()

exports['qb-target']:AddBoxZone("EastsideRepairZone", vector3(891.09, -2117.75, 30.46), 50, 60, {
    name = "EastsideRepairZone", 
    heading = 355.0, 
    debugPoly = false, 
    minZ = 27.46, 
    maxZ = 31.46, 
  }, {
    options = { 
      { 
        num = 1,
        type = "client", 
        event = "natas-freerepair:client:mfr",
        icon = 'fa fa-screwdriver-wrench',
        label = 'Repair Vehicle', 
        targeticon = 'fa fa-screwdriver-wrench', 
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end 
          return true
        end,
        job = {["police"] = 0, ["mechanic"] = 0}, 
        drawDistance = 150.0,
        drawColor = {0, 205, 255, 255}, 
        successDrawColor = {30, 144, 255, 255},
      }
    },
    distance = 2.5, 
    print('^2Natas-Snippet-^6 LS Customs Client Repair CustomZone Loaded')
  })
  
  exports['qb-target']:AddBoxZone("LSMainRepair", vector3(-335.83, -136.66, 38.53), 30, 50, { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
    name = "LSMainRepair", 
    heading = 250.00, 
    debugPoly = false, 
    minZ = 37.73, 
    maxZ = 41.73, 
  }, {
    options = { 
      { 
        num = 1, 
        type = "client",
        event = "natas-freerepair:client:mfr", 
        icon = 'fa fa-screwdriver-wrench', 
        label = 'Repair Vehicle', 
        targeticon = 'fa fa-screwdriver-wrench',
        canInteract = function(entity, distance, data) 
          if IsPedAPlayer(entity) then return false end 
          return true
        end,
        job = {["police"] = 0, ["mechanic"] = 0}, 
        drawDistance = 150.0,
        drawColor = {255, 255, 255, 255}, 
        successDrawColor = {30, 144, 255, 255},
      }
    },
    distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
    print('^2Natas-FreeRepair-^6 LS Customs Client Repair MainZone Loaded'),
    print('^2Natas-FreeRepair-^6 Script Preview https://www.youtube.com/watch?v=mmCmKxgr6hQ')
  })