-- Editor keymaps
local Utils = require('core.utils')

-- Exit from insert mode
vim.keymap.set('i', 'kj', '<esc>', { desc = 'Exit insert mode' })

-- Page up/down scrolling
vim.keymap.set('n', '<PageUp>', '<C-b>', { desc = 'Page up', noremap = true, silent = true })
vim.keymap.set('n', '<PageDown>', '<C-f>', { desc = 'Page down', noremap = true, silent = true })
vim.keymap.set('v', '<PageUp>', '<C-b>', { desc = 'Page up', noremap = true, silent = true })
vim.keymap.set('v', '<PageDown>', '<C-f>', { desc = 'Page down', noremap = true, silent = true })

-- Save
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

-- Create splits
vim.keymap.set('n', '<Space>/', ':vsplit<CR>', { desc = 'Split Window Vertically' })
vim.keymap.set('n', '<Space>-', ':split<CR>', { desc = 'Split Window Horizontally' })

-- Better up/down (visual line movement)
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Search
vim.keymap.set('n', 'ƒ', '/')
vim.keymap.set(
    'n',
    '<leader>R',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { desc = 'Search and replace word under cursor' }
)
vim.keymap.set('x', '<leader>r', [[:s/\%V]], { desc = 'Search and replace in visual selection' })

-- Select all
vim.keymap.set({ 'n', 'x' }, '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Clipboard refresh
vim.keymap.set('n', '<leader>cr', function()
    vim.fn.setreg('+', vim.fn.getreg('+'))
    vim.notify('Clipboard refreshed from system', vim.log.levels.INFO)
end, { desc = 'Refresh Clipboard from System' })

-- Correct word in insert mode
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Buffers
vim.keymap.set('n', '<Space>bd', '<cmd>bd<cr>', { desc = 'Delete Buffer' })

-- Window navigation
vim.keymap.set('n', '<Space>h', '<c-w>h', { desc = 'Move Split Pane Left' })
vim.keymap.set('n', '<Space>l', '<c-w>l', { desc = 'Move Split Pane Right' })
vim.keymap.set('n', '<Space>k', '<c-w>k', { desc = 'Move Split Pane Up' })
vim.keymap.set('n', '<Space>j', '<c-w>j', { desc = 'Move Split Pane Down' })

-- Max or equal split
vim.keymap.set('n', '<Space>m', function()
    Utils.max_or_equal()
end, { desc = 'Max or Equal Split' })

-- Resize split panes
vim.keymap.set('n', '<M-UP>', '<cmd>resize +2<cr>', { desc = 'Resize pane up' })
vim.keymap.set('n', '<M-DOWN>', '<cmd>resize -2<cr>', { desc = 'Resize pane down' })
vim.keymap.set('n', '<M-LEFT>', '<cmd>vertical resize +2<cr>', { desc = 'Resize pane left' })
vim.keymap.set('n', '<M-RIGHT>', '<cmd>vertical resize -2<cr>', { desc = 'Resize pane right' })

-- Move lines
vim.keymap.set('n', '<c-k>', ':m -2<CR>==', { silent = true, desc = 'Move line up' })
vim.keymap.set('n', '<c-j>', ':m +1<CR>==', { silent = true, desc = 'Move line down' })
vim.keymap.set('v', '<c-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move line up visual' })
vim.keymap.set('v', '<c-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move line down visual' })

-- Indent lines in visual selection
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste without yanking
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('x', 'p', 'P')
vim.keymap.set('n', 'dD', '"_dd')

-- Not yanking with c and x
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')

-- Jump to BoL and EoL in insert mode
vim.keymap.set('i', '<M-i>', '<Esc>I', { desc = 'Jump to Beginning of Line' })
vim.keymap.set('i', '<M-a>', '<Esc>A', { desc = 'Jump to End of Line' })

-- Inner/outer quotes and brackets
vim.keymap.set({ 'o', 'x' }, 'iq', "i'", { desc = 'Inner Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'iQ', 'i"', { desc = 'Inner Double Quotes' })
vim.keymap.set({ 'o', 'x' }, 'aq', "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'aQ', '2i"', { desc = 'Around Double Quotes' })
vim.keymap.set({ 'o', 'x' }, "a'", "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'a"', '2i"', { desc = 'Around Double Quotes' })
vim.keymap.set({ 'o', 'x' }, 'ir', 'i[', { desc = 'Inner Brackets' })
vim.keymap.set({ 'o', 'x' }, 'ar', 'a[', { desc = 'Inner Brackets' })

-- Add curly with comma
vim.keymap.set('i', '<C-b>', '{},<esc>hha', { silent = true, desc = 'Add curly with comma {},' })

-- Go to last/newest change (swapped for muscle memory)
vim.keymap.set('n', 'g,', 'g;', { desc = 'Go to newest change' })
vim.keymap.set('n', 'g;', 'g,', { desc = 'Go to last change' })

-- Clear search with esc
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- New file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Better i on empty lines
vim.keymap.set('n', 'i', function()
    if vim.api.nvim_get_current_line():find('^%s*$') then
        return [["_cc]]
    end
    return 'i'
end, { expr = true, desc = 'better i' })

-- Spelling
vim.keymap.set('n', 'z.', '1z=', { desc = 'Fix Spelling' })
vim.keymap.set('n', 'z=', function()
    vim.ui.select(
        vim.fn.spellsuggest(vim.fn.expand('<cword>')),
        {},
        vim.schedule_wrap(function(selected)
            if selected then
                vim.cmd('normal! ciw' .. selected)
            end
        end)
    )
end, { desc = 'Spelling suggestions' })

-- Messages
vim.keymap.set('n', '<leader>mm', '<cmd>messages<cr>', { desc = 'File Changes (Messages)' })

-- Don't yank empty lines with dd
vim.keymap.set('n', 'dd', function()
    if vim.fn.getline('.') == '' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true })
