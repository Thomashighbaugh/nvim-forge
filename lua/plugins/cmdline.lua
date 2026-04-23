return {
    --  ╭──────────────────────────────────────────────────────────╮
    --  │                COMMAND LINE COMPLETION                   │
    --  ╰──────────────────────────────────────────────────────────╯
    'smolck/command-completion.nvim',
    event = 'CmdlineEnter',
    opts = {
        border = nil,
        max_col_num = 5,
        min_col_width = 20,
        use_matchfuzzy = true,
        highlight_selection = true,
        highlight_directories = true,
        tab_completion = true,
    },
    config = function(_, opts)
        -- Disable native wildmenu (command-completion replaces it)
        vim.opt.wildmenu = false

        -- Disable cmdwin entry points to avoid breaking command-completion
        -- q: q/ q? in normal mode, Ctrl-F in cmdline mode
        local nomap_opts = { noremap = true, silent = true }
        vim.keymap.set('n', 'q:', '<nop>', nomap_opts)
        vim.keymap.set('n', 'q/', '<nop>', nomap_opts)
        vim.keymap.set('n', 'q?', '<nop>', nomap_opts)
        vim.keymap.set('c', '<C-f>', '<nop>', nomap_opts)

        require('command-completion').setup(opts)
    end,
}