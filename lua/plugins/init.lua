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
        'uga-rosa/ccc.nvim',
        keys = {
            { '<leader>Cp', '<cmd>CccPick<cr>', desc = 'Color Picker' },
            { '<leader>Cc', '<cmd>CccConvert<cr>', desc = 'Color Convert' },
        },
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        },
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
    -- snacks.nvim is now configured in lua/plugins/snacks.lua
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
