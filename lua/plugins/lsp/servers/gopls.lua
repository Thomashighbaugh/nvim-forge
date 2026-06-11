local lsp = require('plugins.lsp.servers')

vim.lsp.config.gopls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}
