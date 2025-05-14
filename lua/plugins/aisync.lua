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
            suggestion = { enabled = true },
            panel = { enabled = true },
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
    -- ║                       fittencode                        ║
    -- ╚═════════════════════════════════════════════════════════╝
    {
        'luozhiya/fittencode.nvim',
        opts = {
            action = {
                document_code = {
                    -- Show "Fitten Code - Document Code" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                edit_code = {
                    -- Show "Fitten Code - Edit Code" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                explain_code = {
                    -- Show "Fitten Code - Explain Code" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                find_bugs = {
                    -- Show "Fitten Code - Find Bugs" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                generate_unit_test = {
                    -- Show "Fitten Code - Generate Unit Test" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                start_chat = {
                    -- Show "Fitten Code - Start Chat" in the editor context menu, when you right-click on the code.
                    show_in_editor_context_menu = true,
                },
                identify_programming_language = {
                    -- Identify programming language of the current buffer
                    -- * Unnamed buffer
                    -- * Buffer without file extension
                    -- * Buffer no filetype detected
                    identify_buffer = true,
                },
            },
            disable_specific_inline_completion = {
                -- Disable auto-completion for some specific file suffixes by entering them below
                -- For example, `suffixes = {'lua', 'cpp'}`
                suffixes = {},
            },
            inline_completion = {
                -- Enable inline code completion.
                ---@type boolean
                enable = true,
                -- Disable auto completion when the cursor is within the line.
                ---@type boolean
                disable_completion_within_the_line = false,
                -- Disable auto completion when pressing Backspace or Delete.
                ---@type boolean
                disable_completion_when_delete = false,
                -- Auto triggering completion
                ---@type boolean
                auto_triggering_completion = true,
                -- Accept Mode
                -- Available options:
                -- * `commit` (VSCode style accept, also default)
                --   - `Tab` to Accept all suggestions
                --   - `Ctrl+Right` to Accept word
                --   - `Ctrl+Down` to Accept line
                --   - Interrupt
                --      - Enter a different character than suggested
                --      - Exit insert mode
                --      - Move the cursor
                -- * `stage` (Stage style accept)
                --   - `Tab` to Accept all staged characters
                --   - `Ctrl+Right` to Stage word
                --   - `Ctrl+Left` to Revoke word
                --   - `Ctrl+Down` to Stage line
                --   - `Ctrl+Up` to Revoke line
                --   - Interrupt(Same as `commit`, but with the following changes:)
                --      - Characters that have already been staged will be lost.
                accept_mode = 'commit',
            },
            delay_completion = {
                -- Delay time for inline completion (in milliseconds).
                ---@type integer
                delaytime = 0,
            },
            prompt = {
                -- Maximum number of characters to prompt for completion/chat.
                max_characters = 1000000,
            },
            chat = {
                -- Highlight the conversation in the chat window at the current cursor position.
                highlight_conversation_at_cursor = false,
                -- Style
                -- Available options:
                -- * `sidebar` (Siderbar style, also default)
                -- * `floating` (Floating style)
                style = 'sidebar',
                sidebar = {
                    -- Width of the sidebar in characters.
                    width = 42,
                    -- Position of the sidebar.
                    -- Available options:
                    -- * `left`
                    -- * `right`
                    position = 'left',
                },
                floating = {
                    -- Border style of the floating window.
                    -- Same border values as `nvim_open_win`.
                    border = 'rounded',
                    -- Size of the floating window.
                    -- <= 1: percentage of the screen size
                    -- >  1: number of lines/columns
                    size = { width = 0.8, height = 0.8 },
                },
            },
            -- Enable/Disable the default keymaps in inline completion.
            use_default_keymaps = true,
            -- Default keymaps
            keymaps = {
                inline = {
                    ['<TAB>'] = 'accept_all_suggestions',
                    ['<C-Down>'] = 'accept_line',
                    ['<C-Right>'] = 'accept_word',
                    ['<C-Up>'] = 'revoke_line',
                    ['<C-Left>'] = 'revoke_word',
                    ['<A-\\>'] = 'triggering_completion',
                },
                chat = {
                    ['q'] = 'close',
                    ['[c'] = 'goto_previous_conversation',
                    [']c'] = 'goto_next_conversation',
                    ['c'] = 'copy_conversation',
                    ['C'] = 'copy_all_conversations',
                    ['d'] = 'delete_conversation',
                    ['D'] = 'delete_all_conversations',
                },
            },
            -- Setting for source completion.
            source_completion = {
                -- Enable source completion.
                enable = true,
                -- engine support nvim-cmp and blink.cmp
                engine = 'cmp', -- "cmp" | "blink"
                -- trigger characters for source completion.
                -- Available options:
                -- * A  list of characters like {'a', 'b', 'c', ...}
                -- * A function that returns a list of characters like `function() return {'a', 'b', 'c', ...}`
                trigger_chars = {},
            },
            -- Set the mode of the completion.
            -- Available options:
            -- * 'inline' (VSCode style inline completion)
            -- * 'source' (integrates into other completion plugins)
            completion_mode = 'inline',
            ---@class LogOptions
            log = {
                -- Log level.
                level = vim.log.levels.WARN,
                -- Max log file size in MB, default is 10MB
                max_size = 10,
            },
        },
    },
}
