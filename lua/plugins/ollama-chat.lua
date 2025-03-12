return {
    'gerazov/ollama-chat.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim',
        'nvim-telescope/telescope.nvim',
    },
    -- lazy load on command
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
        chats_folder = vim.fn.stdpath('data'), -- data folder is ~/.local/share/nvim
        -- you can also choose "current" and "tmp"
        quick_chat_file = 'ollama-chat.md',
        animate_spinner = true, -- set this to false to disable spinner animation
        model = 'huggingface.co/THUDM/codegeex4-all-9b-GGUF:latest',
        model_code = 'huggingface.co/THUDM/codegeex4-all-9b-GGUF:latest',
        url = 'http://127.0.0.1:11434',
        serve = {
            on_start = false,
            command = 'ollama',
            args = { 'serve' },
            stop_command = 'pkill',
            stop_args = { '-SIGTERM', 'ollama' },
        },
    },
}
