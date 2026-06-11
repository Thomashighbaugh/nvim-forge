-- Manual linter integrations (replaces mfussenegger/nvim-lint)
local au = vim.api.nvim_create_autocmd
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
