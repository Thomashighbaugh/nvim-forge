local lsp = require('plugins.lsp.servers')

vim.lsp.config.ltex = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = { 'bibtex', 'markdown', 'latex', 'tex' },
    settings = {
        ltex = { language = 'en-US' },
    },
}
