-- ╭─────────────────────────────────────────────────────────────────────╮
-- │ ERROR LOGGING ENHANCEMENT                                           │
-- │ Better error logging and debugging utilities                       │
-- ╰─────────────────────────────────────────────────────────────────────╯

local M = {}

-- Error log file
local log_file = vim.fn.stdpath('log') .. '/errors.log'

-- Appends error/warn messages to log file
local function write_to_log(msg, level)
    if not level or level < vim.log.levels.WARN then
        return
    end

    local timestamp = os.date('%Y-%m-%d %H:%M:%S')
    local level_name = level == vim.log.levels.ERROR and 'ERROR' or 'WARN'
    local log_entry = string.format('[%s] %s: %s\n', timestamp, level_name, msg)

    local file = io.open(log_file, 'a')
    if file then
        file:write(log_entry)
        file:close()
    end
end

-- Setup error logging
function M.setup()
    -- Capture whatever vim.notify is right now
    -- (could be original, or already enhanced by notifications.lua)
    local current_notify = vim.notify

    -- Wrap vim.notify to add file logging; chains to whatever was there before
    vim.notify = function(msg, level, opts)
        opts = opts or {}
        level = level or vim.log.levels.INFO

        -- Write errors and warnings to log file
        write_to_log(msg, level)

        -- Chain to current notify (original or enhanced_notify)
        current_notify(msg, level, opts)
    end

    -- Create commands for error management
    vim.api.nvim_create_user_command('ErrorLog', function()
        if vim.fn.filereadable(log_file) == 1 then
            vim.cmd('edit ' .. log_file)
        else
            vim.notify('No error log file found', vim.log.levels.INFO)
        end
    end, { desc = 'Open error log file' })

    vim.api.nvim_create_user_command('ErrorLogClear', function()
        local file = io.open(log_file, 'w')
        if file then
            file:close()
            vim.notify('Error log cleared', vim.log.levels.INFO)
        else
            vim.notify('Could not clear error log', vim.log.levels.ERROR)
        end
    end, { desc = 'Clear error log file' })

    vim.api.nvim_create_user_command('ErrorLogTail', function()
        if vim.fn.filereadable(log_file) == 1 then
            local lines = vim.fn.readfile(log_file)
            local recent_lines = {}
            local start_idx = math.max(1, #lines - 20)

            for i = start_idx, #lines do
                table.insert(recent_lines, lines[i])
            end

            if #recent_lines > 0 then
                vim.notify('Recent errors:\n' .. table.concat(recent_lines, '\n'), vim.log.levels.INFO)
            else
                vim.notify('No recent errors', vim.log.levels.INFO)
            end
        else
            vim.notify('No error log file found', vim.log.levels.INFO)
        end
    end, { desc = 'Show recent errors from log' })

    -- Mini.completion debug command
    vim.api.nvim_create_user_command('MiniCompDebug', function()
        local ok, minicomp = pcall(require, 'mini.completion')
        if ok then
            vim.notify('mini.completion is active', vim.log.levels.INFO)
        else
            vim.notify('mini.completion not available', vim.log.levels.WARN)
        end
    end, { desc = 'Show mini.completion debug information' })
end

-- Function to capture and log Lua errors
function M.capture_lua_errors()
    -- Override the global error handler
    local original_error = _G.error
    _G.error = function(msg, level)
        write_to_log('Lua Error: ' .. tostring(msg), vim.log.levels.ERROR)
        vim.notify('Lua Error: ' .. tostring(msg), vim.log.levels.ERROR)
        return original_error(msg, level)
    end
end

return M
