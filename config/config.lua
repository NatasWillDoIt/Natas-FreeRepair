Config = {
	Lan = "en",
	Debug = false,
	Notify = "qb",
}
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Targets = {

}

--Locations
Config.Locations = {
    ["exit"] = vector3(864.64, -2112.44, 30.38),
    ["duty"] = vector3(-344.71, -127.87, 39.01),
    ["stash"] = vector3(898.46, -2099.95, 34.89),

}


