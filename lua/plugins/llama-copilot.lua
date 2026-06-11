return {
    'Faywyn/llama-copilot.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    -- Calling the setup function is not required, it is necessary if you want to use other llm or host.
    config = function()
        -- Default config
        require('llama-copilot').setup({
            host = 'localhost',
            port = '11434',
            model = 'deepseek-v4-flash:cloud',
            max_completion_size = -1, -- use -1 for limitless
            debug = false,
        })
    end,
}
