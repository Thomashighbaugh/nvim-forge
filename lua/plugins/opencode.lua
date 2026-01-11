return {
    'sudo-tee/opencode.nvim',
    config = function()
        require('opencode').setup({
            preferred_picker = 'telescope', -- 'telescope', 'fzf', 'mini.pick', 'snacks', 'select', if nil, it will use the best available picker. Note mini.pick does not support multiple selections
            preferred_completion = 'nvim-cmp', -- 'blink', 'nvim-cmp','vim_complete' if nil, it will use the best available completion
            default_global_keymaps = true, -- If false, disables all default global keymaps
            default_mode = 'build', -- 'build' or 'plan' or any custom configured. @see [OpenCode Agents](https://opencode.ai/docs/modes/)
            keymap_prefix = '<leader>O', -- Default keymap prefix for global keymaps change to your preferred prefix and it will be applied to all keymaps starting with <leader>o
            keymap = {
                editor = {
                    ['<leader>Og'] = { 'toggle' }, -- Open opencode. Close if opened
                    ['<leader>Oi'] = { 'open_input' }, -- Opens and focuses on input window on insert mode
                    ['<leader>OI'] = { 'open_input_new_session' }, -- Opens and focuses on input window on insert mode. Creates a new session
                    ['<leader>Oo'] = { 'open_output' }, -- Opens and focuses on output window
                    ['<leader>Ot'] = { 'toggle_focus' }, -- Toggle focus between opencode and last window
                    ['<leader>OT'] = { 'timeline' }, -- Display timeline picker to navigate/undo/redo/fork messages
                    ['<leader>Oq'] = { 'close' }, -- Close UI windows
                    ['<leader>Os'] = { 'select_session' }, -- Select and load a opencode session
                    ['<leader>OR'] = { 'rename_session' }, -- Rename current session
                    ['<leader>Op'] = { 'configure_provider' }, -- Quick provider and model switch from predefined list
                    ['<leader>Oz'] = { 'toggle_zoom' }, -- Zoom in/out on the Opencode windows
                    ['<leader>Ov'] = { 'paste_image' }, -- Paste image from clipboard into current session
                    ['<leader>Od'] = { 'diff_open' }, -- Opens a diff tab of a modified file since the last opencode prompt
                    ['<leader>O]'] = { 'diff_next' }, -- Navigate to next file diff
                    ['<leader>O['] = { 'diff_prev' }, -- Navigate to previous file diff
                    ['<leader>Oc'] = { 'diff_close' }, -- Close diff view tab and return to normal editing
                    ['<leader>Ora'] = { 'diff_revert_all_last_prompt' }, -- Revert all file changes since the last opencode prompt
                    ['<leader>Ort'] = { 'diff_revert_this_last_prompt' }, -- Revert current file changes since the last opencode prompt
                    ['<leader>OrA'] = { 'diff_revert_all' }, -- Revert all file changes since the last opencode session
                    ['<leader>OrT'] = { 'diff_revert_this' }, -- Revert current file changes since the last opencode session
                    ['<leader>Orr'] = { 'diff_restore_snapshot_file' }, -- Restore a file to a restore point
                    ['<leader>OrR'] = { 'diff_restore_snapshot_all' }, -- Restore all files to a restore point
                    ['<leader>Ox'] = { 'swap_position' }, -- Swap Opencode pane left/right
                    ['<leader>Opa'] = { 'permission_accept' }, -- Accept permission request once
                    ['<leader>OpA'] = { 'permission_accept_all' }, -- Accept all (for current tool)
                    ['<leader>Opd'] = { 'permission_deny' }, -- Deny permission request once
                    ['<leader>Ott'] = { 'toggle_tool_output' }, -- Toggle tools output (diffs, cmd output, etc.)
                    ['<leader>Otr'] = { 'toggle_reasoning_output' }, -- Toggle reasoning output (thinking steps)
                    ['<leader>O/'] = { 'quick_chat', mode = { 'n', 'x' } }, -- Open quick chat input with selection context in visual mode or current line context in normal mode
                },
                input_window = {
                    ['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' } }, -- Submit prompt (normal mode and insert mode)
                    ['<esc>'] = { 'close' }, -- Close UI windows
                    ['<C-c>'] = { 'cancel' }, -- Cancel opencode request while it is running
                    ['~'] = { 'mention_file', mode = 'i' }, -- Pick a file and add to context. See File Mentions section
                    ['@'] = { 'mention', mode = 'i' }, -- Insert mention (file/agent)
                    ['/'] = { 'slash_commands', mode = 'i' }, -- Pick a command to run in the input window
                    ['#'] = { 'context_items', mode = 'i' }, -- Manage context items (current file, selection, diagnostics, mentioned files)
                    ['<M-v>'] = { 'paste_image', mode = 'i' }, -- Paste image from clipboard as attachment
                    ['<C-i>'] = { 'focus_input', mode = { 'n', 'i' } }, -- Focus on input window and enter insert mode at the end of the input from the output window
                    ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
                    ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' } }, -- Navigate to previous prompt in history
                    ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' } }, -- Navigate to next prompt in history
                    ['<M-m>'] = { 'switch_mode' }, -- Switch between modes (build/plan)
                },
                output_window = {
                    ['<esc>'] = { 'close' }, -- Close UI windows
                    ['<C-c>'] = { 'cancel' }, -- Cancel opencode request while it is running
                    [']]'] = { 'next_message' }, -- Navigate to next message in the conversation
                    ['[['] = { 'prev_message' }, -- Navigate to previous message in the conversation
                    ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
                    ['i'] = { 'focus_input', 'n' }, -- Focus on input window and enter insert mode at the end of the input from the output window
                    ['<leader>OS'] = { 'select_child_session' }, -- Select and load a child session
                    ['<leader>OD'] = { 'debug_message' }, -- Open raw message in new buffer for debugging
                    ['<leader>OO'] = { 'debug_output' }, -- Open raw output in new buffer for debugging
                    ['<leader>Ods'] = { 'debug_session' }, -- Open raw session in new buffer for debugging
                },
                permission = {
                    accept = 'a', -- Accept permission request once (only available when there is a pending permission request)
                    accept_all = 'A', -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
                    deny = 'd', -- Deny permission request once (only available when there is a pending permission request)
                },
                session_picker = {
                    rename_session = { '<C-r>' }, -- Rename selected session in the session picker
                    delete_session = { '<C-d>' }, -- Delete selected session in the session picker
                    new_session = { '<C-n>' }, -- Create and switch to a new session in the session picker
                },
                timeline_picker = {
                    undo = { '<C-u>', mode = { 'i', 'n' } }, -- Undo to selected message in timeline picker
                    fork = { '<C-f>', mode = { 'i', 'n' } }, -- Fork from selected message in timeline picker
                },
                history_picker = {
                    delete_entry = { '<C-d>', mode = { 'i', 'n' } }, -- Delete selected entry in the history picker
                    clear_all = { '<C-X>', mode = { 'i', 'n' } }, -- Clear all entries in the history picker
                },
            },
            ui = {
                position = 'right', -- 'right' (default), 'left' or 'current'. Position of the UI split. 'current' uses the current window for the output.
                input_position = 'bottom', -- 'bottom' (default) or 'top'. Position of the input window
                window_width = 0.50, -- Width as percentage of editor width
                zoom_width = 0.8, -- Zoom width as percentage of editor width
                input_height = 0.15, -- Input height as percentage of window height
                display_model = true, -- Display model name on top winbar
                display_context_size = true, -- Display context size in the footer
                display_cost = true, -- Display cost in the footer
                window_highlight = 'Normal:OpencodeBackground,FloatBorder:OpencodeBorder', -- Highlight group for the opencode window
                icons = {
                    preset = 'nerdfonts', -- 'nerdfonts' | 'text'. Choose UI icon style (default: 'nerdfonts')
                    overrides = {}, -- Optional per-key overrides, see section below
                },
                output = {
                    tools = {
                        show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
                        show_reasoning_output = false, -- Show reasoning/thinking steps output (default: true)
                    },
                    rendering = {
                        markdown_debounce_ms = 250, -- Debounce time for markdown rendering on new data (default: 250ms)
                        on_data_rendered = nil, -- Called when new data is rendered; set to false to disable default RenderMarkdown/Markview behavior
                    },
                },
                input = {
                    text = {
                        wrap = true, -- Wraps text inside input window
                    },
                },
                completion = {
                    file_sources = {
                        enabled = true,
                        preferred_cli_tool = 'server', -- 'fd','fdfind','rg','git','server' if nil, it will use the best available tool, 'server' uses opencode cli to get file list (works cross platform) and supports folders
                        ignore_patterns = {
                            '^%.git/',
                            '^%.svn/',
                            '^%.hg/',
                            'node_modules/',
                            '%.pyc$',
                            '%.o$',
                            '%.obj$',
                            '%.exe$',
                            '%.dll$',
                            '%.so$',
                            '%.dylib$',
                            '%.class$',
                            '%.jar$',
                            '%.war$',
                            '%.ear$',
                            'target/',
                            'build/',
                            'dist/',
                            'out/',
                            'deps/',
                            '%.tmp$',
                            '%.temp$',
                            '%.log$',
                            '%.cache$',
                        },
                        max_files = 10,
                        max_display_length = 50, -- Maximum length for file path display in completion, truncates from left with "..."
                    },
                },
            },
            context = {
                enabled = true, -- Enable automatic context capturing
                cursor_data = {
                    enabled = false, -- Include cursor position and line content in the context
                    context_lines = 5, -- Number of lines before and after cursor to include in context
                },
                diagnostics = {
                    info = false, -- Include diagnostics info in the context (default to false
                    warn = true, -- Include diagnostics warnings in the context
                    error = true, -- Include diagnostics errors in the context
                    only_closest = false, -- If true, only diagnostics for cursor/selection
                },
                current_file = {
                    enabled = true, -- Include current file path and content in the context
                    show_full_path = true,
                },
                files = {
                    enabled = true,
                    show_full_path = true,
                },
                selection = {
                    enabled = true, -- Include selected text in the context
                },
                buffer = {
                    enabled = false, -- Disable entire buffer context by default, only used in quick chat
                },
                git_diff = {
                    enabled = false,
                },
            },
            debug = {
                enabled = false, -- Enable debug messages in the output window
                capture_streamed_events = false,
                show_ids = true,
                quick_chat = {
                    keep_session = false, -- Keep quick_chat sessions for inspection, this can pollute your sessions list
                    set_active_session = false,
                },
            },
            prompt_guard = nil, -- Optional function that returns boolean to control when prompts can be sent (see Prompt Guard section)

            -- User Hooks for custom behavior at certain events
            hooks = {
                on_file_edited = nil, -- Called after a file is edited by opencode.
                on_session_loaded = nil, -- Called after a session is loaded.
                on_done_thinking = nil, -- Called when opencode finishes thinking (all jobs complete).
                on_permission_requested = nil, -- Called when a permission request is issued.
            },
            quick_chat = {
                default_model = nil, -- works better with a fast model like gpt-4.1
                default_agent = 'plan', -- plan ensure no file modifications by default
                instructions = nil, -- Use built-in instructions if nil
            },
        })
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                anti_conceal = { enabled = false },
                file_types = { 'markdown', 'opencode_output' },
            },
            ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
        },
        -- Optional, for file mentions and commands completion, pick only one
        -- 'saghen/blink.cmp',
        'hrsh7th/nvim-cmp',

        -- Optional, for file mentions picker, pick only one
        -- 'folke/snacks.nvim',
        'nvim-telescope/telescope.nvim',
        -- 'ibhagwan/fzf-lua',
        -- 'nvim_mini/mini.nvim',
    },
}
