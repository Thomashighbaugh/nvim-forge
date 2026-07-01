-- ╭─────────────────────────────────────────────────────────╮
-- │                    SURROUND OPERATIONS                  │
-- │  Replacement for mini.surround                          │
-- │  Add, delete, and replace surrounding brackets/quotes  │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- ──────────────────── PAIR DEFINITIONS ───────────────────

-- Pairs that can be used as surrounds
-- Each entry: open_char = { close = close_char, type = 'bracket'|'quote'|'angle' }
local pairs = {
    ['('] = { close = ')', type = 'bracket' },
    [')'] = { close = '(', type = 'bracket' },
    ['['] = { close = ']', type = 'bracket' },
    [']'] = { close = '[', type = 'bracket' },
    ['{'] = { close = '}', type = 'bracket' },
    ['}'] = { close = '{', type = 'bracket' },
    ["'"] = { close = "'", type = 'quote' },
    ['"'] = { close = '"', type = 'quote' },
    ['`'] = { close = '`', type = 'quote' },
}

local open_to_close = {
    ['('] = ')', ['['] = ']', ['{'] = '}', ["'"] = "'", ['"'] = '"', ['`'] = '`',
}

local close_to_open = {
    [')'] = '(', [']'] = '[', ['}'] = '{', ["'"] = "'", ['"'] = '"', ['`'] = '`',
}

-- HTML tag pairs (for tag surrounds)
local tag_open = '<'
local tag_close = '>'

-- ──────────────────── UTILITY ────────────────────────────

--- Get the character at a given position in the buffer.
---@param line number 1-indexed
---@param col number 0-indexed
local function get_char(line, col)
    local content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)
    if #content == 0 then
        return nil
    end
    return content[1]:sub(col + 1, col + 1)
end

--- Find the matching close character for an open character at cursor.
--- Walks forward counting nesting.
---@param open_char string
---@param close_char string
---@param start_line number
---@param start_col number 0-indexed
local function find_match(open_char, close_char, start_line, start_col)
    local depth = 1
    local line = start_line
    local col = start_col + 1 -- start after the open char

    while line <= vim.api.nvim_buf_line_count(0) do
        local content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)
        if #content == 0 then
            return nil
        end
        local text = content[1]

        while col <= #text do
            local c = text:sub(col, col)
            if c == open_char then
                depth = depth + 1
            elseif c == close_char then
                depth = depth - 1
                if depth == 0 then
                    return line, col - 1 -- 0-indexed col
                end
            end
            col = col + 1
        end

        line = line + 1
        col = 1
    end

    return nil
end

--- Find the matching open character going backwards.
local function find_match_back(open_char, close_char, start_line, start_col)
    local depth = 1
    local line = start_line
    local col = start_col - 1 -- start before the close char

    while line >= 1 do
        local content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)
        if #content == 0 then
            return nil
        end
        local text = content[1]

        while col >= 1 do
            local c = text:sub(col, col)
            if c == close_char then
                depth = depth + 1
            elseif c == open_char then
                depth = depth - 1
                if depth == 0 then
                    return line, col - 1 -- 0-indexed col
                end
            end
            col = col - 1
        end

        line = line - 1
        if line >= 1 then
            local prev_content = vim.api.nvim_buf_get_lines(0, line - 1, line, false)
            if #prev_content > 0 then
                col = #prev_content[1]
            end
        end
    end

    return nil
end

-- ────────────────────── SA (ADD) ────────────────────────

