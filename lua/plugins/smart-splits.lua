return {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    keys = {
        { '<A-h>', "<cmd>lua require('smart-splits').resize_left<CR>", desc = 'Smart Resize Left' },
        { '<A-j>', "<cmd>lua require('smart-splits').resize_down<CR>", desc = 'Smart Resize Down' },
        { '<A-k>', "<cmd>lua require('smart-splits').resize_up<CR>", desc = 'Smart Resize Up' },
        { '<A-l>', "<cmd>lua require('smart-splits').resize_right<CR>", desc = 'Smart Resize Right' },
        { '<C-Left>', "<cmd>lua require('smart-splits').move_cursor_left<CR>", desc = 'Smart Move Left' },
        { '<C-Down>', "<cmd>lua require('smart-splits').move_cursor_down<CR>", desc = 'Smart Move Down' },
        { '<C-Up>', "<cmd>lua require('smart-splits').move_cursor_up<CR>", desc = 'Smart Move Up' },
        { '<C-Right>', "<cmd>lua require('smart-splits').move_cursor_right<CR>", desc = 'Smart Move Right' },
        { '<C-\\>', "<cmd>lua require('smart-splits').move_cursor_previous<CR>", desc = 'Smart Move Previous' },
        { '<leader><leader>h', "<cmd>lua require('smart-splits').swap_buf_left<CR>", desc = 'Smart Swap Buffer Left' },
        { '<leader><leader>j', "<cmd>lua require('smart-splits').swap_buf_down<CR>", desc = 'Smart Swap Buffer Down' },
        { '<leader><leader>k', "<cmd>lua require('smart-splits').swap_buf_up<CR>", desc = 'Smart Swap Buffer Up' },
        {
            '<leader><leader>l',
            "<cmd>lua require('smart-splits').swap_buf_right<CR>",
            desc = 'Smart Swap Buffer Right',
        },
    },
    opts = { ignored_buftypes = { 'nofile' }, cursor_follows_swapped_bufs = true },
}
