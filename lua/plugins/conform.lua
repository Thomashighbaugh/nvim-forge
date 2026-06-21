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
        -- Use a function for format_on_save so we can skip during autosaves.
        -- When autosave triggers a write (InsertLeave/FocusLost/TextChangedI debounce),
        -- vim.g.saving_for_autosave is set to true, and we return nil to skip formatting.
        -- On manual :w, the flag is nil/false, so we return the normal format config.
        format_on_save = function()
            if vim.g.saving_for_autosave then
                return nil
            end
            return {
                lsp_format = 'fallback',
                timeout_ms = 1000,
            }
        end,
    },
}
