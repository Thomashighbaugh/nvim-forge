local lsp = require('plugins.lsp.servers.helpers')
local schemastore_ok, schemastore = pcall(require, 'schemastore')

vim.lsp.config.jsonls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        json = {
            schemas = schemastore_ok and schemastore.json.schemas() or {},
            validate = { enable = true },
        },
    },
}
