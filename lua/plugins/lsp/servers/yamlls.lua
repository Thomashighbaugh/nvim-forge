local lsp = require('plugins.lsp.servers')
local schemastore_ok, schemastore = pcall(require, 'schemastore')

vim.lsp.config.yamlls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        yaml = {
            schemas = schemastore_ok and schemastore.yaml.schemas() or {},
        },
    },
}
