local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.nil_ls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        ['nil'] = {
            formatting = { command = { 'nixfmt' } },
        },
    },
}
