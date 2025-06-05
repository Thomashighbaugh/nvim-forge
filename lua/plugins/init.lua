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
                'toggleterm',
            },
            plugins = {
                bufferline = {
                    underline_selected = true,
                    underline_visible = false,
                    underline_fill = false,
                    bold = false,
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
    {
        'ellisonleao/glow.nvim',
        cmd = 'Glow',
        ft = 'markdown',
        config = true,
        opts = {
            border = 'double',
            style = 'dark',
            width = 120,
            width_ratio = 0.8,
        },
    },
    {
        'nvim-zh/colorful-winsep.nvim',
        enabled = true,
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            only_line_seq = false,
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         COLORS                          │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'uga-rosa/ccc.nvim',
        keys = {
            { '<leader>cc', '<cmd>CccPick<cr>', desc = 'Color Picker' },
        },
        opts = {
            win_opts = {
                border = 'single',
            },
        },
    },
    {
        'brenoprata10/nvim-highlight-colors',
        enabled = true,
        event = 'BufReadPre',
        opts = {
            render = 'virtual', ---@usage 'background'|'foreground'|'virtual'
            virtual_symbol = '',
        },
        config = true,
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
    -- ╞══════════════════════════════════════════════════════════╡
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

    -- icons
    {
        'echasnovski/mini.icons',
        enabled = true,
        opts = {},
        lazy = true,
    },
    -- for kitty
    {
        'fladson/vim-kitty',
        'MunifTanjim/nui.nvim',
    },
    -- colors
    { 'nvzone/volt', lazy = true },

    {
        'nvzone/minty',
        cmd = { 'Shades', 'Huefy' },
    },

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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                          DEBUG                           │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mfussenegger/nvim-dap',
        cmd = { 'DapToggleBreakpoint' },
        keys = {
            { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Add Breakpoint' },
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
            { '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', desc = 'DAP UI Toggle' },
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
