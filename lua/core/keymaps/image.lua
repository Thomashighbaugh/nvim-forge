-- Image clear keymap (snacks.image)
vim.keymap.set('n', '<leader>pp', function()
    local snacks_ok, snacks = pcall(require, 'snacks')
    if snacks_ok and snacks.image then
        snacks.image.clear()
    end
end, { desc = 'Clear Images' })
