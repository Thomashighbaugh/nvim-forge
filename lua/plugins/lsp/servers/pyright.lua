local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.pyright = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
            },
        },
    },
}
