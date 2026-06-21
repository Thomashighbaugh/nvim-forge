-- Markdown-specific autocommands
local au = vim.api.nvim_create_autocmd

-- Markdown soft wrapping
local markdown_group = vim.api.nvim_create_augroup('MarkdownWrap', { clear = true })

-- Timer handle for delayed spell activation in normal mode
local spell_timer = nil

au('BufWinEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        vim.wo.wrap = true
        vim.wo.linebreak = true
        vim.wo.breakindent = true
        vim.wo.showbreak = '↪ '
    end,
})

-- Smart spell: only in normal mode, never in insert mode
-- Use pcall for all spell assignments and guard against stale buffers in the
-- deferred timer to prevent errors when buffers are closed between triggers.
au('InsertEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        pcall(function()
            vim.bo.spell = false
        end)
        if spell_timer then
            spell_timer:stop()
            spell_timer:close()
            spell_timer = nil
        end
    end,
})

au('InsertLeave', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        if spell_timer then
            spell_timer:stop()
            spell_timer:close()
        end
        local bufnr = vim.api.nvim_get_current_buf()
        spell_timer = vim.defer_fn(function()
            -- Guard: stop if the timer itself was cancelled (spell_timer replaced)
            -- or if the original buffer is no longer valid
            if not vim.api.nvim_buf_is_valid(bufnr) then
                spell_timer = nil
                return
            end
            -- Only enable spell if we're back in normal mode and still in markdown
            if vim.api.nvim_get_mode().mode == 'n' and vim.bo[bufnr].filetype == 'markdown' then
                pcall(function()
                    vim.bo[bufnr].spell = true
                end)
            end
            spell_timer = nil
        end, 2000)
    end,
})
