local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.rust_analyzer = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        ['rust-analyzer'] = {
            check = { command = 'clippy' },
            diagnostics = { enable = true },
        },
    },
}
