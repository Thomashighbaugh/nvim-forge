
   -- ------------------------------------------------- --
-- set markdown directory to opened file easing use of vimwiki somewhat
vim.api.nvim_command([[
augroup Vimwiki
	autocmd FileType markdown set autochdir
augroup END
]])
   -- ------------------------------------------------- --
-- windows to close with "q"
vim.cmd([[autocmd FileType help,qf,lspinfo,fugitive nnoremap <buffer><silent> q :close<CR>]])
vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
   -- ------------------------------------------------- --
-- get rid of weird formatoptions
vim.cmd([[autocmd BufEnter * setlocal formatoptions-=r formatoptions-=o]])

 -- highlight the text you are yanking, which helps a bit when pasting it ;]
vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {}")
   -- ------------------------------------------------- --
-- autoformat on save
vim.cmd([[
    augroup fmt
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
    augroup END
]])

