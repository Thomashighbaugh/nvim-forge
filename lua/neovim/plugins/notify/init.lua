---@diagnostic disable: different-requires
local config = require('neovim.config')
local icons = require('neovim.theme.icons')
local utils = require('neovim.utils')

require('notify').setup(
    utils.merge(
        {
            icons = {
                ERROR = icons.error,
                WARN = icons.warn,
                INFO = icons.info,
                DEBUG = icons.debug,
                TRACE = icons.trace
            },
            stages = 'slide',
            background_colour = require('neovim.theme.colors').bg
        },
        config.notify or {}
    )
)

vim.notify = require('notify')
