return {
    'chrisgrieser/nvim-scissors',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>se',
            function()
                require('scissors').editSnippet()
            end,
            desc = 'Snippet: Edit',
        },
        {
            '<leader>sa',
            mode = { 'n', 'x' },
            function()
                require('scissors').addNewSnippet()
            end,
            desc = 'Snippet: Add',
        },
    },
    opts = {
        snippetDir = vim.fn.stdpath('config') .. '/snippets',
        editSnippetPopup = {
            height = 0.4,
            width = 0.6,
            border = 'single',
        },
        snippetSelection = {
            picker = 'auto',
        },
        jsonFormatOpts = {
            sort_keys = true,
            indent = '  ',
        },
        backdrop = {
            enabled = true,
            blend = 50,
        },
    },
}
