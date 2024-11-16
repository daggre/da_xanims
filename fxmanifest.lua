--- Copyright © 2024 Joshua Nelson

fx_version 'cerulean'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'daggre_actual'
description 'Animation library and queue system for custom animation scenarios'
version '0.3'
lua54 'yes'

shared_scripts {
    '@da_log/log_sh.lua',
    '@da_lib/api/api_sh.lua',
}

client_scripts {
    '@da_lib/lib/anim_cl.lua',
    '@da_lib/lib/cache_lazy.lua',
    '@da_lib/lib/net_cl.lua',
    '@da_lib/lib/util_cl.lua',
    '@da_lib/lib/nui_cl.lua',
    '@da_lib/lib/control_cl.lua',
    '@da_lib/lib/object_cl.lua',
    '@da_lib/lib/chance_cl.lua',
    '@da_lib/lib/mode_cl.lua',
    '@da_lib/lib/move_cl.lua',
    '@da_lib/lib/weapon_cl.lua',
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
    'plugin/**/item/useable_srv.lua',
    'plugin/**/util_srv.lua',
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