--- Add surround around a motion or visual selection.
--- Usage: sa{motion}{char}  e.g.  saiw(  wraps word in parens
function M.add()
    local char = vim.fn.nr2char(vim.fn.getchar())
    local close = open_to_close[char]

    if not close then
        -- Check for tag: saiwt  wraps in <t></t>
        if char == 't' then
            M._add_tag()
            return
        end
        vim.notify('Invalid surround char: ' .. char, vim.log.levels.WARN)
        return
    end

    -- Get the visual selection or motion range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local start_col = vim.fn.col("'<") - 1
    local end_col = vim.fn.col("'>") -- 0-indexed, exclusive

    -- Get the selected text
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    if #lines == 1 then
        -- Single line: insert open at start, close at end
        local line = lines[1]
        local before = line:sub(1, start_col)
        local selected = line:sub(start_col + 1, end_col)
        local after = line:sub(end_col + 1)
        vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, {
            before .. char .. selected .. close .. after,
        })
    else
        -- Multi-line: open on first line, close on last line
        lines[1] = lines[1]:sub(1, start_col) .. char .. lines[1]:sub(start_col + 1)
        lines[#lines] = lines[#lines]:sub(1, end_col) .. close .. lines[#lines]:sub(end_col + 1)
        vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
    end
end

--- Add tag surround. Prompts for tag name.
function M._add_tag()
    vim.fn.inputsave()
    local tag = vim.fn.input('Tag name: ')
    vim.fn.inputrestore()
    if tag == '' then
        return
    end

    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local start_col = vim.fn.col("'<") - 1
    local end_col = vim.fn.col("'>")

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    if #lines == 1 then
        local line = lines[1]
        local before = line:sub(1, start_col)
        local selected = line:sub(start_col + 1, end_col)
        local after = line:sub(end_col + 1)
        vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, {
            before .. '<' .. tag .. '>' .. selected .. '</' .. tag .. '>' .. after,
        })
    else
        lines[1] = lines[1]:sub(1, start_col) .. '<' .. tag .. '>' .. lines[1]:sub(start_col + 1)
        lines[#lines] = lines[#lines]:sub(1, end_col) .. '</' .. tag .. '>' .. lines[#lines]:sub(end_col + 1)
        vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
    end
end

-- ────────────────────── SD (DELETE) ─────────────────────

--- Delete surrounding brackets/quotes around cursor.
--- Usage: sd{char}  e.g.  sd(  deletes surrounding parens
function M.delete()
    local char = vim.fn.nr2char(vim.fn.getchar())
    local close = open_to_close[char]
    local open = close_to_open[char]

    if not close and not open then
        if char == 't' then
            M._delete_tag()
            return
        end
        vim.notify('Invalid surround char: ' .. char, vim.log.levels.WARN)
        return
    end

    local line = vim.fn.line('.')
    local col = vim.fn.col('.') - 1
    local text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1] or ''

    -- Look for the surrounding pair on the current line
    -- Find the closest open char to the left and close char to the right
    local open_pos = nil
    local close_pos = nil

    for i = col, 1, -1 do
        if text:sub(i, i) == (open or char) then
            open_pos = i
            break
        end
    end

    for i = col + 1, #text do
        if text:sub(i, i) == (close or char) then
            close_pos = i
            break
        end
    end

    if open_pos and close_pos then
        local new_text = text:sub(1, open_pos - 1) .. text:sub(open_pos + 1, close_pos - 1) .. text:sub(close_pos + 1)
        vim.api.nvim_buf_set_lines(0, line - 1, line, false, { new_text })
    else
        vim.notify('No matching surround found', vim.log.levels.WARN)
    end
end

--- Delete surrounding tag.
function M._delete_tag()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.') - 1
    local text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1] or ''

    -- Find opening <tag> and closing </tag> on the same line
    local open_start, open_end = text:find('<[^/][^>]*>')
    local close_start, close_end = text:find('</[^>]+>')

    if open_start and close_start then
        local new_text = text:sub(1, open_start - 1) .. text:sub(open_end + 1, close_start - 1) .. text:sub(close_end + 1)
        vim.api.nvim_buf_set_lines(0, line - 1, line, false, { new_text })
    else
        vim.notify('No matching tag surround found', vim.log.levels.WARN)
    end
end

-- ────────────────────── SR (REPLACE) ────────────────────

--- Replace surrounding brackets/quotes.
--- Usage: sr{old}{new}  e.g.  sr('  replaces () with ''
function M.replace()
    local old_char = vim.fn.nr2char(vim.fn.getchar())
    local new_char = vim.fn.nr2char(vim.fn.getchar())

    local old_close = open_to_close[old_char] or close_to_open[old_char]
    local new_close = open_to_close[new_char]

    if not old_close or not new_close then
        vim.notify('Invalid surround chars', vim.log.levels.WARN)
        return
    end

    local line = vim.fn.line('.')
    local col = vim.fn.col('.') - 1
    local text = vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1] or ''

    local open_pos = nil
    local close_pos = nil

    for i = col, 1, -1 do
        if text:sub(i, i) == old_char then
            open_pos = i
            break
        end
    end

    for i = col + 1, #text do
        if text:sub(i, i) == old_close then
            close_pos = i
            break
        end
    end

    if open_pos and close_pos then
        local new_text = text:sub(1, open_pos - 1)
            .. new_char
            .. text:sub(open_pos + 1, close_pos - 1)
            .. new_close
            .. text:sub(close_pos + 1)
        vim.api.nvim_buf_set_lines(0, line - 1, line, false, { new_text })
    else
        vim.notify('No matching surround found', vim.log.levels.WARN)
    end
end

-- ──────────────────────── SETUP ─────────────────────────

function M.setup()
    local map = vim.keymap.set

    -- sa{motion}{char} - Add surround
    -- Uses operatorfunc pattern for motion support
    map('n', 'sa', function()
        -- Set up operatorfunc to capture the motion range
        vim.o.operatorfunc = 'v:lua.require_utils_surround_operator'
        vim.b._surround_action = 'add'
        -- Feed g@ to wait for a motion
        vim.api.nvim_feedkeys('g@', 'n', false)
    end, { desc = 'Add surround (sa{motion}{char})' })

    -- sd{char} - Delete surround
    map('n', 'sd', function()
        M.delete()
    end, { desc = 'Delete surround (sd{char})' })

    -- sr{old}{new} - Replace surround
    map('n', 'sr', function()
        M.replace()
    end, { desc = 'Replace surround (sr{old}{new})' })

    -- Visual mode sa{char} - Add surround around selection
    map('x', 'sa', function()
        M.add()
    end, { desc = 'Add surround around selection' })
end

-- Operator function for sa{motion}
function M._operator()
    M.add()
end

return M
