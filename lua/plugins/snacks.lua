return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    init = function()
        _G.Snacks = require('snacks')
        Snacks = require('snacks')
    end,
    ---@type snacks.Config
    opts = {
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    auto_close = true,
                    follow_file = true,
                    focus = 'list',
                    jump = { close = false },
                    layout = {
                        preset = 'sidebar',
                        preview = false,
                        layout = {
                            position = 'right',
                        },
                    },
                    formatters = {
                        file = { filename_only = true },
                        severity = { pos = 'right' },
                    },
                },
            },
        },
        explorer = {
            enabled = true,
            keymaps = {
                ['r'] = 'rename',
            },
        },
        terminal = { enabled = true },
        words = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                { section = 'header' },
                { section = 'keys', gap = 1, padding = 1 },
                { section = 'startup' },
            },
        },
        notifier = {
            enabled = true,
            style = 'fancy',
            timeout = 5000,
            width = { min = 40, max = 0.8 },
            height = { min = 1, max = 0.6 },
            margin = { top = 0, right = 1, bottom = 0 },
            padding = true,
            sort = { 'level', 'added' },
            level = vim.log.levels.INFO,
            icons = {
                error = ' ',
                warn = ' ',
                info = ' ',
                debug = ' ',
                trace = ' ',
            },
        },
        indent = { enabled = true },
        bigfile = {
            enabled = true,
            notify = true,
            size = 1024 * 1024,
            setup = function(ctx)
                vim.cmd('NoMatchParen')
                vim.opt_local.foldmethod = 'manual'
                vim.opt_local.spell = false
                vim.opt_local.syntax = 'off'
                vim.opt_local.swapfile = false
                vim.opt_local.undofile = false
                vim.opt_local.wrap = false
                vim.opt_local.list = false
                vim.opt_local.colorcolumn = ''
                vim.opt_local.relativenumber = false
                vim.opt_local.cursorline = false
                vim.opt_local.cursorcolumn = false
                vim.opt_local.signcolumn = 'no'

                vim.schedule(function()
                    pcall(vim.treesitter.stop, ctx.buf)
                end)

                vim.schedule(function()
                    local clients = vim.lsp.get_clients({ bufnr = ctx.buf })
                    for _, client in ipairs(clients) do
                        vim.lsp.buf_detach_client(ctx.buf, client.id)
                    end
                end)

                vim.schedule(function()
                    local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
                    if gitsigns_ok then
                        pcall(gitsigns.detach, ctx.buf)
                    end

                    pcall(vim.cmd, 'IBLDisable')
                end)
            end,
        },
        quickfile = {
            enabled = true,
        },
        scope = {
            enabled = true,
            animate = false,
            backdrop = false,
            border = 'rounded',
            treesitter = {
                blocks = {
                    'function',
                    'method',
                    'class',
                    'if_statement',
                    'for_statement',
                    'while_statement',
                },
            },
            events = {
                'CursorMoved',
                'CursorMovedI',
                'TextChanged',
                'TextChangedI',
            },
        },
        scroll = {
            enabled = false,
        },
        statuscolumn = {
            enabled = true,
            left = { 'mark', 'sign' },
            right = { 'fold', 'git' },
            folds = {
                open = true,
                git_hl = false,
            },
            git = {
                patterns = { 'GitSign', 'MiniDiffSign' },
            },
            refresh = 50,
        },
        image = {
            enabled = true,
            backend = 'auto',
            integrations = {
                markdown = true,
                neorg = false,
            },
            max_width = 100,
            max_height = 50,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = {},
        },
    },
    keys = {
        -- Notifications
        {
            '<space>nd',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Dismiss all Notifications',
        },
        {
            '<space>nh',
            '<cmd>NotificationHistory<cr>',
            desc = 'Show Notification History',
        },
        {
            '<space>nl',
            '<cmd>NotificationLast<cr>',
            desc = 'Show Last Notification',
        },
        {
            '<space>nc',
            '<cmd>NotificationClear<cr>',
            desc = 'Clear Notification History',
        },
        -- Dashboard
        {
            '<leader>db',
            function()
                Snacks.dashboard()
            end,
            desc = 'Toggle Dashboard',
        },
        -- Terminal
        {
            '<leader>tt',
            function()
                Snacks.terminal()
            end,
            desc = 'Toggle Terminal',
        },
        -- Picker
        {
            '<leader>fb',
            function()
                Snacks.picker.buffers()
            end,
            desc = 'Find Buffers',
        },
        {
            '<leader>fc',
            function()
                Snacks.picker.commands()
            end,
            desc = 'List Commands',
        },
        {
            '<leader>fd',
            function()
                Snacks.picker.diagnostics()
            end,
            desc = 'Find Diagnostics',
        },
        {
            '<leader>ff',
            function()
                Snacks.picker.files()
            end,
            desc = 'Find Files',
        },
        {
            '<leader>fg',
            function()
                Snacks.picker.grep()
            end,
            desc = 'Find Word',
        },
        {
            '<leader>fh',
            function()
                Snacks.picker.help()
            end,
            desc = 'Find Help',
        },
        {
            '<leader>fk',
            function()
                Snacks.picker.keymaps()
            end,
            desc = 'Find Keymaps',
        },
        {
            '<leader>fl',
            function()
                Snacks.picker.highlights()
            end,
            desc = 'Find Highlights',
        },
        {
            '<leader>fo',
            function()
                Snacks.picker.recent()
            end,
            desc = 'Recently opened files',
        },
        {
            '<leader>fr',
            function()
                Snacks.picker.grep_word()
            end,
            desc = 'Find Word Under Cursor',
        },
        {
            '<leader>ft',
            function()
                Snacks.picker.git_files()
            end,
            desc = 'Find Git Files',
        },
        {
            '<leader>?',
            '<cmd>lua Snacks.picker.keymaps()<cr>',
            desc = 'Cheatsheet',
        },
        -- Explorer
        {
            '<Space>e',
            function()
                Snacks.explorer()
            end,
            desc = 'File Explorer',
        },
        {
            '<Leader>e',
            function()
                Snacks.explorer()
            end,
            desc = 'File Explorer',
        },
        -- Big Files
        {
            '<leader>bf',
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
                local is_bigfile = vim.b[bufnr].bigfile
                local msg = string.format(
                    'File size: %.1f KB\nBig file optimizations: %s',
                    file_size / 1024,
                    is_bigfile and 'ENABLED' or 'DISABLED'
                )
                vim.notify(msg, vim.log.levels.INFO)
            end,
            desc = 'Big File Status',
        },
        -- Quickfile
        {
            '<leader>qf',
            function()
                Snacks.quickfile()
            end,
            desc = 'Quick File Actions',
        },
        -- Scope
        {
            '<leader>sc',
            function()
                Snacks.scope()
            end,
            desc = 'Toggle Scope',
        },
        -- StatusColumn
        {
            '<leader>st',
            function()
                Snacks.statuscolumn.toggle()
            end,
            desc = 'Toggle Status Column',
        },
    },
}
