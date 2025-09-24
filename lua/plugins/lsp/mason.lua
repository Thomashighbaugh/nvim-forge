return {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    keys = {
        { '<leader>lm', '<cmd>Mason<cr>', desc = 'Mason LSP Manager' },
    },
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
    },
}
