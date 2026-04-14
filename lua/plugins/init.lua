return {
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                       COLOR SCHEME                       │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'loctvl842/monokai-pro.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            transparent_background = true,
            devicons = true,
            filter = 'spectrum',
            inc_search = 'underline', -- underline | background
            background_clear = {
                'nvim-tree',
                'bufferline',
                'telescope',
            },
            plugins = {
                bufferline = {
                    underline_selected = true,
                    underline_visible = false,
                    underline_fill = false,
                    bold = true,
                },
                indent_blankline = {
                    context_highlight = 'default', -- default | pro
                    context_start_underline = true,
                },
            },
        },
        config = function(_, opts)
            local monokai = require('monokai-pro')
            monokai.setup(opts)
            monokai.load()
        end,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          UTILS                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'nguyenvukhang/nvim-toggler',
        keys = {
            { '<leader>w', desc = 'Toggle Word' },
        },
        config = function()
            require('nvim-toggler').setup({
                remove_default_keybinds = true,
            })
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>w',
                require('nvim-toggler').toggle,
                { desc = 'Toggle a Boolean Value' }
            )
        end,
    },
    {
        'chrisgrieser/nvim-alt-substitute',
        enabled = true,
        opts = true,
        -- lazy-loading with `cmd =` does not work well with incremental preview
        event = 'CmdlineEnter',
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         COLORS                          │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'wsdjeg/cpicker.nvim',
        keys = {
            { '<leader>Cp', '<cmd>CPicker<cr>', desc = 'Color Picker' },
            { '<leader>Cs', '<cmd>CPicker<cr>', desc = 'Color Shades' },
            { '<leader>Ch', '<cmd>CPicker<cr>', desc = 'Color Huefy' },
        },
        opts = {},
    },
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                     Text Functions                      │
    -- ╰─────────────────────────────────────────────────────────╯
    --    sort lists alphabetically
    {
        'sQVe/sort.nvim',
        keys = {
            { '<leader>so', '<cmd>Sort<CR>', desc = 'Sort lines (motion)', mode = { 'n' } },
            { '<leader>so', '<cmd>Sort<CR>', desc = 'Sort selection', mode = { 'v' } },
            { '<leader>si', '<cmd>Sort i<CR>', desc = 'Sort lines (ignore case)', mode = { 'n' } },
            { '<leader>si', '<cmd>Sort i<CR>', desc = 'Sort selection (ignore case)', mode = { 'v' } },
            { '<leader>su', '<cmd>Sort u<CR>', desc = 'Sort lines (unique)', mode = { 'n' } },
            { '<leader>su', '<cmd>Sort u<CR>', desc = 'Sort selection (unique)', mode = { 'v' } },
            { '<leader>sn', '<cmd>Sort n<CR>', desc = 'Sort lines (numeric)', mode = { 'n' } },
            { '<leader>sn', '<cmd>Sort n<CR>', desc = 'Sort selection (numeric)', mode = { 'v' } },
        },
        config = function()
            require('sort').setup()
        end,
    },
    {
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            require('mini.pairs').setup()
        end,
    },
    ----------------------------------------------------------------------
    --                              Icons                               --
    ----------------------------------------------------------------------

    {
        'echasnovski/mini.icons',
        enabled = true,
        opts = {},
        lazy = true,
    },
    ----------------------------------------------------------------------
    --                              Kitty                               --
    ----------------------------------------------------------------------
    {
        'fladson/vim-kitty',
        'MunifTanjim/nui.nvim',
    },
    {
        '2kabhishek/nerdy.nvim',
        cmd = 'Nerdy',
        opts = {
            max_recents = 30, -- Configure recent icons limit
            copy_to_clipboard = false, -- Copy glyph to clipboard instead of inserting
            copy_register = '+', -- Register to use for copying
        },
        keys = {
            { '<leader>in', ':Nerdy list<CR>', desc = 'Browse nerd icons' },
            { '<leader>iN', ':Nerdy recents<CR>', desc = 'Browse recent nerd icons' },
        },
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        init = function()
            _G.Snacks = require('snacks')
        end,
        ---@type snacks.Config
        opts = {
            picker = { enabled = true },
            explorer = {
                enabled = true,
                layout = { position = 'right' },
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
                style = 'fancy', -- Use fancy style for better visibility
                timeout = 5000, -- 5 seconds instead of 1
                width = { min = 40, max = 0.8 }, -- Allow wider notifications
                height = { min = 1, max = 0.6 }, -- Allow taller notifications
                margin = { top = 0, right = 1, bottom = 0 },
                padding = true,
                sort = { 'level', 'added' },
                level = vim.log.levels.INFO, -- Show all notifications
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
                notify = true, -- Show notification when optimizations are applied
                size = 1024 * 1024, -- 1MB threshold
                -- Configure what gets disabled for large files
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

                    -- Disable treesitter
                    vim.schedule(function()
                        pcall(vim.treesitter.stop, ctx.buf)
                    end)

                    -- Disable LSP
                    vim.schedule(function()
                        local clients = vim.lsp.get_clients({ bufnr = ctx.buf })
                        for _, client in ipairs(clients) do
                            vim.lsp.buf_detach_client(ctx.buf, client.id)
                        end
                    end)

                    -- Disable various plugins
                    vim.schedule(function()
                        -- Disable gitsigns
                        local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
                        if gitsigns_ok then
                            pcall(gitsigns.detach, ctx.buf)
                        end

                        -- Disable indent-blankline
                        pcall(vim.cmd, 'IBLDisable')

                        -- Disable mini.completion for big files
                        pcall(function()
                            local minicomp = require('mini.completion')
                            vim.b.minicompletion_disabled = true
                        end)
                    end)
                end,
            },
            quickfile = {
                enabled = true,
            },
            scope = {
                enabled = true,
                -- Disable animations to prevent easing errors
                animate = false,
                -- Configure scope appearance
                backdrop = false,
                border = 'rounded',
                -- Configure when to show scope
                treesitter = {
                    -- Show scope for these treesitter node types
                    blocks = {
                        'function',
                        'method',
                        'class',
                        'if_statement',
                        'for_statement',
                        'while_statement',
                    },
                },
                -- Show scope on cursor movements and text changes
                events = {
                    'CursorMoved',
                    'CursorMovedI',
                    'TextChanged',
                    'TextChangedI',
                },
            },
            -- Disable scroll module to prevent PageUp/PageDown conflicts and easing errors
            scroll = {
                enabled = false,
            },
            statuscolumn = {
                enabled = true,
                left = { 'mark', 'sign' }, -- Left side: marks and signs
                right = { 'fold', 'git' }, -- Right side: fold and git info
                folds = {
                    open = true, -- show open folds
                    git_hl = false, -- don't highlight git signs
                },
                git = {
                    patterns = { 'GitSign', 'MiniDiffSign' }, -- git sign patterns
                },
                refresh = 50, -- refresh every 50ms for performance
            },
            image = {
                enabled = true,
                -- Configure image viewing
                backend = 'auto', -- auto-detect best backend (ueberzug, kitty, etc.)
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
            -- Scroll module removed to prevent easing errors
            -- StatusColumn
            {
                '<leader>st',
                function()
                    Snacks.statuscolumn.toggle()
                end,
                desc = 'Toggle Status Column',
            },
        },
    },
    -- colors

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    Markdown Writing                     │
    -- ╰─────────────────────────────────────────────────────────╯
    -- Mini suite is now configured in mini-suite.lua
    -- {
    --     'echasnovski/mini.nvim',
    --     event = 'VeryLazy',
    --     config = function()
    --         require('mini.ai').setup({ n_lines = 500 })
    --         require('mini.surround').setup()
    --         require('mini.pairs').setup()
    --     end,
    -- },
    {
        'Kicamon/markdown-table-mode.nvim',
        ft = 'markdown',
        config = true,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        ft = 'markdown',
        opts = {
            -- Override built-in markdown syntax completely
            render_modes = true,
            -- Handle all markdown highlighting without system syntax
            enabled = true,
            max_file_size = 10.0,
            -- Work without treesitter markdown parser to avoid conflicts
            highlights = {
                heading = {
                    enabled = true,
                    sign = false,
                    backgrounds = { 'DiffAdd' },
                    foregrounds = { 'markdownH1', 'markdownH2', 'markdownH3', 'markdownH4', 'markdownH5', 'markdownH6' },
                },
                code = {
                    enabled = true,
                    sign = false,
                    style = 'normal',
                    position = 'left',
                    width = 'full',
                    height = 'block',
                    min_width = 0,
                    pad = 0,
                    border = 'thin',
                    above = '▄',
                    below = '▀',
                    highlight = 'RenderMarkdownCode',
                    highlight_inline = 'RenderMarkdownCodeInline',
                },
            },
        },
        config = function(_, opts)
            require('render-markdown').setup(opts)
        end,
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          DEBUG                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-dap',
        cmd = { 'DapToggleBreakpoint' },
        keys = {
            { '<leader>Db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
        },
        dependencies = {
            'theHamsta/nvim-dap-virtual-text',
            opts = {
                commented = true,
                virt_text_pos = 'eol',
            },
        },
        config = function()
            require('plugins.dap.debug_adapter')
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        keys = {
            { '<leader>Du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
        },
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = true,
    },

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           JAVA                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-jdtls',
        ft = 'java',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
    },
}
