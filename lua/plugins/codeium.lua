return {
    'Exafunction/codeium.nvim',
    event = 'InsertEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require('codeium').setup({
            enable_chat = false,
        })
    end,
}
