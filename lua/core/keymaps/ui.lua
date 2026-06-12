-- UI/plugin keymaps

-- Bufferline.nvim
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<space>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin Buffer' })
vim.keymap.set('n', '<space>bk', '<cmd>BufferLinePick<cr>', { desc = 'Pick Buffer' })
vim.keymap.set('n', '<space>bo', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close Other Buffers' })
vim.keymap.set('n', '<space>b<left>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move Buffer Left' })
vim.keymap.set('n', '<space>b<right>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move Buffer Right' })
for i = 1, 9 do
    vim.keymap.set(
        'n',
        ('<space>b%d'):format(i),
        ('<cmd>BufferLineGoToBuffer %d<cr>'):format(i),
        { desc = ('Go to Buffer %d'):format(i) }
    )
end

-- Treesitter treehopper
vim.keymap.set('o', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true, remap = true })
vim.keymap.set('x', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true })

-- lazy.nvim
vim.keymap.set('n', '<Leader>la', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<Leader>lc', '<cmd>Lazy clean<cr>', { desc = 'Clean Lazy Plugins' })
vim.keymap.set('n', '<Leader>lC', '<cmd>Lazy check<cr>', { desc = 'Check Lazy Plugins' })
vim.keymap.set('n', '<Leader>ls', '<cmd>Lazy sync<cr>', { desc = 'Sync Lazy Plugins' })

-- Notifications (Snacks.notifier)
vim.keymap.set('n', '<space>nn', function()
    Snacks.notifier.show_history()
end, { desc = 'Notification History' })
vim.keymap.set('n', '<space>nl', function()
    Snacks.notifier.show_history()
end, { desc = 'Notification History (Last)' })
vim.keymap.set('n', '<space>nd', function()
    Snacks.notifier.hide()
end, { desc = 'Dismiss Notifications' })
vim.keymap.set('n', '<space>nc', function()
    Snacks.notifier.hide()
end, { desc = 'Dismiss Notifications' })

-- Terminal (toggleterm)
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'kj', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Treesitter context toggle
vim.keymap.set('n', '<leader>ct', '<cmd>TSContextToggle<cr>', { desc = 'Toggle TS Context' })

-- Todo-comments navigation
vim.keymap.set('n', ']t', function()
    require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
vim.keymap.set('n', '[t', function()
    require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })
