local lsp = require('plugins.lsp.servers')

vim.lsp.config.html = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = { 'html', 'heex' },
}
