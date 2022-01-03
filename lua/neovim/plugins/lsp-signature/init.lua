local config = require('neovim.config')
local utils = require('neovim.utils')

require('lsp_signature').setup(
    utils.merge(
        {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = config.border
            }
        },
        config.lsp_signature or {}
    )
)
