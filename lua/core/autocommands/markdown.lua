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
au('InsertEnter', {
    group = markdown_group,
    pattern = '*.md',
    callback = function()
        vim.bo.spell = false
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
        spell_timer = vim.defer_fn(function()
            if vim.api.nvim_get_mode().mode == 'n' and vim.bo.filetype == 'markdown' then
                vim.bo.spell = true
            end
            spell_timer = nil
        end, 2000)
    end,
})
