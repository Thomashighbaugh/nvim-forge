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
        'smjonas/live-command.nvim',
        enabled = false,
        event = 'CmdlineEnter',
        config = function()
            require('live-command').setup({
                commands = {
                    Norm = { cmd = 'norm' },
                },
            })
        end,
    },
    {
        'nguyenvukhang/nvim-toggler',
        keys = {
            { '<leader>w', desc = 'Toggle Word' },
        },
        config = function()
            require('nvim-toggler').setup({
                remove_default_keybinds = true,
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>w', require('nvim-toggler').toggle, { desc = 'Toggle a Word' })
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
        'jokajak/keyseer.nvim',
        enabled = false,
        version = false,
        cmd = 'KeySeer',
        opts = {
            ui = {
                winblend = 100,
                border = 'rounded',
            },
            keyboard = {
                layout = 'qwerty',
            },
        },
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
    {
        'sQVe/sort.nvim',
        config = function()
            require('sort').setup()
        end,
    },
    {
        'echasnovski/mini.surround',
        keys = function(_, keys)
            -- Populate the keys based on the user's options
            local plugin = require('lazy.core.config').spec.plugins['mini.surround']
            local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
            local mappings = {
                { opts.mappings.add, desc = 'Add surrounding', mode = { 'n', 'v' } },
                { opts.mappings.delete, desc = 'Delete surrounding' },
                { opts.mappings.find, desc = 'Find right surrounding' },
                { opts.mappings.find_left, desc = 'Find left surrounding' },
                { opts.mappings.highlight, desc = 'Highlight surrounding' },
                { opts.mappings.replace, desc = 'Replace surrounding' },
                { opts.mappings.update_n_lines, desc = 'Update `MiniSurround.config.n_lines`' },
            }
            mappings = vim.tbl_filter(function(m)
                return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
                add = 'Ga', -- Add surrounding in Normal and Visual modes
                delete = 'Gd', -- Delete surrounding
                find = 'Gf', -- Find surrounding (to the right)
                find_left = 'GF', -- Find surrounding (to the left)
                highlight = 'Gh', -- Highlight surrounding
                replace = 'Gr', -- Replace surrounding
                update_n_lines = 'Gn', -- Update `n_lines`
            },
        },
    },
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    Markdown Writing                     │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = 'markdown',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
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

    --  ╭──────────────────────────────────────────────────────────╮
    --  │                        REST-HTML                         │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'diepm/vim-rest-console',
        enabled = false,
        ft = 'rest',
    },
}
