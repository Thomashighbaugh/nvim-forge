local config = require('neovim.config')
local cmd = vim.cmd
cmd('let g:nvcode_termcolors=256')

local themeColors = {
    bg = '#23252e',
    fg = '#F4f4f7',
    selection = '#8b9cbe',
    comment = '#b2bfd9',
    red = '#FF3d81',
    orange = '#FF9933',
    yellow = '#F0FFAA',
    green = '#1ef589',
    purple = '#8265ff',
    cyan = '#00caff',
    pink = '#FF87d7',
    bright_red = '#FF28a8',
    bright_green = '#00ffcc',
    bright_yellow = '#FFFFAF',
    bright_blue = '#0badff',
    bright_magenta = '#6c71c4',
    bright_cyan = '#00eaff',
    bright_white = '#FFFFFF',
    menu = '#323643',
    visual = '#1A1C23',
    gutter_fg = '#555e70',
    nontext = '#939eb4',
    white = '#f4f4f7',
    black = '#17191e'
}

local colors = {
    white = themeColors.fg,
    bg = themeColors.bg,
    bg_highlight = themeColors.menu,
    normal = themeColors.bright_green,
    insert = themeColors.bright_blue,
    command = themeColors.purple,
    visual = themeColors.bright_green,
    replace = themeColors.bright_red,
    diffAdd = themeColors.bright_green,
    diffModified = themeColors.orange,
    diffDeleted = themeColors.bright_red,
    trace = themeColors.orange,
    hint = themeColors.bright_cyan,
    info = themeColors.bright_green,
    error = themeColors.bright_red,
    warn = themeColors.orange,
    floatBorder = themeColors.bright_blue,
    selection_caret = themeColors.bright_blue
}

return colors
