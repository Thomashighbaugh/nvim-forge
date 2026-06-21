local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.ruff = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    init_options = {
        settings = { args = {} },
    },
}
