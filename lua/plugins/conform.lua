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
            markdown = { 'prettier' },
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
            async = false,
            timeout_ms = 500,
        },
    },
}
