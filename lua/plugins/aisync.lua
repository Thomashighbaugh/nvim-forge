return {
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
            })
        end,
    },
}
