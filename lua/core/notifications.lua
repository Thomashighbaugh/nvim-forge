-- ╭─────────────────────────────────────────────────────────────────────╮
-- │ NOTIFICATION ENHANCEMENTS                                           │
-- │ Enhanced notification system with history and better management     │
-- ╰─────────────────────────────────────────────────────────────────────╯

local M = {}

-- Configuration
local config = {
    max_history = 100, -- Maximum number of notifications to keep in history
    auto_clear_timeout = 300000, -- Auto clear old notifications after 5 minutes (in ms)
    persistent_levels = { vim.log.levels.ERROR, vim.log.levels.WARN }, -- These levels stay longer
}

-- Notification history
local notification_history = {}
local notification_count = 0

-- Original vim.notify function
local original_notify = vim.notify

-- Enhanced notify function
local function enhanced_notify(msg, level, opts)
    opts = opts or {}
    level = level or vim.log.levels.INFO

    -- Add to history
    notification_count = notification_count + 1
    local notification = {
        id = notification_count,
        message = msg,
        level = level,
        timestamp = os.time(),
        opts = opts,
    }

    table.insert(notification_history, notification)

    -- Keep history size manageable
    if #notification_history > config.max_history then
        table.remove(notification_history, 1)
    end

    -- Adjust timeout based on message length and level
    local timeout = opts.timeout
    if not timeout then
        local base_timeout = 3000 -- 3 seconds base
        local length_factor = math.min(#msg / 50, 5) -- Add time for longer messages
        local level_factor = 1

        -- Keep important notifications longer
        if level == vim.log.levels.ERROR then
            level_factor = 3
        elseif level == vim.log.levels.WARN then
            level_factor = 2
        end

        timeout = math.floor(base_timeout * (1 + length_factor) * level_factor)
        opts.timeout = timeout
    end

    -- Call original notify
    return original_notify(msg, level, opts)
end

-- Show notification history
function M.show_history()
    if #notification_history == 0 then
        vim.notify('No notifications in history', vim.log.levels.INFO)
        return
    end

    local lines = {}
    table.insert(lines, '󰍢 Notification History')
    table.insert(lines, string.rep('═', 50))

    for i = #notification_history, 1, -1 do
        local notif = notification_history[i]
        local level_icon = ''
        local level_name = ''

        if notif.level == vim.log.levels.ERROR then
            level_icon = ' '
            level_name = 'ERROR'
        elseif notif.level == vim.log.levels.WARN then
            level_icon = ' '
            level_name = 'WARN'
        elseif notif.level == vim.log.levels.INFO then
            level_icon = ' '
            level_name = 'INFO'
        elseif notif.level == vim.log.levels.DEBUG then
            level_icon = ' '
            level_name = 'DEBUG'
        else
            level_icon = ' '
            level_name = 'TRACE'
        end

        local time_str = os.date('%H:%M:%S', notif.timestamp)
        table.insert(lines, string.format('%s [%s] %s %s', level_icon, time_str, level_name, notif.message))
    end

    -- Create a new buffer for the history
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].filetype = 'notification-history'

    -- Calculate window size
    local width = math.max(60, math.min(vim.o.columns - 4, 120))
    local height = math.min(#lines + 2, math.floor(vim.o.lines * 0.8))

    -- Create floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = 'minimal',
        border = 'rounded',
        title = ' Notification History ',
        title_pos = 'center',
    })

    -- Set window options
    vim.wo[win].wrap = false
    vim.wo[win].cursorline = true

    -- Add keymaps for the history window
    local opts_local = { buffer = buf, silent = true }
    vim.keymap.set('n', 'q', '<cmd>close<cr>', opts_local)
    vim.keymap.set('n', '<Esc>', '<cmd>close<cr>', opts_local)
    vim.keymap.set('n', 'r', function()
        vim.api.nvim_win_close(win, true)
        M.show_history()
    end, vim.tbl_extend('force', opts_local, { desc = 'Refresh history' }))
    vim.keymap.set('n', 'c', function()
        M.clear_history()
        vim.api.nvim_win_close(win, true)
        vim.notify('Notification history cleared', vim.log.levels.INFO)
    end, vim.tbl_extend('force', opts_local, { desc = 'Clear history' }))

    -- Add syntax highlighting
    vim.cmd([[
        syntax match NotificationTime /\[\d\d:\d\d:\d\d\]/
        syntax match NotificationError /ERROR.*$/
        syntax match NotificationWarn /WARN.*$/
        syntax match NotificationInfo /INFO.*$/
        syntax match NotificationDebug /DEBUG.*$/
        syntax match NotificationTrace /TRACE.*$/
        
        highlight link NotificationTime Comment
        highlight link NotificationError DiagnosticError
        highlight link NotificationWarn DiagnosticWarn
        highlight link NotificationInfo DiagnosticInfo
        highlight link NotificationDebug DiagnosticHint
        highlight link NotificationTrace Comment
    ]])
