-- ╭─────────────────────────────────────────────────────────────────────╮
-- │ SMART REDRAW OPTIMIZATION                                           │
-- │ Temporarily enable lazyredraw during expensive operations only     │
-- ╰─────────────────────────────────────────────────────────────────────╯

local M = {}

-- Track if lazyredraw is temporarily enabled
local temp_lazyredraw = false

-- Enable lazyredraw temporarily
function M.enable_temp_lazyredraw()
    if not temp_lazyredraw then
        vim.opt.lazyredraw = true
        temp_lazyredraw = true
    end
end

-- Disable temporary lazyredraw
function M.disable_temp_lazyredraw()
    if temp_lazyredraw then
        vim.opt.lazyredraw = false
        temp_lazyredraw = false
    end
end

-- Setup smart lazyredraw behavior
function M.setup()
    local augroup = vim.api.nvim_create_augroup('SmartRedraw', { clear = true })

    -- Enable lazyredraw during macro recording/execution
    vim.api.nvim_create_autocmd('RecordingEnter', {
        group = augroup,
        callback = M.enable_temp_lazyredraw,
        desc = 'Enable lazyredraw during macro recording',
    })

    vim.api.nvim_create_autocmd('RecordingLeave', {
        group = augroup,
        callback = function()
            -- Delay disabling to ensure macro execution is complete
            vim.defer_fn(M.disable_temp_lazyredraw, 100)
        end,
        desc = 'Disable lazyredraw after macro recording',
    })

    -- Enable during long operations (like large substitutions)
    vim.api.nvim_create_autocmd('CmdlineEnter', {
        group = augroup,
        pattern = ':',
        callback = function()
            local cmdline = vim.fn.getcmdline()
            -- Enable for substitute commands that might be expensive
            if cmdline:match('^%%?s/') or cmdline:match('^%d+,%d+s/') then
                M.enable_temp_lazyredraw()
            end
        end,
        desc = 'Enable lazyredraw for large substitutions',
    })

    vim.api.nvim_create_autocmd('CmdlineLeave', {
        group = augroup,
        pattern = ':',
        callback = function()
            vim.defer_fn(M.disable_temp_lazyredraw, 50)
        end,
        desc = 'Disable lazyredraw after command execution',
    })

    -- Create user commands for manual control
    vim.api.nvim_create_user_command('LazyRedrawEnable', function()
        M.enable_temp_lazyredraw()
        vim.notify('Temporary lazyredraw enabled', vim.log.levels.INFO)
    end, { desc = 'Temporarily enable lazyredraw' })

    vim.api.nvim_create_user_command('LazyRedrawDisable', function()
        M.disable_temp_lazyredraw()
        vim.notify('Temporary lazyredraw disabled', vim.log.levels.INFO)
    end, { desc = 'Disable temporary lazyredraw' })

    vim.api.nvim_create_user_command('LazyRedrawStatus', function()
        local status = temp_lazyredraw and 'ENABLED (temporary)' or 'DISABLED'
        local vim_setting = vim.opt.lazyredraw:get() and 'ON' or 'OFF'
        vim.notify(string.format('LazyRedraw Status: %s\nVim setting: %s', status, vim_setting), vim.log.levels.INFO)
    end, { desc = 'Show lazyredraw status' })
end

-- Wrapper function for expensive operations
function M.with_lazyredraw(func)
    M.enable_temp_lazyredraw()
    local ok, result = pcall(func)
    vim.defer_fn(M.disable_temp_lazyredraw, 100)

    if not ok then
        error(result)
    end
    return result
end

return M
