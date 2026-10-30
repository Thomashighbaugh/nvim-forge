local au = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Force floats polish
local ok_ff, force_floats = pcall(require, 'core.force_floats')
if ok_ff then
    force_floats.setup()
end

-- Yank highlight
au('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end,
})

-- Sync clipboard on focus
au({ 'FocusGained', 'BufEnter' }, {
    callback = function()
        pcall(function()
            vim.fn.setreg('+', vim.fn.getreg('+'))
        end)
    end,
})

-- Autosave
local autosave_timer = nil

au({ 'InsertLeave', 'FocusLost' }, {
    pattern = '<buffer>',
    callback = function()
        vim.g.saving_for_autosave = true
        pcall(vim.cmd, 'silent! write')
        vim.g.saving_for_autosave = false
    end,
})

au('TextChangedI', {
    pattern = '<buffer>',
    callback = function()
        if autosave_timer then
            pcall(function()
                autosave_timer:stop()
                autosave_timer:close()
            end)
        end
        autosave_timer = vim.defer_fn(function()
            if vim.bo.modified and vim.bo.buftype == '' and vim.api.nvim_buf_get_name(0) ~= '' then
                vim.g.saving_for_autosave = true
                pcall(vim.cmd, 'silent! write')
                vim.g.saving_for_autosave = false
            end
            autosave_timer = nil
        end, 3000)
    end,
})

-- Checktime on focus/term events
au({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    pattern = '*',
    command = 'checktime',
})

-- Resize windows equally
au('VimResized', {
    pattern = '*',
    command = 'wincmd =',
})

-- Auto cd to buffer dir
au('BufEnter', {
    pattern = '*',
    command = 'silent! lcd %:p:h',
})

-- Auto-create dirs on save
au('BufWritePre', {
    pattern = '*',
    callback = function()
        local fpath = vim.fn.expand('<afile>')
        local dir = vim.fn.fnamemodify(fpath, ':p:h')
        if vim.fn.isdirectory(dir) ~= 1 then
            pcall(vim.fn.mkdir, dir, 'p')
        end
    end,
})

-- Treat zsh/conf as sh
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

-- Help in new tab
au('FileType', {
    pattern = 'help',
    command = 'wincmd T',
})

-- Format options
au('BufEnter', {
    callback = function()
        vim.opt.formatoptions:remove({ 'o', 'r', 'c' })
        vim.opt.formatoptions:append({ 't' })
    end,
})

-- Jump to last position
au('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = "silent! normal! g`\"zv",
})

-- Macro recording message
au('RecordingLeave', {
    group = augroup('MacroRecording', { clear = true }),
    callback = function()
        vim.notify('Macro recording stopped', vim.log.levels.INFO)
    end,
})

-- Quit special windows
au('FileType', {
    pattern = { 'help', 'qf', 'man', 'query', 'lspinfo', 'checkhealth' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
    end,
})

-- Large file handling
local large_file_group = augroup('LargeFile', { clear = true })
au('BufReadPre', {
    group = large_file_group,
    callback = function()
        local file_path = vim.api.nvim_buf_get_name(0)
        if file_path == '' then
            return
        end
        local file_size = vim.fn.getfsize(file_path)
        local large_file_threshold = 25 * 1024 * 1024

        if file_size > large_file_threshold or file_size == -2 then
            vim.b.large_buf = true
            vim.opt_local.swapfile = false
            vim.opt_local.bufhidden = 'unload'
            vim.opt_local.undolevels = -1
            vim.opt_local.spell = false
            vim.opt_local.foldmethod = 'manual'
            vim.opt_local.syntax = 'off'
            vim.opt_local.synmaxcol = 200
            vim.opt_local.lazyredraw = true
            vim.notify(
                string.format('Large file detected (%.2f MB), performance optimizations applied', file_size / 1024 / 1024),
                vim.log.levels.INFO
            )
        else
            vim.b.large_buf = false
        end
    end,
})

-- Markdown soft wrap + smart spell
local markdown_group = augroup('MarkdownWrap', { clear = true })
local spell_timer = nil

au('BufWinEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
        vim.wo.breakindent = true
        vim.wo.showbreak = '↪ '
    end,
})

au('InsertEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        pcall(function()
            vim.bo.spell = false
        end)
        if spell_timer then
            pcall(function()
                spell_timer:stop()
                spell_timer:close()
            end)
            spell_timer = nil
        end
    end,
})

au('InsertLeave', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        if spell_timer then
            pcall(function()
                spell_timer:stop()
                spell_timer:close()
            end)
        end
        local bufnr = vim.api.nvim_get_current_buf()
        spell_timer = vim.defer_fn(function()
            if not vim.api.nvim_buf_is_valid(bufnr) then
                spell_timer = nil
                return
            end
            if vim.api.nvim_get_mode().mode == 'n' and vim.bo[bufnr].filetype == 'markdown' then
                pcall(function()
                    vim.bo[bufnr].spell = true
                end)
            end
            spell_timer = nil
        end, 2000)
    end,
})

-- LSP code action listener
au({ 'CursorHold' }, {
    callback = function()
        local ok_ca, ca = pcall(require, 'utils.code_actions')
        if not ok_ca then
            return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        ca.code_action_listener(bufnr, nil, { diagnostics = {} })
    end,
})
