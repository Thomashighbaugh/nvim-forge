-- ╭─────────────────────────────────────────────────────────╮
-- │                    WINDOW MANAGEMENT                     │
-- │  Replacement for smart-splits.nvim                       │
-- │  Resize, move cursor, and swap buffers across splits    │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

local ignored_buftypes = { 'nofile' }

local function is_ignored()
    return vim.tbl_contains(ignored_buftypes, vim.bo.buftype)
end

-- ──────────────────────── RESIZE ────────────────────────

function M.resize_left()
    vim.cmd('vertical resize -2')
end

function M.resize_right()
    vim.cmd('vertical resize +2')
end

function M.resize_up()
    vim.cmd('resize -2')
end

function M.resize_down()
    vim.cmd('resize +2')
end

-- ────────────────────── MOVE CURSOR ─────────────────────

function M.move_left()
    vim.cmd('wincmd h')
end

function M.move_down()
    vim.cmd('wincmd j')
end

function M.move_up()
    vim.cmd('wincmd k')
end

function M.move_right()
    vim.cmd('wincmd l')
end

function M.move_previous()
    vim.cmd('wincmd p')
end

-- ──────────────────── SWAP BUFFERS ─────────────────────

function M.swap_left()
    vim.cmd('wincmd H')
end

function M.swap_down()
    vim.cmd('wincmd J')
end

function M.swap_up()
    vim.cmd('wincmd K')
end

function M.swap_right()
    vim.cmd('wincmd L')
end

-- ──────────────────────── SETUP ─────────────────────────

function M.setup()
    local map = vim.keymap.set

    -- Resize
    map('n', '<A-h>', M.resize_left, { desc = 'Resize Left' })
    map('n', '<A-j>', M.resize_down, { desc = 'Resize Down' })
    map('n', '<A-k>', M.resize_up, { desc = 'Resize Up' })
    map('n', '<A-l>', M.resize_right, { desc = 'Resize Right' })

    -- Move cursor between splits
    map('n', '<C-Left>', M.move_left, { desc = 'Move Left' })
    map('n', '<C-Down>', M.move_down, { desc = 'Move Down' })
    map('n', '<C-Up>', M.move_up, { desc = 'Move Up' })
    map('n', '<C-Right>', M.move_right, { desc = 'Move Right' })
    map('n', '<C-\\>', M.move_previous, { desc = 'Move Previous' })

    -- Swap buffers between splits
    map('n', '<leader><leader>h', M.swap_left, { desc = 'Swap Buffer Left' })
    map('n', '<leader><leader>j', M.swap_down, { desc = 'Swap Buffer Down' })
    map('n', '<leader><leader>k', M.swap_up, { desc = 'Swap Buffer Up' })
    map('n', '<leader><leader>l', M.swap_right, { desc = 'Swap Buffer Right' })
end

return M
