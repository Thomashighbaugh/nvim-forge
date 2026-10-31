vim.g.mapleader = ','
vim.g.maplocalleader = ','

local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

local function focus_editor_window()
    local ignore = {
        ['NvimTree'] = true,
        ['Avante'] = true,
        ['AvanteInput'] = true,
        ['trouble'] = true,
        ['Trouble'] = true,
        ['toggleterm'] = true,
        ['alpha'] = true,
        ['lazy'] = true,
        ['mason'] = true,
        ['notify'] = true,
        ['noice'] = true,
        ['qf'] = true,
    }

    local start = vim.api.nvim_get_current_win()
    for _ = 1, 25 do
        local buf = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())
        local ft = vim.bo[buf].filetype
        local bt = vim.bo[buf].buftype
        if not ignore[ft] and bt == '' then
            return true
        end
        pcall(vim.cmd, 'wincmd w')
        if vim.api.nvim_get_current_win() == start then
            break
        end
    end
    return false
end

map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', 'Tree toggle')
map('n', '<leader>a', '<cmd>AvanteToggle<cr>', 'Avante toggle')
map('n', '<leader>h', '<cmd>Alpha<cr>', 'Dashboard')
map('n', '<leader>i', '<cmd>CursorMode<cr>', 'CursorMode toggle')

map({ 'n', 'i', 'v' }, '<leader>t', function()
    local was_insert = vim.api.nvim_get_mode().mode:match('^i') ~= nil
    if was_insert then
        vim.cmd('stopinsert')
    end

    focus_editor_window()
    pcall(vim.cmd, 'ToggleTerm')

    if was_insert then
        vim.cmd('startinsert')
    end
end, 'Terminal toggle (main)')

map('n', '<leader>x', function()
    focus_editor_window()
    pcall(vim.cmd, 'Trouble diagnostics toggle')
end, 'Trouble diagnostics toggle (main)')

map({ 'n', 'i', 'v' }, '<C-a>', function()
    if vim.api.nvim_get_mode().mode:match('^i') then
        vim.cmd('stopinsert')
    end
    vim.cmd([[normal! ggVG]])
end, 'Select all')

map('v', '<C-c>', '"+y', 'Copy selection (best-effort)')
map('n', '<C-c>', '"+yy', 'Copy line (best-effort)')
map({ 'n', 'v' }, '<C-v>', '"+p', 'Paste (best-effort)')
map('i', '<C-v>', '<Esc>"+pa', 'Paste (best-effort)')

map('v', '<leader>y', '"+y', 'Copy selection (+)')
map('n', '<leader>p', '"+p', 'Paste (+)')
map('n', '<leader>P', '"+P', 'Paste before (+)')

-- Lazy package manager
map('n', '<leader>l', '<cmd>Lazy<cr>', 'Lazy')
map('n', '<leader>L', '<cmd>Lazy<cr>', 'Lazy')
map('n', '<leader>lu', '<cmd>Lazy update<cr>', 'Lazy Update')
map('n', '<leader>ls', '<cmd>Lazy sync<cr>', 'Lazy Sync')
map('n', '<leader>lc', '<cmd>Lazy clean<cr>', 'Lazy Clean')
map('n', '<leader>lx', '<cmd>Lazy check<cr>', 'Lazy Check')
map('n', '<leader>lp', '<cmd>Lazy profile<cr>', 'Lazy Profile')
map('n', '<leader>lr', '<cmd>Lazy restore<cr>', 'Lazy Restore')
