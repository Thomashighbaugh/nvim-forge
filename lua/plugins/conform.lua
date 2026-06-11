return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            css = { 'prettier' },
            html = { 'prettier' },
            javascript = { 'prettier' },
            json = { 'prettier' },
            tex = { 'latexindent' },
            lua = { 'stylua' },
            -- markdown formatters — use none by default (render-markdown handles display)
            -- prettier doesn't support markdown meaningfully
            nix = { 'alejandra' },
            php = { 'prettier' },
            python = { 'black' },
            rust = { 'rustfmt' },
            scss = { 'prettier' },
            vue = { 'prettier' },
            yaml = { 'yamlfmt' },
        },
        format_on_save = {
            lsp_format = 'fallback',
            async = true,
            timeout_ms = 1000,
        },
    },
}
