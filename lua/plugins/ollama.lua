return {
    {
        'nomnivore/ollama.nvim', -- for release
        cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

        keys = {
            {
                -- testing chat
                '<leader>Oc',
                '<cmd>OllamaChat<cr>',
                desc = 'OllamaChat',
            },
            {
                '<leader>OC',
                function()
                    require('ollama.chat').close()
                end,
                desc = 'OllamaChat Close',
            },
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
            model = 'codegeex4',
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
}
