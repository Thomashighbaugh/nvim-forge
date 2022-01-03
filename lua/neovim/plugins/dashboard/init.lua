local icons = require('neovim.theme.icons')
local g = vim.g

g.dashboard_custom_header = {
    '==================================================================',
    '==================================================================',
    '==================================================================',
    '==================================================================',
    '==================================================================',
    '========   _______ __              __         __         =========',
    '========  |    ___|  |.-----.----.|  |_.----.|__|.----.  =========',
    '========  |    ___|  ||  -__|  __||   _|   _||  ||  __|  =========',
    '========  |_______|__||_____|____||____|__|  |__||____|  =========',
    '========    _______               __                     =========',
    '========   |_     _|.---.-.-----.|  |_.----.---.-.       =========',
    '========     |   |  |  _  |     ||   _|   _|  _  |       =========',
    '========     |___|  |___._|__|__||____|__| |___._|       =========',
    '========                                                 =========',
    '==================================================================',
    '==================================================================',
    '==================================================================',
    '==================================================================',
    '=================================================================='
}

g.dashboard_default_executive = 'telescope'

g.dashboard_session_directory = vim.fn.stdpath('data') .. '/sessions'

g.dashboard_custom_section = {
    find_file = {
        description = {icons.file1 .. ' Find File           <leader>ff'},
        command = 'Telescope find_files'
    },
    file_explorer = {
        description = {icons.file2 .. ' File Manager        <C-n>     '},
        command = 'NvimTreeToggle'
    },
    find_string = {
        description = {icons.word .. ' Grep String         <leader>fs'},
        command = 'Telescope grep_string'
    },
    last_session = {
        description = {icons.clock .. ' Load Session        <leader>sl'},
        command = 'lua vim.cmd(":silent RestoreSession")'
    }
}

g.dashboard_custom_footer = {'https://github.com/the-Electric-Tantra-Linux'}
