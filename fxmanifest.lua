--- Copyright © 2024 Joshua Nelson

fx_version 'cerulean'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'daggre_actual'
description 'Animation library and queue system for custom animation scenarios'
version '0.3'
lua54 'yes'

client_scripts {
    'src/config_cl.lua',
    'src/util.lua',
    'src/menu.lua',
    'src/conditions.lua',
    'src/prop/prop.lua',

    'base/prop/*.lua',
    'base/lib/*.lua',

    'plugin/**/prop/*.lua',
    'plugin/**/lib/*.lua',
    'plugin/**/util.lua',

    'src/animQueue.lua',
    'src/animTree.lua',
}

server_scripts {
    'src/config_srv.lua',
    'plugin/**/item/useable_srv.lua',
}

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css',
    'ui/img/chev_r.png',
    'ui/img/rdr_h_spacer.png',
    'ui/img/rdr_menu_bg.png',
    'ui/img/rdr_menu_row.png',
    'ui/fonts/RDRLino-Regular.ttf',
}

ui_page {
    'ui/index.html',
}

dependencies {
    'da_lib',
}
