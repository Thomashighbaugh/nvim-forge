return {
    'luckasRanarison/nvim-devdocs',
    cmd = { 'DevdocsOpen', 'DevdocsOpenFloat' },
    keys = {
        { '<leader>fo', '<cmd>DevdocsOpen<cr>', desc = 'Open Devdocs' },
        { '<leader>fO', '<cmd>DevdocsOpenFloat<cr>', desc = 'Open Devdocs Float' },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        float_win = {
            relative = 'editor',
            height = math.floor(vim.o.lines * 0.7),
            width = math.floor(vim.o.columns * 0.8),
            border = 'rounded',
        },
        wrap = true,
        after_open = function()
            vim.keymap.set('n', 'q', ':close<CR>', { silent = true })
        end,
    },
}
