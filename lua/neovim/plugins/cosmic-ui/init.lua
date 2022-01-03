local config = require('neovim.config')
local utils = require('neovim.utils')

local defaults = {
    border = 'rounded'
}

require('cosmic-ui').setup(utils.merge(defaults, config.neovim_ui or {}))
