-- Editor autocommands
local au = vim.api.nvim_create_autocmd

-- Highlight on yank
au('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'visual', timeout = 300 })
    end,
})

-- Sync clipboard on focus (for clipse)
au({ 'FocusGained', 'BufEnter' }, {
    callback = function()
        vim.fn.setreg('+', vim.fn.getreg('+'))
    end,
})

-- ╔════════════════════════════════════════════════════════════╗
-- ║                     AUTOSAVE SYSTEM                        ║
-- ╠════════════════════════════════════════════════════════════╣
-- ║ • InsertLeave / FocusLost: immediate save (instant)        ║
-- ║ • CursorHoldI: debounced save after 3s typing pause       ║
-- ║   (prevents data loss during config reloads without       ║
-- ║    causing per-keystroke overhead)                         ║
-- ╚════════════════════════════════════════════════════════════╝

local autosave_timer = nil

-- Instant save on leaving insert mode or losing focus
-- Use a flag so downstream autocmds (like format-on-save) can distinguish
-- autosaves from manual saves.
au({ 'InsertLeave', 'FocusLost' }, {
    pattern = '<buffer>',
    callback = function()
        vim.g.saving_for_autosave = true
        vim.cmd('silent! write')
        vim.g.saving_for_autosave = false
    end,
})

-- Debounced save during active typing: after 3s of no keystrokes
-- in insert mode, save the buffer. This prevents data loss from
-- config reloads that happen while you're mid-sentence.
au('TextChangedI', {
    pattern = '<buffer>',
    callback = function()
        if autosave_timer then
            autosave_timer:stop()
            autosave_timer:close()
        end
        autosave_timer = vim.defer_fn(function()
            if vim.bo.modified and vim.bo.buftype == '' and vim.api.nvim_buf_get_name(0) ~= '' then
                vim.g.saving_for_autosave = true
                vim.cmd('silent! write')
                vim.g.saving_for_autosave = false
            end
            autosave_timer = nil
        end, 3000) -- 3 second debounce: only saves after a real pause
    end,
})

-- Update file on external changes
au({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    pattern = '<buffer>',
    command = 'checktime',
})

-- Align windows when resizing
au('VimResized', {
    pattern = '*',
    command = 'wincmd =',
})

-- Auto cd to current buffer path
au('BufEnter', {
    pattern = '*',
    command = 'silent! lcd %:p:h',
})

-- Auto-create directory on save
au('BufWritePre', {
    pattern = '*',
    callback = function()
        local fpath = vim.fn.expand('<afile>')
        local dir = vim.fn.fnamemodify(fpath, ':p:h')
        if vim.fn.isdirectory(dir) ~= 1 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Force treesitter for specific filetypes
au('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.bo.filetype = 'sh'
    end,
})

vim.filetype.add({
    extension = { sh = 'sh', zsh = 'sh', conf = 'sh' },
    filename = { ['.zshrc'] = 'sh', ['.zshenv'] = 'sh', ['.conf'] = 'sh' },
})

-- Open help in a new tab
au('FileType', {
    pattern = 'help',
    command = ':wincmd T',
})

-- Format options on BufEnter
au({ 'BufEnter' }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'o', 'r', 'c' })
        vim.opt.formatoptions:append({ 't' })
    end,
})

-- Jump to last edit position on opening file
au('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

-- Message if macro is stopped
au('RecordingLeave', {
    group = vim.api.nvim_create_augroup('MacroRecording', { clear = true }),
    callback = function()
        print('Macro recording stopped')
    end,
})

-- Quit special windows with q
au('FileType', {
    pattern = { 'help', 'qf', 'man', 'query' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
        if vim.bo.filetype == 'help' then
            vim.cmd('wincmd T')
        end
    end,
})

-- Quit DiffView/checkhealth with q
au('FileType', {
    pattern = { 'DiffViewFiles', 'checkhealth' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>tabc<cr>', { silent = true, buffer = true })
    end,
})
