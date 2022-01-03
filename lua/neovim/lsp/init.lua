local config = require('neovim.config')

-- set up lsp servers
require('neovim.lsp.providers')
require('neovim.lsp.diagnostics')

vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = config.border
    }
)

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = config.border
    }
)
