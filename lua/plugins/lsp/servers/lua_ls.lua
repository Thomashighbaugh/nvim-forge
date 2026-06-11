-- Lua Language Server
local lsp = require('plugins.lsp.servers')
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

vim.lsp.config.lua_ls = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = { version = 'LuaJIT' },
            library = { vim.env.VIMRUNTIME },
            workspace = { checkThirdParty = false },
            diagnostics = { globals = { 'vim' } },
            completion = { callSnippet = 'Replace' },
            telemetry = { enabled = false },
        })
    end,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                library = vim.api.nvim_get_runtime_file('.', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}
