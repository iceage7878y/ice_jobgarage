

fx_version 'cerulean'
game 'gta5'

author 'IceAge'
description 'UI Garage script til ESX'
version '1.0.0'

lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
  'shared/config.lua',
  'shared/config.ui_locale.lua',
  'shared/config.interaction_keys.lua',
  'shared/config.garages.lua',
  'locales/init.lua'
}

client_script 'client/client.lua'
server_script 'server/server.lua'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/style.css',
  'html/script.js',
  'html/img/*.png',
  'locales/*.lua'
}

escrow_ignore (
   'shared/config.lua',
   'shared/config.ui_locale.lua',
   'shared/config.interaction_keys.lua',
   'shared/config.garages.lua',
   'locales/*.lua'
)
