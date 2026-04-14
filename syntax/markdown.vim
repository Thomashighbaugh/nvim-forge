" Complete markdown syntax override to prevent NixOS infinite loop
" This completely replaces the system markdown.vim to prevent txt.vim loading

if exists("b:current_syntax")
  finish
endif

" Prevent any syntax highlighting - render-markdown.nvim handles formatting
syntax clear
syntax off

" Prevent the system syntax from being loaded again
let b:current_syntax = "markdown"

" Disable any treesitter highlighting that might interfere
if exists('*nvim_treesitter#disable_module')
  call luaeval('pcall(vim.treesitter.stop, vim.api.nvim_get_current_buf())')
endif