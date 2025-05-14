return {
    'L3MON4D3/LuaSnip',
    enabled = true,
    version = 'v2.*',
    event = 'InsertEnter',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },
    build = 'make install_jsregexp',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_snipmate').lazy_load()
        require('luasnip.loaders.from_lua').lazy_load()
        local ls = require('luasnip')
        local types = require('luasnip.util.types')
        ls.config.set_config({
            history = true, --keep around last snippet local to jump back
            updateevents = 'InsertLeave,TextChanged,TextChangedI', --update changes as you type
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { '●', 'DiagnosticHint' } },
                    },
                },
            },
        })

        -- Luasnip keys
        vim.keymap.set({ 'i', 's' }, '<C-i>', function()
            ls.expand()
        end)

        vim.keymap.set({ 'i', 's' }, '<C-Up>', function()
            ls.jump(1)
        end)

        vim.keymap.set({ 'i', 's' }, '<C-Down>', function()
            ls.jump(-1)
        end)

        -- Luasnip Choice Nodes
        vim.keymap.set({ 'i', 's' }, '<C-Shift-o>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        vim.keymap.set({ 'i', 's' }, '<C-Shift-a>', function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { silent = true })

        -- Disable diagnostics while expanding on select mode
        local augroup = vim.api.nvim_create_augroup('luasnip-expand', { clear = true })

        vim.api.nvim_create_autocmd('ModeChanged', {
            group = augroup,
            pattern = '*:s',
            callback = function()
                if ls.in_snippet() then
                    return vim.diagnostic.enable(false)
                end
            end,
        })

        vim.api.nvim_create_autocmd('ModeChanged', {
            group = augroup,
            -- pattern = '[is]:n',
            -- pattern = '*:n',
            pattern = 'n',
            callback = function()
                if ls.in_snippet() then
                    return vim.diagnostic.enable(true)
                end
            end,
        })
    end,
}
