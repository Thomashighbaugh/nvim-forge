local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.cssls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        css = {
            lint = { unknownAtRules = 'ignore' },
        },
    },
}
