fx_version 'cerulean'

games { 'gta5' }

lua54 'yes'

description 'Natas QB-Framework Free Repair QB-Target'

version '1.0.0'
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/ui.js',
    'html/sounds/wrench.ogg',
    'html/sounds/respray.ogg'
}

config_scripts {
	'config/config.lua',

}

server_scripts {
	'server/server.lua',
	'server/sv_bennys.lua',
	'@oxmysql/lib/MySQL.lua',
}

client_scripts {
	'client/client_target.lua',
	'client/main.lua',
	'client/config.lua',
	'client/cl_ui.lua',
	'client/cl_bennys.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
}

