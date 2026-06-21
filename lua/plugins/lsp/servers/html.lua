local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.html = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = { 'html', 'heex' },
}