end

-- Clear notification history
function M.clear_history()
    notification_history = {}
    notification_count = 0
end

-- Get recent notifications
function M.get_recent(count)
    count = count or 5
    local recent = {}
    local start_idx = math.max(1, #notification_history - count + 1)

    for i = start_idx, #notification_history do
        table.insert(recent, notification_history[i])
    end

    return recent
end

-- Show last notification details
function M.show_last()
    if #notification_history == 0 then
        vim.notify('No notifications in history', vim.log.levels.INFO)
        return
    end

    local last = notification_history[#notification_history]
    local level_name = ''

    if last.level == vim.log.levels.ERROR then
        level_name = 'ERROR'
    elseif last.level == vim.log.levels.WARN then
        level_name = 'WARN'
    elseif last.level == vim.log.levels.INFO then
        level_name = 'INFO'
    elseif last.level == vim.log.levels.DEBUG then
        level_name = 'DEBUG'
    else
        level_name = 'TRACE'
    end

    local time_str = os.date('%Y-%m-%d %H:%M:%S', last.timestamp)
    local full_msg = string.format('Last Notification [%s %s]:\n\n%s', level_name, time_str, last.message)

    vim.notify(full_msg, last.level, { timeout = 10000 })
end

-- Auto-cleanup old notifications
local function cleanup_old_notifications()
    local current_time = os.time()
    local cutoff_time = current_time - (config.auto_clear_timeout / 1000)

    local new_history = {}
    for _, notif in ipairs(notification_history) do
        -- Keep persistent level notifications or recent ones
        if vim.tbl_contains(config.persistent_levels, notif.level) or notif.timestamp > cutoff_time then
            table.insert(new_history, notif)
        end
    end

    notification_history = new_history
end

-- Setup function
function M.setup(opts)
    config = vim.tbl_deep_extend('force', config, opts or {})

    -- Replace vim.notify with enhanced version
    vim.notify = enhanced_notify

    -- Set up auto-cleanup timer
    local timer = vim.uv.new_timer()
    timer:start(config.auto_clear_timeout, config.auto_clear_timeout, function()
        cleanup_old_notifications()
    end)

    -- Create user commands
    vim.api.nvim_create_user_command('NotificationHistory', function()
        M.show_history()
    end, { desc = 'Show notification history' })

    vim.api.nvim_create_user_command('NotificationClear', function()
        M.clear_history()
        vim.notify('Notification history cleared', vim.log.levels.INFO)
    end, { desc = 'Clear notification history' })

    vim.api.nvim_create_user_command('NotificationLast', function()
        M.show_last()
    end, { desc = 'Show last notification in detail' })

    -- Add keymaps
    vim.keymap.set('n', '<space>nn', M.show_history, { desc = 'Show notification history' })
    vim.keymap.set('n', '<space>nc', M.clear_history, { desc = 'Clear notification history' })
    vim.keymap.set('n', '<space>nl', M.show_last, { desc = 'Show last notification' })
end

return M
