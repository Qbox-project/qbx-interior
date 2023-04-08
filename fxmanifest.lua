fx_version 'cerulean'
game 'gta5'

description 'QBX-Interior'
version '1.1.0'

this_is_a_map 'yes'

client_scripts {
	'client/main.lua',
	'client/optional.lua'
}

server_scripts {
	'server/main.lua',
	'server/optional.lua'
}

files {
	'stream/starter_shells_k4mb1.ytyp'
}

-- Default (included)
data_file 'DLC_ITYP_REQUEST' 'starter_shells_k4mb1.ytyp'

lua54 'yes'
