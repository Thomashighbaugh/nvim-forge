return {
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
                                        default = 'glm-5.1:cloud',
                                        choices = {
                                            ['glm-5.1:cloud'] = {
                                                opts = {
                                                    can_reason = true,
                                                    can_use_tools = true,
                                                    has_vision = true,
                                                },
                                            },
                                            ['glm-5:cloud'] = {
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
