-- ╭──────────────────────────────────────────────────────────╮
-- │                     EDITOR KEYMAPS                        │
-- │  Consolidated from:                                       │
-- │    • editor.lua — editor keymaps                          │
-- │    • ui.lua     — UI/plugin keymaps                       │
-- │    • image.lua  — snacks.image clear                      │
-- ╰──────────────────────────────────────────────────────────╯
-- ──────────────────────── TABLE OF CONTENTS ────────────────────────
--   1. EDITOR       Insert exit, scrolling, save, wrap, splits,
--                   movement, search, clipboard, buffers, windows,
--                   resize, line moves, indent, paste, text objects,
--                   changes, search-clear, new file, spelling, messages
--   2. UI           Bufferline, treehopper, lazy.nvim, notifications,
--                   terminal, TS context, todo-comments
--   3. IMAGE        snacks.image clear
-- ────────────────────────────────────────────────────────────────────

-- ╭──────────────────────────────────────────────────────────╮
-- │ 1. EDITOR — editor keymaps                               │
-- ╰──────────────────────────────────────────────────────────╯
local Utils = require('core.utils')

-- ────────────── Exit from insert mode ──────────────
vim.keymap.set('i', 'kj', '<esc>', { desc = 'Exit insert mode' })

-- ────────────── Page up/down scrolling ──────────────
vim.keymap.set('n', '<PageUp>', '<C-b>', { desc = 'Page up', noremap = true, silent = true })
vim.keymap.set('n', '<PageDown>', '<C-f>', { desc = 'Page down', noremap = true, silent = true })
vim.keymap.set('v', '<PageUp>', '<C-b>', { desc = 'Page up', noremap = true, silent = true })
vim.keymap.set('v', '<PageDown>', '<C-f>', { desc = 'Page down', noremap = true, silent = true })

-- ────────────── Save ──────────────
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

-- ────────────── Toggle word wrap (useful in markdown/prose) ──────────────
vim.keymap.set('n', '<leader>ww', function()
    local new_val = not vim.wo.wrap
    vim.wo.wrap = new_val
    vim.wo.linebreak = new_val
    vim.notify('Word wrap: ' .. (new_val and 'ON' or 'OFF'), vim.log.levels.INFO)
end, { desc = 'Toggle Word Wrap' })

-- ────────────── Create splits ──────────────
vim.keymap.set('n', '<Space>/', ':vsplit<CR>', { desc = 'Split Window Vertically' })
vim.keymap.set('n', '<Space>-', ':split<CR>', { desc = 'Split Window Horizontally' })

-- ────────────── Better up/down (visual line movement) ──────────────
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ────────────── Search ──────────────
vim.keymap.set('n', 'ƒ', '/')
vim.keymap.set(
    'n',
    '<leader>R',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
    { desc = 'Search and replace word under cursor' }
)
vim.keymap.set('x', '<leader>r', [[:s/\%V]], { desc = 'Search and replace in visual selection' })

-- ────────────── Select all ──────────────
vim.keymap.set({ 'n', 'x' }, '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- ────────────── Clipboard refresh ──────────────
vim.keymap.set('n', '<leader>cr', function()
    vim.fn.setreg('+', vim.fn.getreg('+'))
    vim.notify('Clipboard refreshed from system', vim.log.levels.INFO)
end, { desc = 'Refresh Clipboard from System' })

-- ────────────── Correct word in insert mode ──────────────
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- ────────────── Buffers ──────────────
vim.keymap.set('n', '<Space>bd', '<cmd>bd<cr>', { desc = 'Delete Buffer' })

-- ────────────── Window navigation ──────────────
vim.keymap.set('n', '<Space>h', '<c-w>h', { desc = 'Move Split Pane Left' })
vim.keymap.set('n', '<Space>l', '<c-w>l', { desc = 'Move Split Pane Right' })
vim.keymap.set('n', '<Space>k', '<c-w>k', { desc = 'Move Split Pane Up' })
vim.keymap.set('n', '<Space>j', '<c-w>j', { desc = 'Move Split Pane Down' })

-- ────────────── Max or equal split ──────────────
vim.keymap.set('n', '<Space>m', function()
    Utils.max_or_equal()
end, { desc = 'Max or Equal Split' })

-- ────────────── Resize split panes ──────────────
vim.keymap.set('n', '<M-UP>', '<cmd>resize +2<cr>', { desc = 'Resize pane up' })
vim.keymap.set('n', '<M-DOWN>', '<cmd>resize -2<cr>', { desc = 'Resize pane down' })
vim.keymap.set('n', '<M-LEFT>', '<cmd>vertical resize +2<cr>', { desc = 'Resize pane left' })
vim.keymap.set('n', '<M-RIGHT>', '<cmd>vertical resize -2<cr>', { desc = 'Resize pane right' })

-- ────────────── Move lines ──────────────
vim.keymap.set('n', '<c-k>', ':m -2<CR>==', { silent = true, desc = 'Move line up' })
vim.keymap.set('n', '<c-j>', ':m +1<CR>==', { silent = true, desc = 'Move line down' })
vim.keymap.set('v', '<c-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move line up visual' })
vim.keymap.set('v', '<c-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move line down visual' })

