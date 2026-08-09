-- ╭──────────────────────────────────────────────────────────╮
-- │                 FILETYPE-SPECIFIC AUTOCOMMANDS            │
-- │  Consolidated from:                                       │
-- │    • largefile.lua — large file performance optimizations │
-- │    • linters.lua   — manual eslint/jsonlint/yamllint      │
-- │    • markdown.lua  — soft wrap + smart spell              │
-- ╰──────────────────────────────────────────────────────────╯
-- ──────────────────────── TABLE OF CONTENTS ────────────────────────
--   1. LARGE FILE   BufReadPre threshold check + perf opts
--   2. LINTERS      eslint (.js/.jsx/.ts/.tsx), jsonlint (.json),
--                   yamllint (.yaml) — BufEnter + BufWritePost
--   3. MARKDOWN     Soft wrapping, smart spell (normal-mode only)
-- ────────────────────────────────────────────────────────────────────

local au = vim.api.nvim_create_autocmd

-- ╭──────────────────────────────────────────────────────────╮
-- │ 1. LARGE FILE — performance optimizations                │
-- ╰──────────────────────────────────────────────────────────╯
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

-- ╭──────────────────────────────────────────────────────────╮
-- │ 2. LINTERS — manual linter integrations                  │
-- │    (replaces mfussenegger/nvim-lint)                     │
-- ╰──────────────────────────────────────────────────────────╯
local linter_group = vim.api.nvim_create_augroup('LinterIntegration', { clear = true })

local function run_linter(cmd, args, source_name)
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    if filename == '' then
        return
    end

    vim.system({ cmd, unpack(args) }, { text = true }, function(out)
        if out.code ~= 0 or out.stderr then
            local diagnostics = {}
            for line in (out.stdout or ''):gmatch('[^\n]+') do
                local file, line_num, col, severity, message = line:match('^(.-):(%d+):(%d+):%s*(.-):%s*(.*)$')
                if not file then
                    file, line_num, col, message = line:match('^(.-):(%d+):(%d+):%s*(.*)$')
                    severity = 'error'
                end
                if file and line_num then
                    table.insert(diagnostics, {
                        lnum = tonumber(line_num) - 1,
                        col = tonumber(col) and tonumber(col) - 1 or 0,
                        severity = severity:lower():find('warn') and vim.diagnostic.severity.WARN
                            or vim.diagnostic.severity.ERROR,
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

-- ────────────── eslint: .js/.jsx/.ts/.tsx ──────────────
au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    callback = function()
        if vim.bo.modified then
            run_linter('eslint', { '--format', 'compact', '--no-color', vim.api.nvim_buf_get_name(0) }, 'eslint')
        end
    end,
})

-- ────────────── jsonlint: .json ──────────────
au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = '*.json',
    callback = function()
        if vim.bo.modified then
            run_linter('jsonlint', { vim.api.nvim_buf_get_name(0) }, 'jsonlint')
        end
    end,
})

-- ────────────── yamllint: .yaml ──────────────
au({ 'BufEnter', 'BufWritePost' }, {
    group = linter_group,
    pattern = '*.yaml',
    callback = function()
        if vim.bo.modified then
            run_linter('yamllint', { '--format', 'parsable', vim.api.nvim_buf_get_name(0) }, 'yamllint')
        end
    end,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ 3. MARKDOWN — soft wrapping + smart spell                │
-- ╰──────────────────────────────────────────────────────────╯
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

-- Smart spell: only in normal mode, never in insert mode
-- Use pcall for all spell assignments and guard against stale buffers in the
-- deferred timer to prevent errors when buffers are closed between triggers.
au('InsertEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        pcall(function()
            vim.bo.spell = false
        end)
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
        if spell_timer then
            spell_timer:stop()
            spell_timer:close()
        end
        local bufnr = vim.api.nvim_get_current_buf()
        spell_timer = vim.defer_fn(function()
            -- Guard: stop if the timer itself was cancelled (spell_timer replaced)
            -- or if the original buffer is no longer valid
            if not vim.api.nvim_buf_is_valid(bufnr) then
                spell_timer = nil
                return
            end
            -- Only enable spell if we're back in normal mode and still in markdown
            if vim.api.nvim_get_mode().mode == 'n' and vim.bo[bufnr].filetype == 'markdown' then
                pcall(function()
                    vim.bo[bufnr].spell = true
                end)
            end
            spell_timer = nil
        end, 2000)
    end,
})
