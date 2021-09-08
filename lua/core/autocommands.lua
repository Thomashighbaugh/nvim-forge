local augroup = vim.api.nvim_exec

augroup(
    [[

augroup Terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * setlocal norelativenumber
augroup END
]],
    true
)
augroup(
    [[

augroup Config
    autocmd!
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
    autocmd VimEnter * set formatoptions-=cro
    autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif
augroup END
]],
    true
)
augroup(
    [[

augroup UpdateGlobal
    autocmd!
    autocmd FileType markdown,gitcommit setlocal spell
    autocmd Filetype go,tex set tabstop=2 | set shiftwidth=2
    autocmd BufRead,BufNewFile *.md,*.gitcommit setlocal spell
    autocmd CursorHold,CursorHoldI * lua require'core.utils'.code_action()
augroup END
]],
    true
)
augroup(
    [[

    augroup lightbulb
    autocmd!
        autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
augroup END
    ]],
    true
)
