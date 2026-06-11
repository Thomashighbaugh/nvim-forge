local lsp = require('plugins.lsp.servers')

vim.lsp.config.bashls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = { 'sh', 'zsh' },
}
