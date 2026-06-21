local lsp = require('plugins.lsp.servers.helpers')

vim.lsp.config.tailwindcss = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    filetypes = {
        'html',
        'css',
        'scss',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'svelte',
        'vue',
        'rust',
        'go',
        'tmpl',
        'gotmpl',
    },
    init_options = {
        userLanguages = {
            rust = 'html',
            go = 'html',
            tmpl = 'html',
            ['gotmpl.html'] = 'html',
        },
    },
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { 'clsx\\(([^)]*)\\)', '(?: clsx\\(|")([^"]|[^)(]+)(?:",\\s"|\\))' },
                },
            },
        },
    },
}
