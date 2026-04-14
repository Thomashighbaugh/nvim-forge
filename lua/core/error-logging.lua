-- ╭─────────────────────────────────────────────────────────────────────╮
-- │ ERROR LOGGING ENHANCEMENT                                           │
-- │ Better error logging and debugging utilities                       │
-- ╰─────────────────────────────────────────────────────────────────────╯

local M = {}

-- Error log file
local log_file = vim.fn.stdpath('log') .. '/errors.log'

-- Original error handler
local original_notify = vim.notify

-- Enhanced error logging
local function log_error(msg, level, opts)
    opts = opts or {}
    level = level or vim.log.levels.INFO

    -- Always call original notify first
    original_notify(msg, level, opts)

    -- Only log errors and warnings to file
    if level >= vim.log.levels.WARN then
        local timestamp = os.date('%Y-%m-%d %H:%M:%S')
        local level_name = level == vim.log.levels.ERROR and 'ERROR' or 'WARN'
        local log_entry = string.format('[%s] %s: %s\n', timestamp, level_name, msg)

        -- Append to log file
        local file = io.open(log_file, 'a')
        if file then
            file:write(log_entry)
            file:close()
        end
    end
end

-- Setup error logging
function M.setup()
    -- Don't replace notify if our notification system already did
    if vim.notify ~= original_notify then
        -- Our notification system is already in place, just enhance it
        return
    end

    -- Replace vim.notify with enhanced version
    vim.notify = log_error

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

    -- CMP specific error debugging
    vim.api.nvim_create_user_command('CmpDebug', function()
        local cmp = require('cmp')
        vim.notify('CMP Debug Info:\nSources: ' .. vim.inspect(cmp.get_config().sources), vim.log.levels.INFO)
    end, { desc = 'Show CMP debug information' })

    vim.api.nvim_create_user_command('CmpTest', function()
        vim.notify('Testing CMP cmdline completion...', vim.log.levels.INFO)

        -- Schedule the test to avoid blocking
        vim.schedule(function()
            -- Simulate entering command mode
            vim.api.nvim_feedkeys(':', 'n', false)

            vim.defer_fn(function()
                -- Type some text that should trigger completion
                vim.api.nvim_feedkeys('help ', 'n', false)

                vim.defer_fn(function()
                    -- Exit command mode
                    vim.api.nvim_feedkeys('<C-c>', 'n', false)
                    vim.notify('CMP cmdline test completed - check for any errors above', vim.log.levels.INFO)
                end, 500)
            end, 300)
        end)
    end, { desc = 'Test CMP cmdline completion' })
end

-- Function to capture and log Lua errors
function M.capture_lua_errors()
    -- Override the global error handler
    local original_error = _G.error
    _G.error = function(msg, level)
        log_error('Lua Error: ' .. tostring(msg), vim.log.levels.ERROR)
        return original_error(msg, level)
    end
end

return M
