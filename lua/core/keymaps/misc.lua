-- ╭──────────────────────────────────────────────────────────╮
-- │                MISC KEYMAPS (DEBUG/GIT/SORT)              │
-- │  Consolidated from:                                       │
-- │    • debug.lua — DAP keymaps                              │
-- │    • git.lua   — diffview toggle                          │
-- │    • sort.lua  — sort lines                               │
-- ╰──────────────────────────────────────────────────────────╯
-- ──────────────────────── TABLE OF CONTENTS ────────────────────────
--   1. DEBUG   DAP breakpoints, continue, stepping, log, repl
--   2. GIT     Diffview toggle
--   3. SORT    Sort lines/selection (with :Sort alias)
-- ────────────────────────────────────────────────────────────────────

-- ╭──────────────────────────────────────────────────────────╮
-- │ 1. DEBUG — DAP keymaps                                  │
-- ╰──────────────────────────────────────────────────────────╯
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

-- ╭──────────────────────────────────────────────────────────╮
-- │ 2. GIT — diffview.nvim toggle                            │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set('n', '<leader>dv', function()
    local lib = require('diffview.lib')
    local view = lib.get_current_view()
    if view then
        vim.cmd.DiffviewClose()
    else
        vim.cmd.DiffviewOpen()
    end
end, { desc = 'Diffview Toggle' })

-- ╭──────────────────────────────────────────────────────────╮
-- │ 3. SORT — built-in :sort, aliased as :Sort               │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set('n', '<leader>so', ':Sort<CR>', { desc = 'Sort lines' })
vim.keymap.set('v', '<leader>so', "'<,'>Sort<CR>", { desc = 'Sort selection' })
vim.keymap.set('n', '<leader>si', ':Sort i<CR>', { desc = 'Sort lines (ignore case)' })
vim.keymap.set('v', '<leader>si', "'<,'>Sort i<CR>", { desc = 'Sort selection (ignore case)' })
vim.keymap.set('n', '<leader>su', ':Sort u<CR>', { desc = 'Sort lines (unique)' })
vim.keymap.set('v', '<leader>su', "'<,'>Sort u<CR>", { desc = 'Sort selection (unique)' })
vim.keymap.set('n', '<leader>sn', ':Sort n<CR>', { desc = 'Sort lines (numeric)' })
vim.keymap.set('v', '<leader>sn', "'<,'>Sort n<CR>", { desc = 'Sort selection (numeric)' })
