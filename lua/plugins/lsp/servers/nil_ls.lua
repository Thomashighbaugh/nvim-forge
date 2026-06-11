local lsp = require('plugins.lsp.servers')

vim.lsp.config.nil_ls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        ['nil'] = {
            formatting = { command = { 'nixfmt' } },
        },
    },
}
