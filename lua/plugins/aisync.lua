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
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                ['*'] = true, -- disable for all other filetypes and ignore default `filetypes`
            },
        },
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

    -- ╭─────────────────────────────────────────────────────────╮
    -- │                         Codeium                         │
    -- ╰─────────────────────────────────────────────────────────╯
    {
        'Exafunction/codeium.nvim',
        event = { 'InsertEnter' },
        build = ':Codeium Auth',
        opts = {
            enable_chat = true,
        },
    },

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

            local splitCommandIntoTable = function(command)
                local cmd = {}
                for word in command:gmatch('%S+') do
                    table.insert(cmd, word)
                end
                return cmd
            end

            local function loadConfigFromCommand(command, callback, defaultValue)
                local cmd = splitCommandIntoTable(command)
                job:new({
                    command = cmd[1],
                    args = vim.list_slice(cmd, 2, #cmd),
                    on_exit = function(j, exit_code)
                        if exit_code ~= 0 then
                            logger.warn("Command'" .. command .. "' did not return a value when executed")
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
                enable_suggestions_on_files = '*.py,*.lua,*.java,*.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*.yaml,*.yml,*.md,*.rmd,*.tex,*.bib,*.cpp,*.h,*.hpp', -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
            }
        end,
    },
}