-- ────────────── Indent lines in visual selection ──────────────
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- ────────────── Paste without yanking ──────────────
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('x', 'p', 'P')
vim.keymap.set('n', 'dD', '"_dd')

-- ────────────── Not yanking with c and x ──────────────
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')

-- ────────────── Jump to BoL and EoL in insert mode ──────────────
vim.keymap.set('i', '<M-i>', '<Esc>I', { desc = 'Jump to Beginning of Line' })
vim.keymap.set('i', '<M-a>', '<Esc>A', { desc = 'Jump to End of Line' })

-- ────────────── Inner/outer quotes and brackets ──────────────
vim.keymap.set({ 'o', 'x' }, 'iq', "i'", { desc = 'Inner Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'iQ', 'i"', { desc = 'Inner Double Quotes' })
vim.keymap.set({ 'o', 'x' }, 'aq', "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'aQ', '2i"', { desc = 'Around Double Quotes' })
vim.keymap.set({ 'o', 'x' }, "a'", "2i'", { desc = 'Around Single Quotes' })
vim.keymap.set({ 'o', 'x' }, 'a"', '2i"', { desc = 'Around Double Quotes' })
vim.keymap.set({ 'o', 'x' }, 'ir', 'i[', { desc = 'Inner Brackets' })
vim.keymap.set({ 'o', 'x' }, 'ar', 'a[', { desc = 'Inner Brackets' })

-- ────────────── Add curly with comma ──────────────
vim.keymap.set('i', '<C-b>', '{},<esc>hha', { silent = true, desc = 'Add curly with comma {},' })

-- ────────────── Go to last/newest change (swapped for muscle memory) ──────────────
vim.keymap.set('n', 'g,', 'g;', { desc = 'Go to newest change' })
vim.keymap.set('n', 'g;', 'g,', { desc = 'Go to last change' })

-- ────────────── Clear search with esc ──────────────
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- ────────────── New file ──────────────
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- ────────────── Better i on empty lines ──────────────
vim.keymap.set('n', 'i', function()
    if vim.api.nvim_get_current_line():find('^%s*$') then
        return [["_cc]]
    end
    return 'i'
end, { expr = true, desc = 'better i' })

-- ────────────── Spelling ──────────────
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

-- ────────────── Messages ──────────────
vim.keymap.set('n', '<leader>mm', '<cmd>messages<cr>', { desc = 'File Changes (Messages)' })

-- ────────────── Don't yank empty lines with dd ──────────────
vim.keymap.set('n', 'dd', function()
    if vim.fn.getline('.') == '' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true })

-- ╭──────────────────────────────────────────────────────────╮
-- │ 2. UI — UI/plugin keymaps                                │
-- ╰──────────────────────────────────────────────────────────╯

-- ────────────── Bufferline.nvim ──────────────
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

-- ────────────── Treesitter treehopper ──────────────
vim.keymap.set('o', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true, remap = true })
vim.keymap.set('x', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true })

-- ────────────── lazy.nvim ──────────────
vim.keymap.set('n', '<Leader>la', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<Leader>lc', '<cmd>Lazy clean<cr>', { desc = 'Clean Lazy Plugins' })
vim.keymap.set('n', '<Leader>lC', '<cmd>Lazy check<cr>', { desc = 'Check Lazy Plugins' })
vim.keymap.set('n', '<Leader>ls', '<cmd>Lazy sync<cr>', { desc = 'Sync Lazy Plugins' })

-- ────────────── Notifications (Snacks.notifier) ──────────────
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

-- ────────────── Terminal (toggleterm) ──────────────
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

-- ────────────── Treesitter context toggle ──────────────
vim.keymap.set('n', '<leader>ct', '<cmd>TSContextToggle<cr>', { desc = 'Toggle TS Context' })

-- ────────────── Todo-comments navigation ──────────────
vim.keymap.set('n', ']t', function()
    require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
vim.keymap.set('n', '[t', function()
    require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- ╭──────────────────────────────────────────────────────────╮
-- │ 3. IMAGE — snacks.image clear                            │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set('n', '<leader>pp', function()
    local snacks_ok, snacks = pcall(require, 'snacks')
    if snacks_ok and snacks.image then
        snacks.image.clear()
    end
end, { desc = 'Clear Images' })
