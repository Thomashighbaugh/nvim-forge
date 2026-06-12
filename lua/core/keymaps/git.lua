-- Git keymaps

-- diffview.nvim toggle
vim.keymap.set('n', '<leader>dv', function()
    local lib = require('diffview.lib')
    local view = lib.get_current_view()
    if view then
        vim.cmd.DiffviewClose()
    else
        vim.cmd.DiffviewOpen()
    end
end, { desc = 'Diffview Toggle' })
