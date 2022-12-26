Config = {
	Lan = "en",
	Debug = false,
	Notify = "qb",
}
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Targets = {

}
--Billing Fees
Config.Money = math.random(250, 600)




