local lsp = require('plugins.lsp.servers')

vim.lsp.config.ruff = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    init_options = {
        settings = { args = {} },
    },
}
