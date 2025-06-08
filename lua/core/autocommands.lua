local au = vim.api.nvim_create_autocmd
-- ╭─────────────────────────────────────────────────────────╮
-- │                 HIGHLIGHT SELECTET TEXT                 │
-- ╰─────────────────────────────────────────────────────────╯
au('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'visual',
            timeout = 300,
        })
    end,
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║                        Autosave                         ║
-- ╚═════════════════════════════════════════════════════════╝

-- Autosave
au({ 'InsertLeave', 'FocusLost' }, {
    pattern = '<buffer>',
    command = 'silent! write',
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║             Update file on external changes             ║
-- ╚═════════════════════════════════════════════════════════╝
au({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    pattern = '<buffer>',
    command = 'checktime',
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║           Align windows when resizing Neovim            ║
-- ╚═════════════════════════════════════════════════════════╝
au('VimResized', {
    pattern = '*',
    command = 'wincmd =',
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║             Auto cd to current buffer path              ║
-- ╚═════════════════════════════════════════════════════════╝
au('BufEnter', {
    pattern = '*',
    command = 'silent! lcd %:p:h',
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║  Automatically create directory when saving a file in   ║
-- ║                 case it does not exist                  ║
-- ╚═════════════════════════════════════════════════════════╝

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

-- ╭─────────────────────────────────────────────────────────╮
-- │    FORCE TREESITTER TO WORK WITH SPECIFIC FILESTYPES    │
-- ╰─────────────────────────────────────────────────────────╯
au('FileType', {
    pattern = { 'zsh', 'conf' },
    callback = function()
        vim.bo.filetype = 'sh'
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │    FORCE TREESITTER TO WORK WITH SPECIFIC FILESTYPES    │
-- ╰─────────────────────────────────────────────────────────╯
vim.filetype.add({
    extension = {
        sh = 'sh',
        zsh = 'sh',
        conf = 'sh',
    },
    filename = {
        ['.zshrc'] = 'sh',
        ['.zshenv'] = 'sh',
        ['.conf'] = 'sh',
    },
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                QUIT SOME WINDOWS WITH Q                 │
-- ╰─────────────────────────────────────────────────────────╯
au('FileType', {
    pattern = { 'help', 'qf', 'man', 'oil', 'aerial-nav', 'query' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                  QUIT DIFFVIEW WITH Q                   │
-- ╰─────────────────────────────────────────────────────────╯
au('FileType', {
    pattern = { 'DiffViewFiles', 'checkhealth' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>tabc<cr>', { silent = true, buffer = true })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │       CHECK IF CODE ACTIONS ARE AVAILABLE ON LSP        │
-- ╰─────────────────────────────────────────────────────────╯
au({ 'CursorHold', 'CursorHoldI' }, {
    callback = function()
        require('utils.code_actions').code_action_listener()
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                 OPEN HELP IN A NEW TAB                  │
-- ╰─────────────────────────────────────────────────────────╯
au('FileType', {
    pattern = 'help',
    command = ':wincmd T',
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                      FORMAT OPTIONS                      │
-- ╰─────────────────────────────────────────────────────────╯
au({ 'BufEnter' }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'o', 'r', 'c' })
        vim.opt.formatoptions:append({ 't' })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │       JUMP TO LAST EDIT POSITION ON OPENING FILE        │
-- ╰─────────────────────────────────────────────────────────╯
au('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

-- ╭─────────────────────────────────────────────────────────╮
-- │               MESSAGE IF MACRO IS STOPPED               │
-- ╰─────────────────────────────────────────────────────────╯
local macro_group = vim.api.nvim_create_augroup('MacroRecording', { clear = true })
au('RecordingLeave', {
    group = macro_group,
    callback = function()
        -- Display a message when macro recording stops
        print('Macro recording stopped')
    end,
})
