-- ╭─────────────────────────────────────────────────────────╮
-- │                    COMMENT TOGGLER                      │
-- │  Replacement for mini.comment                           │
-- │  Toggle line/selection comments with gc / gcc          │
-- ╰─────────────────────────────────────────────────────────╯

local M = {}

-- Filetype-specific comment strings (fallback when commentstring is empty)
local ft_comment_map = {
    lua = '-- %s',
    python = '# %s',
    rust = '// %s',
    go = '// %s',
    javascript = '// %s',
    typescript = '// %s',
    javascriptreact = '{/* %s */}',
    typescriptreact = '{/* %s */}',
    c = '// %s',
    cpp = '// %s',
    java = '// %s',
    sh = '# %s',
    zsh = '# %s',
    bash = '# %s',
    yaml = '# %s',
    nix = '# %s',
    toml = '# %s',
    html = '<!-- %s -->',
    css = '/* %s */',
    scss = '/* %s */',
    markdown = '<!-- %s -->',
    tex = '% %s',
    vim = '" %s',
    conf = '# %s',
    ini = '; %s',
}

--- Get the comment string for the current buffer.
local function get_commentstring()
    local cs = vim.bo.commentstring
    if cs and cs ~= '' then
        return cs
    end
    return ft_comment_map[vim.bo.filetype] or '-- %s'
end

--- Check if a line is commented.
---@param line string
---@param comment_prefix string
local function is_commented(line, comment_prefix)
    local trimmed = line:match('^%s*(.*)')
    if not trimmed then
        return false
    end
    return trimmed:sub(1, #comment_prefix) == comment_prefix
end

--- Get the comment prefix from a commentstring like '-- %s' or '// %s'.
local function get_prefix(cs)
    return cs:match('^(.-)%%s') or cs
end

--- Toggle comment on a range of lines.
---@param start_line number 1-indexed
---@param end_line number 1-indexed
local function toggle_range(start_line, end_line)
    local cs = get_commentstring()
    local prefix = get_prefix(cs)
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    -- Check if ALL non-empty lines are commented
    local all_commented = true
    local has_content = false
    for _, line in ipairs(lines) do
        if line:match('%S') then
            has_content = true
            if not is_commented(line, prefix) then
                all_commented = false
                break
            end
        end
    end

    if not has_content then
        return
    end

    local new_lines = {}
    for _, line in ipairs(lines) do
        if all_commented then
            -- Uncomment: remove the prefix and any following space
            local uncommented = line:gsub('^%s*' .. vim.pesc(prefix) .. ' ?', '')
            table.insert(new_lines, uncommented)
        else
            -- Comment: add prefix
            if line:match('%S') then
                table.insert(new_lines, prefix .. ' ' .. line)
            else
                table.insert(new_lines, line)
            end
        end
    end

    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
end

function M.setup()
    local map = vim.keymap.set

    -- gc{motion} - toggle comment on a motion
    map('n', 'gc', function()
        -- Use operatorfunc pattern for motions
        local start = vim.fn.line('.')
        vim.go.operatorfunc = 'v:lua.require_utils_comment_operator'
        vim.api.nvim_feedkeys('g@', 'n', false)
        -- Store start line for the operator function
        vim.b._comment_start = start
    end, { desc = 'Toggle comment (motion)' })

    -- gcc - toggle comment on current line
    map('n', 'gcc', function()
        local line = vim.fn.line('.')
        toggle_range(line, line)
    end, { desc = 'Toggle comment line' })

    -- gc in visual mode - toggle comment on selection
    map('x', 'gc', function()
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")
        toggle_range(start_line, end_line)
    end, { desc = 'Toggle comment (visual)' })
end

-- Operator function for gc{motion}
-- Called by vim after the motion is completed
-- Uses '[ and '] marks set by the motion
function M._operator()
    local start_line = vim.fn.line("'[")
    local end_line = vim.fn.line("']")
    toggle_range(start_line, end_line)
end

return M
