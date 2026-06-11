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

-- ╭─────────────────────────────────────────────────────────╮
-- │           SYNC CLIPBOARD ON FOCUS (FOR CLIPSE)          │
-- ╰─────────────────────────────────────────────────────────╯
au({ 'FocusGained', 'BufEnter' }, {
    callback = function()
        -- Force refresh of clipboard register from system clipboard
        vim.fn.setreg('+', vim.fn.getreg('+'))
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
-- │                QUIT SPECIAL WINDOWS WITH Q              │
-- ╰─────────────────────────────────────────────────────────╯
au('FileType', {
    pattern = { 'help', 'qf', 'man', 'query' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
        -- Open help in a new tab
        if vim.bo.filetype == 'help' then
            vim.cmd('wincmd T')
        end
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
au({ 'CursorHold' }, {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local range = nil
        local context = { diagnostics = {} }
        require('utils.code_actions').code_action_listener(bufnr, range, context)
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

-- ╔═════════════════════════════════════════════════════════╗
-- ║              MARKDOWN SOFT WRAPPING (NIXOS)              ║
-- ╚═════════════════════════════════════════════════════════╝
-- Markdown soft wrapping (using BufWinEnter to ensure window options apply)
-- NOTE: `after/syntax/markdown.vim` handles minimal syntax setup;
--       render-markdown.nvim handles visual rendering.
local markdown_group = vim.api.nvim_create_augroup('MarkdownWrap', { clear = true })

-- Timer handle for delayed spell activation in normal mode
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

-- Spell: only in normal mode, never in insert mode (avoids per-keystroke overhead)
-- On InsertEnter: disable spell immediately, cancel any pending activation
-- On InsertLeave: schedule spell to activate after 2s (cancelled if re-entering insert)
au('InsertEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        vim.bo.spell = false
        if spell_timer then
            spell_timer:stop()
            spell_timer:close()
            spell_timer = nil
        end
    end,
})

au('InsertLeave', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        -- Cancel any previous pending activation
        if spell_timer then
            spell_timer:stop()
            spell_timer:close()
        end
        -- Schedule spell activation in 2 seconds
        spell_timer = vim.defer_fn(function()
            -- Only activate if still in normal mode and still a markdown buffer
            if vim.api.nvim_get_mode().mode == 'n' and vim.bo.filetype == 'markdown' then
                vim.bo.spell = true
            end
            spell_timer = nil
        end, 2000)
    end,
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║                LARGE FILE OPTIMIZATION                   ║
-- ╚═════════════════════════════════════════════════════════╝
local large_file_group = vim.api.nvim_create_augroup('LargeFile', { clear = true })

au('BufReadPre', {
    group = large_file_group,
    callback = function()
        local file_path = vim.api.nvim_buf_get_name(0)
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
            print(
                string.format(
                    'Large file detected (%.2f MB), performance optimizations applied',
                    file_size / 1024 / 1024
                )
            )
        else
            vim.b.large_buf = false
        end
    end,
})

-- ╔═════════════════════════════════════════════════════════╗
-- ║              MANUAL LINTER INTEGRATIONS                  ║
-- ╚═════════════════════════════════════════════════════════╝
-- Replaces mfussenegger/nvim-lint with direct autocmd calls.
-- Runs linters on BufEnter and BufWritePost for specific filetypes.
local linter_group = vim.api.nvim_create_augroup('LinterIntegration', { clear = true })

local function run_linter(cmd, args, source_name)
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename == '' then return end

    vim.system({ cmd, unpack(args) }, { text = true }, function(out)
        if out.code ~= 0 or out.stderr then
            local diagnostics = {}
            for line in (out.stdout or ''):gmatch('[^\n]+') do
                -- Parse eslint/jsonlint/yamllint style: file:line:col: severity: message
                local file, line_num, col, severity, message = line:match('^(.-):(%d+):(%d+):%s*(.-):%s*(.*)$')
                if not file then
                    -- Try yamllint format: file:line:col: message
                    file, line_num, col, message = line:match('^(.-):(%d+):(%d+):%s*(.*)$')
                    severity = 'error'
                end
                if file and line_num then
                    table.insert(diagnostics, {
                        lnum = tonumber(line_num) - 1,
                        col = tonumber(col) and tonumber(col) - 1 or 0,
                        severity = severity:lower():find('warn') and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR,
                        source = source_name,
                        message = message or line,
                    })
                end
            end
            vim.schedule(function()
                vim.diagnostic.set(vim.api.nvim_get_current_buf(), diagnostics)
            end)
        end
    end)
end

au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    callback = function()
        if vim.bo.modified then
            run_linter('eslint', { '--format', 'compact', '--no-color', vim.api.nvim_buf_get_name(0) }, 'eslint')
        end
    end,
})

au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = '*.json',
    callback = function()
        if vim.bo.modified then
            run_linter('jsonlint', { vim.api.nvim_buf_get_name(0) }, 'jsonlint')
        end
    end,
})

au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = '*.yaml',
    callback = function()
        if vim.bo.modified then
            run_linter('yamllint', { '--format', 'parsable', vim.api.nvim_buf_get_name(0) }, 'yamllint')
        end
    end,
})
