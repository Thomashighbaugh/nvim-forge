return {
    'stevearc/oil.nvim',
    enabled = true,
    keys = {
        { '<leader>o', '<cmd>Oil --float<cr>', desc = 'File browser' },
    },
    opts = {
        float = {
            max_width = 100,
            max_height = 80,
        },
    },
}
