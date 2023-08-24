Config = {}

Config.Debug = false

--SERVER SETTINGS
Config.Framework = "ESX"                 -- Set your framework! qbcore, ESX, standalone
Config.UseNewESX = true                  -- Do you use NEW ESX? Type true or false
Config.Target = "ox_target"              -- Which Target system do u use? qb-target, qtarget, ox_target
Config.NotificationType = "ox_lib"       -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib"               -- ProgressBar | types: progressBars, ox_lib, qbcore
Config.TextUI = "ox_lib"                 -- TextUIs | types: esx, ox_lib, luke

--PLAYER CONTROL
Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua

--SCRIPT SETTINGS
Config.DrawDistance = 3.0
Config.DrawMarker = 10.0
Config.BlowjobPrice	= 100  	
Config.SexPrice	= 400  	

-- Blips
Config.Blips = {
    --[[prostitution = {                                    -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(435.0588, -982.0530, 30.6896), -- Blip coords
        Sprite = 20,                                     -- Blip Icon
        Display = 4,                                     -- keep 4
        Scale = 0.8,                                     -- Size of blip
        Colour = 1,                                     -- colour
        Font = '<FONT FACE="Fire Sans">',
        Name = ""                          -- Blip name
    },--]]
}

Config.Locationprostitution = {
	{
		coords = vec3(130.43, -1324.84, 28.21),
		name = "Pimp",
		heading = 304.47,
		model = "s_m_m_bouncer_01",
		target = true,
	},
}

Config.Zones = {
	["Pimp"] = {
		Pos   = { x= 130.43, y= -1324.84, z= 28.21 },
	},
} 

Config.Mistaprodevky = {
	{ x= 223.86, y= 291.94, z= 104.54, heading= 247.67 },
	{ x= -419.02, y= 253.65, z= 82.21, heading= 173.97 },
	{ x= -588.05, y= 272.25, z= 81.4, heading= 171.54 },
	{ x= -575.04, y= 246.76, z= 81.88, heading= 350.31 },
	{ x= -1392.72, y= -583.99, z= 29.25, heading= 27.13 },
	{ x= -1404.44, y= -563.37, z= 29.27, heading= 210.09 },
	{ x= -1097.55, y= -1959.07, z= 12.0, heading= 248.76 },
	{ x= -887.86, y= -2184.41, z= 7.63, heading= 132.86 },
	{ x= -40.43, y= -1724.76, z= 28.3, heading= 20.36 },
	{ x= 1131.76, y= -766.04, z= 56.76, heading= 359.89 },
	{ x= 952.16, y= -141.97, z= 73.49, heading= 148.05 },
	{ x= 258.53, y= -834.11, z= 28.56, heading= 157.76 },
}