-- Debug (DAP) keymaps

vim.keymap.set(
    'n',
    '<leader>dB',
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    { desc = 'Add Conditional Breakpoint' }
)
vim.keymap.set('n', '<leader>Dc', '<cmd>DapContinue<CR>', { desc = 'Dap Continue' })
vim.keymap.set('n', '<leader>Dsi', '<cmd>DapStepInto<CR>', { desc = 'Dap Step Into' })
vim.keymap.set('n', '<leader>Dso', '<cmd>DapStepOver<CR>', { desc = 'Dap Step Over' })
vim.keymap.set('n', '<leader>Dst', '<cmd>DapStepOut<CR>', { desc = 'Dap Step Out' })
vim.keymap.set('n', '<leader>Dt', '<cmd>DapTerminate<CR>', { desc = 'Dap Terminate' })
vim.keymap.set('n', '<leader>Dl', '<cmd>DapShowLog<CR>', { desc = 'Dap Show Log' })
vim.keymap.set('n', '<leader>Dr', '<cmd>DapToggleRepl<CR>', { desc = 'Dap Toggle Repl' })
