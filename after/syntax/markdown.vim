" Override system markdown syntax to prevent txt.vim loading issues
" This prevents the system markdown.vim from loading and causing infinite loops

if exists("b:current_syntax")
  finish
endif

" Minimal markdown syntax - render-markdown.nvim handles the real formatting
syntax clear

" Set some basic highlighting groups to avoid errors
highlight link markdownH1 Title
highlight link markdownH2 Title  
highlight link markdownH3 Title
highlight link markdownH4 Title
highlight link markdownH5 Title
highlight link markdownH6 Title

let b:current_syntax = "markdown"