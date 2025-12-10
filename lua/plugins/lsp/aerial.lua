return {
    'stevearc/aerial.nvim',
    enabled = true,
    cmd = 'AerialToggle',
    keys = {
        { '<leader>lA', '<cmd>AerialToggle<cr>', desc = 'Aerial Symbol Outline' },
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        layout = {
            width = 60,
        },
    },
}
