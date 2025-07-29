return {
    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         Copilot                         │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = { 'InsertEnter' },
        build = ':Copilot auth',
        dependencies = { 'zbirenbaum/copilot-cmp' },
        config = function()
            require('copilot').setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_next = '<c-j>',
                        jump_prev = '<c-k>',
                        accept = '<c-a>',
                        refresh = 'r',
                        open = '<M-CR>',
                    },
                    layout = {
                        position = 'bottom', -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = '<c-a>',
                        accept_word = false,
                        accept_line = false,
                        next = '<c-j>',
                        prev = '<c-k>',
                        dismiss = '<C-e>',
                    },
                },
            })
        end,
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = true },
            filetypes = {
                ['*'] = true, -- disable for all other filetypes and ignore default `filetypes`
            },
        },
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
            { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
        },
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
    {
        'zbirenbaum/copilot-cmp',
        event = { 'InsertEnter' },
        dependencies = { 'copilot.lua' },
        opts = {},
        config = function(_, opts)
            local copilot_cmp = require('copilot_cmp')
            copilot_cmp.setup(opts)
        end,
    },

    -- ╔═════════════════════════════════════════════════════════╗
    -- ║                        llm nvim                         ║
    -- ╚═════════════════════════════════════════════════════════╝
    {
        'huggingface/llm.nvim',
        -- event = { 'InsertEnter', 'CmdlineEnter' },
        lazy = true,
        opts = function()
            local job = require('plenary.job')
            local logger = require('plenary.log').new({
                plugin = 'llm.nvim',
                level = 'info',
            })

            -- Splits a command into a table of words.
            local splitCommandIntoTable = function(command)
                local cmd = {}
                for word in command:gmatch('%S+') do
                    table.insert(cmd, word)
                end
                return cmd
            end

            -- Loads a configuration value from an external command.
            -- Executes the given command and passes its result to the callback.
            -- If the command returns an empty string or fails, uses the provided default value if available.
            local function loadConfigFromCommand(command, callback, defaultValue)
                local cmd = splitCommandIntoTable(command)
                job:new({
                    command = cmd[1],
                    args = vim.list_slice(cmd, 2, #cmd),
                    on_exit = function(j, exit_code)
                        if exit_code ~= 0 then
                            logger.warn("Command '" .. command .. "' did not return a value when executed")
                            return
                        end
                        local value = j:result()[1]:gsub('%s+$', '')
                        if value ~= nil and value ~= '' then
                            callback(value)
                        elseif defaultValue ~= nil and defaultValue ~= '' then
                            callback(defaultValue)
                        end
                    end,
                }):start()
            end

            -- Attempts to load the Hugging Face API token from an external command.
            local huggingface_api_token
            local command = 'pass show huggingface/access-token'
            loadConfigFromCommand(command, function(value)
                huggingface_api_token = value
            end, '')

            return {
                api_token = huggingface_api_token,
                model = 'bigcode/starcoder', -- can be a model ID or an http(s) endpoint
                accept_keymap = '<Tab>',
                dismiss_keymap = '<S-Tab>',
                query_params = {
                    max_new_tokens = 60,
                    temperature = 0.3,
                    top_p = 0.95,
                    stop_tokens = nil,
                },
                enable_suggestions_on_files = '*.py,*.lua,*.java,*.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*.yaml,*.yml,*.md,*.rmd,*.tex,*.bib,*.cpp,*.h,*.hpp',
                '*.nix', -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
            }
        end,
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
                copilot = function()
                    return require('codecompanion.adapters').extend('copilot', {
                        schema = {
                            model = {
                                default = 'gemini-2.5-pro',
                            },
                        },
                    })
                end,
            },
        },
        keys = {
            { '<leader>ic', '<cmd>CodeCompanion<cr>', desc = 'CodeCompanion', mode = { 'n', 'v', 'x' } },
            { '<leader>iC', '<cmd>CodeCompanionChat<cr>', desc = 'CodeCompanion Chat', mode = { 'n', 'v', 'x' } },
            { '<leader>ia', '<cmd>CodeCompanionActions<cr>', desc = 'CodeCompanion Actions', mode = { 'n', 'v', 'x' } },
            { '<leader>id', '<cmd>CodeCompanionCmd<cr>', desc = 'CodeCompanion CMD', mode = { 'n', 'v', 'x' } },
        },
        dependencies = {
            'j-hui/fidget.nvim',
            'ravitemer/codecompanion-history.nvim', -- Save and load conversation history
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            -- {
            --     "Davidyz/VectorCode", -- Index and search code in your repositories
            --     version = "*",
            --     build = "pipx upgrade vectorcode",
            --     dependencies = { "nvim-lua/plenary.nvim" },
            -- },
        },
        config = function()
            require('codecompanion').setup({
                strategies = {
                    chat = {
                        adapter = 'copilot',
                    },
                    inline = {
                        adapter = 'copilot',
                    },
                    cmd = {
                        adapter = 'copilot',
                    },
                },
                display = {
                    action_palette = {
                        width = 95,
                        height = 10,
                        prompt = 'Prompt ', -- Prompt used for interactive LLM calls
                        provider = 'telescope', -- Can be "default", "telescope", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                        opts = {
                            show_default_actions = true, -- Show the default actions in the action palette?
                            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                        },
                    },
                },
            })
        end,
    },
}
