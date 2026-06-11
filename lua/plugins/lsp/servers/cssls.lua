local lsp = require('plugins.lsp.servers')

vim.lsp.config.cssls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        css = {
            lint = { unknownAtRules = 'ignore' },
        },
    },
}
