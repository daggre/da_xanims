--- Copyright © 2024 Joshua Nelson

fx_version 'cerulean'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'daggre_actual'
description 'Animation library and queue system for custom animation scenarios'
version '0.6'
lua54 'yes'

shared_scripts {
    '@da_log/log_sh.lua',
    '@da_lib/features/api/api_sh.lua',
}

client_scripts {
    '@da_lib/data/key.lua',

    '@da_lib/features/audio/audio_cl.lua',
    '@da_lib/features/anim/anim_cl.lua',
    '@da_lib/features/cache/cache_lazy.lua',
    '@da_lib/features/net/net_cl.lua',
    '@da_lib/features/util/util_cl.lua',
    '@da_lib/features/nui/nui_cl.lua',
    '@da_lib/features/control/control_cl.lua',
    '@da_lib/features/object/object_cl.lua',
    '@da_lib/features/chance/chance_cl.lua',
    '@da_lib/features/mode/mode_cl.lua',
    '@da_lib/features/move/move_cl.lua',
    '@da_lib/features/weapon/weapon_cl.lua',
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
