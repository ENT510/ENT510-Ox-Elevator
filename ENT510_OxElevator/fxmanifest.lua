fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'ENT510'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'debug.lua',
    'shared/shared.lua',
    'shared/traduction.lua',

}

client_scripts {
    'client/cl_editable.lua',
    'client/cl_main.lua',
    'client/cl_function.lua',
}
