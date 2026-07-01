-- ╭─────────────────────────────────────────────────────────╮
-- │                    BOOLEAN TOGGLER                      │
-- │  Replacement for nvim-toggler                           │
-- │  Toggle boolean/word pairs under cursor                │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- Word pairs to toggle between
local toggle_pairs = {
    -- Boolean
    { 'true', 'false' },
    { 'True', 'False' },
    { 'TRUE', 'FALSE' },
    -- Yes/No
    { 'yes', 'no' },
    { 'Yes', 'No' },
    { 'YES', 'NO' },
    -- On/Off
    { 'on', 'off' },
    { 'On', 'Off' },
    { 'ON', 'OFF' },
    -- Enable/Disable
    { 'enable', 'disable' },
    { 'Enable', 'Disable' },
    -- Read/Write
    { 'read', 'write' },
    { 'Read', 'Write' },
    -- In/Out
    { 'in', 'out' },
    -- Up/Down
    { 'up', 'down' },
    { 'Up', 'Down' },
    -- Left/Right
    { 'left', 'right' },
    { 'Left', 'Right' },
    -- Min/Max
    { 'min', 'max' },
    { 'Min', 'Max' },
    -- Push/Pull
    { 'push', 'pull' },
    -- Get/Set
    { 'get', 'set' },
    { 'Get', 'Set' },
    -- Add/Remove
    { 'add', 'remove' },
    { 'Add', 'Remove' },
    -- Create/Delete
    { 'create', 'delete' },
    -- Open/Close
    { 'open', 'close' },
    { 'Open', 'Close' },
    -- Start/Stop
    { 'start', 'stop' },
    { 'Start', 'Stop' },
    -- Lock/Unlock
    { 'lock', 'unlock' },
    { 'Lock', 'Unlock' },
    -- Show/Hide
    { 'show', 'hide' },
    { 'Show', 'Hide' },
    -- Visible/Hidden
    { 'visible', 'hidden' },
    -- Enabled/Disabled
    { 'enabled', 'disabled' },
    -- == / ~=
    { '==', '~=' },
    -- AND / OR
    { 'and', 'or' },
    { 'AND', 'OR' },
}

--- Toggle the word under the cursor to its pair counterpart.
function M.toggle()
    local word = vim.fn.expand('<cword>')
    if word == '' then
        vim.notify('No word under cursor', vim.log.levels.WARN)
        return
    end

    for _, pair in ipairs(toggle_pairs) do
        if word == pair[1] then
            -- Replace with the other in the pair
            vim.cmd('normal! ciw' .. pair[2])
            return
        elseif word == pair[2] then
            vim.cmd('normal! ciw' .. pair[1])
            return
        end
    end

    vim.notify('No toggle pair found for: ' .. word, vim.log.levels.WARN)
end

-- ──────────────────────── SETUP ─────────────────────────

function M.setup()
    local map = vim.keymap.set

    -- Toggle word under cursor
    -- Using <leader> prefix (comma): ,wt  for "word toggle"
    -- This replaces the old nvim-toggler binding
    map('n', '<leader>wt', M.toggle, { desc = 'Toggle word (true/false, on/off, etc.)' })
end

return M
