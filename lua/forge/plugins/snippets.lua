local M = {
  plugins = {
    {'mattn/emmet-vim', opt = true},
    {'hrsh7th/vim-vsnip'},
    {'L3MON4D3/LuaSnip'}
  }
}

function M.before()
  -- emmet-vim Config
  -- ---
  vim.g.user_emmet_leader_key = '<C-q>'
  vim.g.user_emmet_install_global = 0
end

return M
