-- ╭─────────────────────────────────────────────────────────╮
-- │                    BUFFER MANAGEMENT                     │
-- │  Replacement for mini.bufremove                         │
-- │  Delete buffers without closing the window              │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

--- Delete a buffer, switching to an alternate window first
--- so the window stays open.
---@param bufnr number|nil Buffer number (0 or nil = current)
---@param force boolean|nil Force delete even if modified
function M.delete(bufnr, force)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    -- Find a window showing a different buffer
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_buf(win) ~= bufnr then
            vim.api.nvim_set_current_win(win)
            break
        end
    end

    vim.api.nvim_buf_delete(bufnr, { force = force or false })
end

function M.setup()
    local map = vim.keymap.set

    map('n', '<leader>bd', function()
        M.delete(0, false)
    end, { desc = 'Delete buffer (keep layout)' })

    map('n', '<leader>bD', function()
        M.delete(0, true)
    end, { desc = 'Delete buffer (force)' })
end

return M
