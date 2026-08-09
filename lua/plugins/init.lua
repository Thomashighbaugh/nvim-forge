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
    --    sort lines alphabetically (built-in :sort, aliased as :Sort)
    --    Keymaps replaced with built-in :sort commands.
    --    See core/usercommands.lua for :Sort alias.
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
        dependencies = { 'MunifTanjim/nui.nvim' },
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

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                    Markdown Writing                     │
    -- ╰─────────────────────────────────────────────────────────╯
    -- Mini suite is now configured in mini-suite.lua
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
            -- Only render markdown visuals in normal/visual mode, not insert.
            -- The old `render_modes = true` included ALL modes, which meant a
            -- buffer-wide visual re-render on every insert-mode keystroke.
            render_modes = { 'n', 'v' },
            debounce = 200,
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
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                       YANK / PUT                         │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'gbprod/yanky.nvim',
        enabled = true,
        keys = {
            { '<leader>y', '<cmd>YankyRingHistory<cr>', mode = { 'n', 'x' }, desc = 'Yank Ring History (Yanky)' },
            { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank (Yanky)' },
            { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put After (Yanky)' },
            { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put Before (Yanky)' },
            { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'GPut After (Yanky)' },
            { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'GPut Before (Yanky)' },
            {
                '<C-left>P',
                '<Plug>(YankyPutIndentBeforeLinewise)',
                mode = { 'n', 'x' },
                desc = 'Put Indent Before Linewise (Yanky)',
            },
            {
                '>p',
                '<Plug>(YankyPutIndentAfterShiftRight)',
                mode = { 'n', 'x' },
                desc = 'Put Indent After Shift Right (Yanky)',
            },
            {
                '<p',
                '<Plug>(YankyPutIndentAfterShiftLeft)',
                mode = { 'n', 'x' },
                desc = 'Put Indent After Shift Left (Yanky)',
            },
            {
                '>P',
                '<Plug>(YankyPutIndentBeforeShiftRight)',
                mode = { 'n', 'x' },
                desc = 'Put Indent Before Shift Right (Yanky)',
            },
            {
                '<P',
                '<Plug>(YankyPutIndentBeforeShiftLeft)',
                mode = { 'n', 'x' },
                desc = 'Put Indent Before Shift Left (Yanky)',
            },
            { '=p', '<Plug>(YankyPutAfterFilter)', mode = { 'n', 'x' }, desc = 'Put After Filter (Yanky)' },
            { '=P', '<Plug>(YankyPutBeforeFilter)', mode = { 'n', 'x' }, desc = 'Put Before Filter (Yanky)' },
        },
        opts = {
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 300,
            },
        },
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                      CODE SNAPSHOT                       │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'mistricky/codesnap.nvim',
        build = 'make',
        cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapASCII' },
        keys = {
            { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'v', desc = 'Code Screenshot to Clipboard' },
            { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'v', desc = 'Code Screenshot Save' },
        },
        opts = {
            save_path = '~/Desktop',
            has_breadcrumbs = true,
            bg_padding = 0,
            watermark = '',
        },
    },
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                           AI                             │
    --  ╰──────────────────────────────────────────────────────────╯
    {
        'nomnivore/ollama.nvim', -- for release
        cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

        keys = {
            {
                '<leader>Oo',
                ":<c-u>lua require('ollama').prompt()<cr>",
                desc = 'Ollama Prompt',
                mode = { 'n', 'v' },
            },
            {
                '<leader>Om',
                '<cmd>OllamaModel<cr>',
                desc = 'Ollama Model',
            },
            {
                '<leader>Os',
                '<cmd>OllamaServe<cr>',
                desc = 'Ollama Serve',
            },
            {
                '<leader>OS',
                '<cmd>OllamaServeStop<cr>',
                desc = 'Ollama Serve Stop',
            },
            {
                '<leader>OM',
                ':Ollama Modify_Code<cr>',
                desc = 'Modify Code',
                mode = { 'n', 'v' },
            },
            {
                '<leader>OG',
                ":lua require('ollama').prompt('Generate_Code')<cr>",
                desc = 'Generate Code',
            },
            {
                '<leader>Oq',
                function()
                    require('ollama').cancel_all_jobs()
                end,
                desc = 'Cancel All Jobs',
            },
        },

        config = function(_, opts)
            require('ollama').setup(opts)
            local config = require('ollama').config

            if not config then
                return
            end

            local stream_all = true

            if stream_all then
                for _, val in pairs(config.prompts) do
                    if val and val.action == 'replace' then
                        val.action = 'display_replace'
                    elseif val and val.action == 'insert' then
                        val.action = 'display_insert'
                    end
                end
            end

            local win_type = 'float'

            for _, val in pairs(config.prompts) do
                if val and val.action == 'display' then
                    val.action = require('ollama.actions.factory').create_action({
                        display = true,
                        show_prompt = true,
                        window = win_type,
                    })
                elseif val and val.action == 'display_replace' then
                    val.action = require('ollama.actions.factory').create_action({
                        display = true,
                        show_prompt = true,
                        window = win_type,
                        replace = true,
                    })
                elseif val and val.action == 'display_insert' then
                    val.action = require('ollama.actions.factory').create_action({
                        display = true,
                        show_prompt = true,
                        window = win_type,
                        insert = true,
                    })
                end
            end
        end,

        -- prompt
        opts = {
            model = 'deepseek-v4-flash:preview-cloud',
            url = 'http://127.0.0.1:11434',
            serve = {
                on_start = false,
                command = 'ollama',
                args = { 'serve' },
                stop_command = 'pkill',
                stop_args = { '-SIGTERM', 'ollama' },
            },
            -- Prompt[]
            prompts = {
                -- prompts for testing functionality
                -- Prompt
                Test_Stream = {
                    prompt = "Write me an interesting story about a programmer who couldn't fix their software's bugs.",
                    action = 'display',
                    options = {
                        seed = 123456,
                    },
                },

                Json_Api = {
                    prompt = '$input',
                    system = 'You are a RESTful API. The user is sending a request to you, and you must respond with a JSON object.',
                    format = 'json',
                },
                -- Prompt
                Ask_About_Code = {
                    action = 'display',
                },

                -- Prompt
                Generate_Code_At_Line = {
                    system = [[ You are a pair programming AI assistant. The human has written a file, and needs you to write a snippet code for a specific task or purpose.
          Your code will be inserted at the line number specified.
          Respond only with the code you would write, not the entire file. Do not include extra explanations, and do not repeat the code the human has already written.
          ]],
                    prompt = 'Here is what I need: $input\n Here is the code I have written so far:\n```$ftype\n$buf\n```\nYour code will be inserted at line $lnum. Please format your response like this: \n```$ftype\n<your code here>\n```\n',
                    action = 'display_insert',
                },

                Repeat_Word = {
                    prompt = 'Repeat this word back to me: $sel',
                },
            },
        },
    },
    -- ╔═════════════════════════════════════════════════════════╗
    -- ║                     code companion                      ║
    -- ╚═════════════════════════════════════════════════════════╝
    {
        'olimorris/codecompanion.nvim',
        config = function()
            require('codecompanion').setup({
                adapters = {
                    http = {
                        ollama = function()
                            return require('codecompanion.adapters').extend('ollama', {
                                schema = {
                                    model = {
                                        default = 'deepseek-v4-flash:preview-cloud',
                                        choices = {
                                            ['deepseek-v4-pro:cloud'] = {
                                                opts = {
                                                    can_reason = true,
                                                    can_use_tools = true,
                                                    has_vision = true,
                                                },
                                            },
                                            ['deepseek-v4-flash:preview-cloud'] = {
                                                opts = {
                                                    can_reason = true,
                                                    can_use_tools = true,
                                                    has_vision = true,
                                                },
                                            },
                                            ['glm-5.2:cloud'] = {
                                                opts = {
                                                    can_reason = true,
                                                    can_use_tools = true,
                                                    has_vision = true,
                                                },
                                            },
                                        },
                                    },
                                    num_ctx = {
                                        default = 32768,
                                    },
                                },
                            })
                        end,
                    },
                },
                strategies = {
                    chat = {
                        adapter = 'ollama',
                    },
                    inline = {
                        adapter = 'ollama',
                    },
                    agent = {
                        adapter = 'ollama',
                    },
                    cmd = {
                        adapter = 'ollama',
                    },
                },
                display = {
                    chat = {
                        window = {
                            layout = 'vertical',
                            width = 0.45,
                            height = 0.9,
                            opts = {
                                number = false,
                                relativenumber = false,
                                wrap = true,
                            },
                        },
                    },
                    action_palette = {
                        width = 95,
                        height = 10,
                        prompt = 'Prompt ',
                        provider = 'telescope',
                        opts = {
                            show_default_actions = true,
                            show_default_prompt_library = true,
                        },
                    },
                },
                extensions = {
                    history = {
                        enabled = true,
                        opts = {
                            keymap = 'gh',
                            auto_generate_title = true,
                            continue_last_chat = true,
                            delete_on_clearing_chat = true,
                            picker = 'snacks',
                            enable_logging = false,
                            dir_to_save = vim.fn.stdpath('data') .. '/codecompanion-history',
                        },
                    },
                },
                opts = {
                    log_level = 'TRACE',
                },
            })
        end,
        keys = {
            { '<leader>Oc', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion Chat', mode = { 'n', 'v', 'x' } },
            {
                '<leader>Oa',
                '<cmd>CodeCompanionActions<cr>',
                desc = 'CodeCompanion Actions',
                mode = { 'n', 'v', 'x' },
            },
            { '<leader>Od', '<cmd>CodeCompanionCmd<cr>', desc = 'CodeCompanion CMD', mode = { 'n', 'v', 'x' } },
            { '<leader>O<space>', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion', mode = { 'n', 'v', 'x' } },
        },
        dependencies = {
            { 'j-hui/fidget.nvim', dependencies = { 'rcarriga/nvim-notify' } },
            'ravitemer/codecompanion-history.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
