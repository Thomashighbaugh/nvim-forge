vim.cmd(
    [[
  command! NeovimUpdate lua require('neovim.utils').update()
  command! NeovimReload lua require('neovim.utils').reload_user_config(true)
  command! NeovimReloadSync lua require('neovim.utils').reload_user_config_sync()
  command! LspFormat lua vim.lsp.buf.formatting()

  augroup Neovim_Auto_Resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]]
)
