-- ╭─────────────────────────────────────────────────────────╮
-- │                    TODO / CHECKBOX MARKER               │
-- │  Replacement for todo-marker.nvim                      │
-- │  Cycle TODO/FIXME/HACK markers and toggle markdown [ ]  │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ──────────────────── TODO CYCLING ──────────────────────

--- Cycle through TODO marker states on the current line.
--- States: (none) → TODO → FIXME → HACK → (none)
function M.cycle_todo()
    local line_num = vim.fn.line('.')
    local line = vim.api.nvim_get_current_line()

    local markers = { 'TODO', 'FIXME', 'HACK' }
    local found_idx = nil
    local found_pos = nil

    -- Check if any marker exists on the line
    for idx, marker in ipairs(markers) do
        local start_pos, end_pos = line:find(marker .. ':')
        if start_pos then
            found_idx = idx
            found_pos = start_pos
            break
        end
    end

    if found_idx then
        -- Remove the current marker
        local new_line = line:sub(1, found_pos - 1) .. line:sub(found_pos + #markers[found_idx] + 1)
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
        vim.notify('Removed ' .. markers[found_idx], vim.log.levels.INFO)
    else
        -- Add TODO marker at the start of the line content (after leading whitespace)
        local indent = line:match('^(%s*)') or ''
        local content = line:match('^%s*(.*)') or ''
        local new_line = indent .. 'TODO: ' .. content
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
        vim.notify('Added TODO', vim.log.levels.INFO)
    end
end

-- ──────────────────── CHECKBOX TOGGLE ───────────────────

--- Toggle a markdown-style checkbox [ ] on the current line.
--- States: (none) → [ ] → [x] → (none)
function M.toggle_checkbox()
    local line_num = vim.fn.line('.')
    local line = vim.api.nvim_get_current_line()

    -- Check for existing checkbox patterns
    local unchecked_start, unchecked_end = line:find('%[ %]')
    local checked_start, checked_end = line:find('%[x%]')

    if checked_start then
        -- [x] → remove checkbox entirely
        local before = line:sub(1, checked_start - 1)
        local after = line:sub(checked_end + 1)
        -- Remove the space before the checkbox if it's there
        local new_line = before:match('.*%S$') and (before .. ' ' .. after) or (before .. after)
        new_line = new_line:gsub('%s+', ' '):gsub('^%s', '')
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
        vim.notify('Checkbox removed', vim.log.levels.INFO)
    elseif unchecked_start then
        -- [ ] → [x]
        local new_line = line:sub(1, unchecked_start) .. 'x' .. line:sub(unchecked_start + 2)
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
        vim.notify('Checkbox checked', vim.log.levels.INFO)
    else
        -- (none) → [ ]
        local indent = line:match('^(%s*)') or ''
        local content = line:match('^%s*(.*)') or ''
        local new_line = indent .. '- [ ] ' .. content
        vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, { new_line })
        vim.notify('Checkbox added', vim.log.levels.INFO)
    end
end

-- ──────────────────────── SETUP ─────────────────────────

function M.setup()
    local map = vim.keymap.set

    -- Cycle TODO/FIXME/HACK markers
    -- Using <leader> prefix (comma): ,tt  for "TODO toggle"
    map('n', '<leader>tt', M.cycle_todo, { desc = 'Cycle TODO/FIXME/HACK marker' })

    -- Toggle markdown checkbox [ ]
    -- Using <leader> prefix: ,tc  for "toggle checkbox"
    map('n', '<leader>tc', M.toggle_checkbox, { desc = 'Toggle checkbox [ ] / [x]' })
end

return M
