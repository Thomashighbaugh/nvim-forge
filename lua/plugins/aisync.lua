return {
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                      ollama-chat                         │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'gerazov/ollama-chat.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = {
            'OllamaQuickChat',
            'OllamaCreateNewChat',
            'OllamaContinueChat',
            'OllamaChat',
            'OllamaChatCode',
            'OllamaModel',
            'OllamaServe',
            'OllamaServeStop',
        },
        keys = {
            {
                '<leader>Ocq',
                '<cmd>OllamaQuickChat<cr>',
                desc = 'Ollama Quick Chat',
                mode = { 'n', 'x' },
                silent = true,
            },
            {
                '<leader>Ocn',
                '<cmd>OllamaCreateNewChat<cr>',
                desc = 'Create Ollama Chat',
                mode = { 'n', 'x' },
                silent = true,
            },
            {
                '<leader>Occ',
                '<cmd>OllamaContinueChat<cr>',
                desc = 'Continue Ollama Chat',
                mode = { 'n', 'x' },
                silent = true,
            },
            {
                '<leader>Och',
                '<cmd>OllamaChat<cr>',
                desc = 'Chat',
                mode = { 'n' },
                silent = true,
            },
            {
                '<leader>Ocd',
                '<cmd>OllamaChatCode<cr>',
                desc = 'Chat Code',
                mode = { 'n' },
                silent = true,
            },
        },
        opts = {
            chats_folder = vim.fn.stdpath('data'),
            quick_chat_file = 'ollama-chat.md',
            animate_spinner = true,
            model = 'glm-5:cloud',
            model_code = 'glm-5:cloud',
            url = 'http://127.0.0.1:11434',
            serve = {
                on_start = false,
                command = 'ollama',
                args = { 'serve' },
                stop_command = 'pkill',
                stop_args = { '-SIGTERM', 'ollama' },
            },
        },
    },

    -- ╔═════════════════════════════════════════════════════════╗
    -- ║                     code companion                      ║
    -- ╚═════════════════════════════════════════════════════════╝
    {
        'olimorris/codecompanion.nvim',
        opts = {
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
                mcphub = {
                    callback = 'mcphub.extensions.codecompanion',
                    opts = {
                        make_vars = true,
                        make_slash_commands = true,
                        show_result_in_chat = true,
                    },
                },
                vectorcode = {
                    opts = {
                        add_tool = true,
                    },
                },
            },
            adapters = {
                ollama = function()
                    return require('codecompanion.adapters').extend('ollama', {
                        schema = {
                            model = {
                                default = 'glm-5:cloud',
                            },
                        },
                    })
                end,
            },
        },
        keys = {
            { '<leader>Occ', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion Chat', mode = { 'n', 'v', 'x' } },
            {
                '<leader>Oca',
                '<cmd>CodeCompanionActions<cr>',
                desc = 'CodeCompanion Actions',
                mode = { 'n', 'v', 'x' },
            },
            { '<leader>Ocd', '<cmd>CodeCompanionCmd<cr>', desc = 'CodeCompanion CMD', mode = { 'n', 'v', 'x' } },
            { '<leader>Oc<space>', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion', mode = { 'n', 'v', 'x' } },
        },
        dependencies = {
            'j-hui/fidget.nvim',
            'ravitemer/codecompanion-history.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('codecompanion').setup({
                strategies = {
                    chat = {
                        adapter = 'ollama',
                    },
                    inline = {
                        adapter = 'ollama',
                    },
                    cmd = {
                        adapter = 'ollama',
                    },
                },
                display = {
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
            })
        end,
    },
}
