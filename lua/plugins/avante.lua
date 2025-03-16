return {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false, -- Have to use newest to work with ollama as "first class provider"

    opts = {
        provider = 'ollama',
        ollama = {
            api_key_name = '',
            endpoint = 'http://127.0.0.1:11434',
            model = 'mistral-nemo:latest',
            options = {
                num_ctx = 32768,
                temperature = 0,
            },
            stream = true,
        },
        behaviour = {
            auto_focus_sidebar = true,
            auto_suggestions = true, -- Experimental stage
            auto_suggestions_respect_ignore = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            jump_result_buffer_on_finish = false,
            support_paste_from_clipboard = true,
            minimize_diff = true,
            enable_token_counting = true,
            enable_cursor_planning_mode = false,
            use_cwd_as_project_root = false,
        },
        mappings = {
            diff = {
                ours = 'co',
                theirs = 'ct',
                all_theirs = 'ca',
                both = 'cb',
                cursor = 'cc',
                next = ']x',
                prev = '[x',
            },
            suggestion = {
                accept = '<M-l>',
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '<C-]>',
            },
            jump = {
                next = ']]',
                prev = '[[',
            },
            submit = {
                normal = '<CR>',
                insert = '<C-s>',
            },
            -- Keep these with the Ollama prefixed commands it hopefully deprecates
            ask = '<leader>Oaa',
            edit = '<leader>Oae',
            refresh = '<leader>Oar',
            focus = '<leader>Oaf',
            toggle = {
                default = '<leader>Oat',
                debug = '<leader>Oad',
                hint = '<leader>ah',
                suggestion = '<leader>Oas',
                repomap = '<leader>OaR',
            },
            sidebar = {
                apply_all = 'A',
                apply_cursor = 'a',
                retry_user_request = 'r',
                edit_user_request = 'e',
                switch_windows = '<Tab>',
                reverse_switch_windows = '<S-Tab>',
                remove_file = 'd',
                add_file = '@',
                close = { '<Esc>', 'q' },
                ---@alias AvanteCloseFromInput { normal: string | nil, insert: string | nil }
                ---@type AvanteCloseFromInput | nil
                close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
            },
            files = {
                add_current = '<leader>Oac', -- Add current buffer to selected files
            },
            select_model = '<leader>Oa?', -- Select model command
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        --- The below dependencies are optional,
        'echasnovski/mini.pick', -- for file_selector provider mini.pick
        'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
        'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
        'ibhagwan/fzf-lua', -- for file_selector provider fzf
        'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
        'zbirenbaum/copilot.lua', -- for providers='copilot'
        {
            -- support for image pasting
            'HakonHarnes/img-clip.nvim',
            event = 'VeryLazy',
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { 'markdown', 'Avante' },
            },
            ft = { 'markdown', 'Avante' },
        },
    },
}
