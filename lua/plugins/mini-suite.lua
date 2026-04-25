-- ╭─────────────────────────────────────────────────────────╮
-- │                     MINI.NVIM SUITE                     │
-- ╰─────────────────────────────────────────────────────────╯
return {
    {
        'echasnovski/mini.nvim',
        version = false, -- Use main branch for latest features
        event = 'VeryLazy',
        config = function()
            -- ╭─────────────────────────────────────────────────────────╮
            -- │                    MINI.VISITS                          │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Track and navigate frequently/recently visited files
            require('mini.visits').setup({
                -- How visit is tracked
                track = {
                    event = 'BufEnter', -- Track on buffer enter
                    delay = 1000, -- Delay in ms
                },
                -- How visit information is stored
                store = {
                    -- Path where visit information is stored
                    path = vim.fn.stdpath('data') .. '/mini-visits.txt',
                    normalize = nil, -- Function for normalization (nil for default)
                },
                -- Whether to disable showing non-error feedback
                silent = false,
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                 MINI.FILES (DISABLED)                   │
            -- ╰─────────────────────────────────────────────────────────╯
            -- NOTE: mini.files disabled to avoid conflicts with snacks.explorer
            -- User specifically wants to keep snacks.explorer functionality
            -- require('mini.files').setup({ ... })

            require('mini.snippets').setup({
                snippets = {
                    require('mini.snippets').gen_loader.from_file(vim.fn.stdpath('config') .. '/snippets/global.json'),
                    require('mini.snippets').gen_loader.from_lang(),
                },
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │           MINI.COMPLETION (REPLACED BY BLINK)           │
            -- ╰─────────────────────────────────────────────────────────╯

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                    MINI.PICK                            │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Picker replacement for telescope
            require('mini.pick').setup({
                -- Delays (in ms; should be at least 1)
                delay = {
                    -- Delay between forcing asynchronous behavior
                    async = 10,
                    -- Delay between computation start and visual feedback about it
                    busy = 50,
                },

                -- Keys for performing actions. See `:h MiniPick-actions`.
                mappings = {
                    choose = '<CR>',
                    choose_in_split = '<C-s>',
                    choose_in_tabpage = '<C-t>',
                    choose_in_vsplit = '<C-v>',
                    choose_marked = '<M-CR>',

                    delete_char = '<BS>',
                    delete_char_right = '<Del>',
                    delete_left = '<C-u>',
                    delete_word = '<C-w>',

                    mark = '<C-x>',
                    mark_all = '<C-a>',

                    move_down = '<C-n>',
                    move_start = '<C-g>',
                    move_up = '<C-p>',

                    paste = '<C-r>',

                    refine = '<C-Space>',
                    refine_marked = '<M-Space>',

                    scroll_down = '<C-f>',
                    scroll_left = '<C-h>',
                    scroll_right = '<C-l>',
                    scroll_up = '<C-b>',

                    stop = '<Esc>',

                    toggle_info = '<S-Tab>',
                    toggle_preview = '<Tab>',
                },

                -- General options controlling behavior
                options = {
                    -- Whether to show content from bottom to top
                    content_from_bottom = false,
                    -- Whether to cache visited paths (like for `MiniPick.builtin.resume`)
                    use_cache = false,
                },

                -- Window related options
                window = {
                    -- Configuration for floating window (function or table)
                    config = {
                        anchor = 'NW',
                        height = math.floor(0.618 * vim.o.lines),
                        width = math.floor(0.618 * vim.o.columns),
                        row = math.floor(0.191 * vim.o.lines),
                        col = math.floor(0.191 * vim.o.columns),
                        border = 'single',
                    },
                    -- Prompt configuration (updated for modern mini.pick)
                    prompt_caret = '▏',
                    prompt_prefix = '> ',
                },
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                  MINI.BRACKETED                         │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Navigate with [/] brackets
            require('mini.bracketed').setup({
                -- First-level elements are tables describing behavior of a target:
                --
                -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
                --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
                --   Supply empty string `''` to not create mappings.
                --
                -- - <options> - table with target options.
                --
                -- See `:h MiniBracketed.config` for more details.

                buffer = { suffix = 'b', options = {} },
                comment = { suffix = 'c', options = {} },
                conflict = { suffix = 'x', options = {} },
                diagnostic = { suffix = 'd', options = {} },
                file = { suffix = 'f', options = {} },
                indent = { suffix = 'i', options = {} },
                jump = { suffix = 'j', options = {} },
                location = { suffix = 'l', options = {} },
                oldfile = { suffix = 'o', options = {} },
                quickfix = { suffix = 'q', options = {} },
                treesitter = { suffix = 't', options = {} },
                undo = { suffix = 'u', options = {} },
                window = { suffix = 'w', options = {} },
                yank = { suffix = 'y', options = {} },
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                    MINI.NOTIFY                          │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Notification system replacement for nvim-notify
            require('mini.notify').setup({
                -- Content management
                content = {
                    -- Function which formats the notification message
                    -- By default prepends message with notification time
                    format = nil,
                    -- Function which orders notification array from most to least important
                    -- By default orders first by level and then by update time
                    sort = nil,
                },

                -- Notifications about LSP progress
                lsp_progress = {
                    -- Whether to enable showing
                    enable = true,
                    -- Duration (in ms) of how long last message should be shown
                    duration_last = 1000,
                },

                -- Window options
                window = {
                    -- Floating window config
                    config = {},
                    -- Maximum window width as share (between 0 and 1) of available columns
                    max_width_share = 0.382,
                    -- Value of 'winblend' option
                    winblend = 25,
                },
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                   MINI.COMMENT                          │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Comment system replacement for Comment.nvim
            require('mini.comment').setup({
                -- Options which control module behavior
                options = {
                    -- Function to compute custom 'commentstring' (optional)
                    custom_commentstring = nil,
                    -- Whether to ignore blank lines
                    ignore_blank_line = false,
                    -- Whether to recognize as comment only lines without indent
                    start_of_line = false,
                    -- Whether to ensure single space pad for comment parts
                    pad_comment_parts = true,
                },
                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    -- Toggle comment (like `gcip` - comment inner paragraph) for both
                    -- Normal and Visual modes
                    comment = 'gc',
                    -- Toggle comment on current line
                    comment_line = 'gcc',
                    -- Toggle comment on visual selection
                    comment_visual = 'gc',
                    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                    textobject = 'gc',
                },
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                  MINI.STATUSLINE                        │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Status line replacement for lualine.nvim
            require('mini.statusline').setup({
                -- Content of statusline as functions which return statusline string. See
                -- `:h statusline` and code of default contents (used instead of `nil`).
                content = {
                    -- Content for active window
                    active = nil,
                    -- Content for inactive window(s)
                    inactive = nil,
                },
                -- Whether to use icons (requires 'mini.icons')
                use_icons = true,
                -- Whether to set Vim's settings for statusline (make it always shown with
                -- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
                -- this to `false` and 'laststatus' to 3.
                set_vim_settings = true,
            })

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                  MINI.BUFREMOVE                         │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Buffer management utilities
            require('mini.bufremove').setup()

            -- ╭─────────────────────────────────────────────────────────╮
            -- │                    MINI.ANIMATE                         │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Smooth animations for cursor movement and scrolling
            require('mini.animate').setup({
                -- Cursor path
                cursor = {
                    -- Whether to enable this animation
                    enable = true,
                    -- Timing of animation (how steps will progress in time)
                    timing = require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' }),
                    -- Path generator for visualized cursor movement
                    path = require('mini.animate').gen_path.line(),
                },
                -- Vertical scroll
                scroll = {
                    -- Whether to enable this animation
                    enable = true,
                    -- Timing of animation (how steps will progress in time)
                    timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
                    -- Subscroll generator based on total scroll
                    subscroll = require('mini.animate').gen_subscroll.equal(),
                },
                -- Window resize
                resize = {
                    -- Whether to enable this animation
                    enable = false, -- Disabled to prevent conflicts
                    -- Timing of animation (how steps will progress in time)
                    timing = require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' }),
                    -- Subresize generator for all steps of resize animations
                    subresize = require('mini.animate').gen_subresize.equal(),
                },
                -- Window open
                open = {
                    -- Whether to enable this animation
                    enable = false, -- Disabled to prevent conflicts
                    -- Timing of animation (how steps will progress in time)
                    timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
                    -- Floating window config generator visualizing specific window
                    winconfig = require('mini.animate').gen_winconfig.wipe(),
                    -- Whether to randomize window choice when multiple are suitable
                    winblend = require('mini.animate').gen_winblend.linear(),
                },
                -- Window close
                close = {
                    -- Whether to enable this animation
                    enable = false, -- Disabled to prevent conflicts
                    -- Timing of animation (how steps will progress in time)
                    timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
                    -- Floating window config generator visualizing specific window
                    winconfig = require('mini.animate').gen_winconfig.wipe(),
                    -- Whether to randomize window choice when multiple are suitable
                    winblend = require('mini.animate').gen_winblend.linear(),
                },
            })
            -- ╭─────────────────────────────────────────────────────────╮
            -- │              EXISTING MINI MODULES                      │
            -- ╰─────────────────────────────────────────────────────────╯
            -- Keep existing mini modules that are already configured
            require('mini.ai').setup({ n_lines = 500 })
            require('mini.surround').setup()
            require('mini.pairs').setup()
        end,
        keys = {
            -- Mini.visits keybindings
            {
                '<leader>vv',
                function()
                    require('mini.visits').select_path()
                end,
                desc = 'Select recent path',
            },
            {
                '<leader>vf',
                function()
                    require('mini.visits').select_path('', { filter = 'frequent' })
                end,
                desc = 'Select frequent path',
            },
            {
                '<leader>vr',
                function()
                    require('mini.visits').select_path('', { filter = 'recent' })
                end,
                desc = 'Select recent path',
            },
            {
                '<leader>vc',
                function()
                    require('mini.visits').select_path(vim.fn.getcwd())
                end,
                desc = 'Select path in cwd',
            },

            -- Mini.pick keybindings (telescope replacement)
            {
                '<leader>ff',
                function()
                    require('mini.pick').builtin.files()
                end,
                desc = 'Find files',
            },
            {
                '<leader>fg',
                function()
                    require('mini.pick').builtin.grep_live()
                end,
                desc = 'Live grep',
            },
            {
                '<leader>fb',
                function()
                    require('mini.pick').builtin.buffers()
                end,
                desc = 'Find buffers',
            },
            {
                '<leader>fh',
                function()
                    require('mini.pick').builtin.help()
                end,
                desc = 'Find help',
            },
            {
                '<leader>fr',
                function()
                    require('mini.pick').builtin.resume()
                end,
                desc = 'Resume last picker',
            },
            {
                '<leader>f/',
                function()
                    require('mini.pick').builtin.grep()
                end,
                desc = 'Grep in files',
            },

            -- Mini.bufremove keybindings
            {
                '<leader>bd',
                function()
                    require('mini.bufremove').delete()
                end,
                desc = 'Delete buffer (keep layout)',
            },
            {
                '<leader>bD',
                function()
                    require('mini.bufremove').delete(0, true)
                end,
                desc = 'Delete buffer (force)',
            },

            -- Convenience mappings
            {
                '<C-p>',
                function()
                    require('mini.pick').builtin.files()
                end,
                desc = 'Find files',
            },
            {
                '<leader>/',
                function()
                    require('mini.pick').builtin.grep_live()
                end,
                desc = 'Live grep',
            },
            {
                '-',
                function()
                    require('mini.pick').builtin.buffers()
                end,
                desc = 'Buffer picker (replaces snipe)',
            },
        },
    },
}
