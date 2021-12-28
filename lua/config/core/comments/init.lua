local M = {}
vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>/c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>/", "<Plug>kommentary_visual_default", {})

return M
