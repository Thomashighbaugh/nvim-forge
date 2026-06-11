local lsp = require('plugins.lsp.servers')

vim.lsp.config.texlab = {
    capabilities = lsp.capabilities,
    handlers = lsp.handlers,
    settings = {
        texlab = {
            auxDirectory = '.',
            bibtexFormatter = 'texlab',
            build = {
                args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                executable = 'latexmk',
                forwardSearchAfter = false,
                onSave = false,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 100,
            forwardSearch = { args = {} },
            latexFormatter = 'latexindent',
            latexindent = { modifyLineBreaks = false },
        },
    },
}
