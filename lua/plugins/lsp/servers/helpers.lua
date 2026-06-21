-- Shared LSP helpers for per-server configs
-- Provides capabilities, handlers, and navic for server definitions
local M = {}

M.capabilities = require('blink.cmp').get_lsp_capabilities()

local border = {
    { '╭', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╮', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '╯', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '╰', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

M.handlers = {
    ['textDocument/hover'] = function(err, result, ctx, config)
        return vim.lsp.handlers.hover(err, result, ctx, vim.tbl_extend('force', config or {}, { border = border }))
    end,
    ['textDocument/signatureHelp'] = function(err, result, ctx, config)
        return vim.lsp.handlers.signature_help(
            err,
            result,
            ctx,
            vim.tbl_extend('force', config or {}, { border = border })
        )
    end,
}

M.navic = require('nvim-navic')

return M
