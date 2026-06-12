-- LSP-related autocommands
local au = vim.api.nvim_create_autocmd

-- Code action listener (only on CursorHold, not CursorHoldI)
au({ 'CursorHold' }, {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local range = nil
        local context = { diagnostics = {} }
        require('utils.code_actions').code_action_listener(bufnr, range, context)
    end,
})
