return {
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                      COMMENT.NVIM                       │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        keys = {
            { 'gc', mode = 'v' },
            { 'gb', mode = 'v' },
            { 'gcc' },
            { 'gbc' },
            { 'gco' },
            { 'gcO' },
            { 'gcA' },
        },
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                config = function()
                    require('ts_context_commentstring').setup({
                        enable_autocmd = false,
                    })
                end,
            },
        },
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
                -- pre_hook = function()
                --     return vim.bo.commentstring
                -- end,
            })
        end,
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                   TODO-COMMENTS.NVIM                    │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'folke/todo-comments.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        keys = {
            { '<leader>tq', '<cmd>TodoQuickFix<cr>', desc = 'Todo QuickFix' },
            { '<leader>tl', '<cmd>TodoLocList<cr>', desc = 'Todo LocList' },
            { '<leader>ts', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope' },
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                FIX = {
                    icon = ' ', -- icon used for the sign, and in search results
                    color = 'error', -- can be a hex color, or a named color (see below)
                    alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = ' ', color = 'info' },
                HACK = { icon = ' ', color = 'warning' },
                WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
                PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
                TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
            },
            gui_style = {
                fg = 'NONE', -- The gui style to use for the fg highlight group.
                bg = 'BOLD', -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true, -- enable multine todo comments
                multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
                before = '', -- "fg" or "bg" or empty
                keyword = 'wide', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = 'fg', -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {}, -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
                info = { 'DiagnosticInfo', '#2563EB' },
                hint = { 'DiagnosticHint', '#10B981' },
                default = { 'Identifier', '#7C3AED' },
                test = { 'Identifier', '#FF00FF' },
            },
            search = {
                command = 'rg',
                args = {
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    COMMENT-BOX.NVIM                     │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'LudoPinelli/comment-box.nvim',
        cmd = { 'CBcatalog', 'CBlcbox7', 'CBlcbox13', 'CBd', 'CBline14' },
        keys = {
            { '<leader>cb', '<cmd>CBlcbox7<cr>', desc = 'Section Title' },
            { '<leader>cd', '<cmd>CBd<cr>', desc = 'Delete Commet Box' },
            { '<leader>ca', '<cmd>CBlcbox13<cr>', desc = 'Subsection Title' },
            { '<leader>cl', '<cmd>CBcatalog<cr>', desc = 'Comment Box Catalog' },
            { '<leader>cl', '<cmd>CBline14<cr>', desc = 'Dividing Line' },
        },
        opts = {
            line_width = 60,
        },
    },

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                   NVIM-COMMENT-FRAME                    │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        's1n7ax/nvim-comment-frame',
        enabled = true,
        keys = {
            { '<leader>cf', desc = 'Single Comment Frame' },
            { '<leader>cm', desc = 'Multi Comment Frame' },
        },
        dependencies = 'nvim-treesitter',
        config = true,
    },
}
