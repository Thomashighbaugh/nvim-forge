local lsp = require('plugins.lsp.servers.helpers')

-- ──────────────────────────────────────────────────────────────────────────
-- ltex-ls: Grammar/spell checker (Java LSP)
--
-- ltex-ls re-analyzes the entire buffer on every keystroke, which is the #1
-- cause of insert-mode lag in markdown. We set a 600ms client-side debounce
-- so the Java process only fires after you pause typing. This gives you
-- clean keystrokes (fast typing, backspaces) with zero overhead — the
-- grammar check runs in the background once you've stopped.
-- ──────────────────────────────────────────────────────────────────────────
vim.lsp.config.ltex = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = { 'bibtex', 'markdown', 'latex', 'tex' },
    settings = {
        ltex = { language = 'en-US' },
    },
}

-- Client-side debounce: delays didChange notifications so fast typing /
-- backspace doesn't fire the Java grammar checker on every keystroke.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LtexDebounce', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'ltex' then
            -- 600ms: only send didChange once typing pauses for this long.
            -- Default is ~150ms which fires the full-buffer Java grammar
            -- checker on every single keystroke — the main source of lag.
            client.debounce = 600
        end
    end,
})
