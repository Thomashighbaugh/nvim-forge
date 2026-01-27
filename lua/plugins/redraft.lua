return {
    'jim-at-jibba/nvim-redraft',
    dependencies = {
        { 'folke/snacks.nvim', opts = { input = {} } },
    },
    event = 'VeryLazy',
    build = 'cd ts && npm install && npm run build',
    opts = {
        -- See Configuration section for options
        llm = {
            { provider = 'openrouter', model = 'tngtech/deepseek-r1t2-chimera:free', label = 'OpenRouter ' },
            { provider = 'openrouter', model = 'moonshotai/kimi-k2:free', label = 'OpenRouter ' },
            { provider = 'openrouter', model = 'qwen/qwen3-coder:free', label = 'OpenRouter ' },
            { provider = 'openrouter', model = 'deepseek/deepseek-r1-0528:free', label = 'OpenRouter ' },
        },
    },
}
