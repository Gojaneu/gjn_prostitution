fx_version 'adamant' 
game 'gta5' 
author 'GJN SCRIPTS'
description 'Prostitution Script by GJN SCRIPTS'
version '1.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
	'shared/*.lua'
}
 
client_scripts {
	'client/cl_Utils.lua',
	'client/*.lua'
} 
 
server_scripts { 
    'server/sv_Utils.lua',
	'server/*.lua'
}

files {
    'locales/*.json'
}