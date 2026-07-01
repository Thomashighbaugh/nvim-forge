-- ╭─────────────────────────────────────────────────────────╮
-- │                      AUTO PAIRS                         │
-- │  Replacement for mini.pairs                             │
-- │  Auto-close brackets, quotes, and backticks            │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

local pairs_map = {
    ['('] = { close = ')', regex = false },
    ['['] = { close = ']', regex = false },
    ['{'] = { close = '}', regex = false },
    ["'"] = { close = "'", regex = false },
    ['"'] = { close = '"', regex = false },
    ['`'] = { close = '`', regex = false },
}

--- Check if autopair should fire at the current cursor position.
--- Skips if the next character is alphanumeric (likely typing in an existing word).
local function should_autopair(char)
    if not vim.g.autopairs_enabled then
        return false
    end

    local col = vim.fn.col('.') - 1 -- 0-indexed column
    local line = vim.api.nvim_get_current_line()
    local next_char = line:sub(col + 1, col + 1)

    -- Don't autopair if next char is alphanumeric or underscore
    if next_char and next_char:match('[%w_]') then
        return false
    end

    -- Don't autopair if we're inside a string context and the char is a quote
    -- (simple heuristic: check if there's an odd number of quotes before cursor)
    if char == "'" or char == '"' or char == '`' then
        local before = line:sub(1, col)
        local count = 0
        for c in before:gmatch(char) do
            count = count + 1
        end
        if count % 2 == 1 then
            return false -- already inside a string
        end
    end

    return true
end

function M.setup()
    vim.api.nvim_create_autocmd('InsertCharPre', {
        group = vim.api.nvim_create_augroup('AutoPairs', { clear = true }),
        callback = function()
            local char = vim.v.char
            local pair = pairs_map[char]
            if not pair or not should_autopair(char) then
                return
            end

            -- Insert the closing bracket and move cursor back
            vim.v.char = char .. pair.close
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes('<Left>', true, false, true),
                'n',
                false
            )
        end,
    })
end

return M
