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
                    {
                        section = 'header',
                        text = {
                            '',
                            '',
                            '',
                            '                  dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb',
                            '                dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP',
                            '               dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP ',
                            '              dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP  ',
                            '             dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP   ',
                            '',
                            '',
                            '',
                        },
                    },
                    {
                        section = 'group',
                        sections = {
                            {
                                section = 'keys',
                                keys = {
                                    {
                                        icon = ' ',
                                        key = 'f',
                                        desc = 'Find file',
                                        action = ':lua Snacks.picker.files()',
                                    },
                                    { icon = '󰝒 ', key = 'n', desc = 'New file', action = ':enew | startinsert' },
                                    {
                                        icon = ' ',
                                        key = 'e',
                                        desc = 'File explorer',
                                        action = ':lua Snacks.explorer()',
                                    },
                                    {
                                        icon = ' ',
                                        key = 't',
                                        desc = 'Find text',
                                        action = ':lua Snacks.picker.grep()',
                                    },
                                    { icon = ' ', key = 'g', desc = 'Git', action = ':Neogit' },
                                    { icon = '💤', key = 'l', desc = 'Lazy', action = ':Lazy' },
                                    { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
                                },
                            },
                            { section = 'recent_files' },
                        },
                    },
                    { section = 'startup' },
                    {
                        section = 'footer',
                        text = function()
                            local stats = require('lazy').stats()
                            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                            return {
                                '⚡ Neovim loaded '
                                    .. stats.loaded
                                    .. '/'
                                    .. stats.count
                                    .. ' plugins in '
                                    .. ms
                                    .. 'ms',
                            }
                        end,
                    },
                },
            },
            notifier = {
                enabled = true,
                style = 'compact',
                timeout = 1000,
            },
            indent = { enabled = true },
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
        },
    },
    -- colors

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    Markdown Writing                     │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'Myzel394/easytables.nvim',
        ft = 'markdown',
        config = true,
    },
    {
        'Kicamon/markdown-table-mode.nvim',
        ft = 'markdown',
        config = true,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        opts = {},
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
