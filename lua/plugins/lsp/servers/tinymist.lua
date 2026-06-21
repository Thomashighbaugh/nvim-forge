local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.tinymist = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    single_file_support = true,
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        formatterMode = 'typstyle',
    },
}
