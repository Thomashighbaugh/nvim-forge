return {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    keys = {
        { '<leader>lm', '<cmd>Mason<cr>', desc = 'Mason LSP Manager' },
    },
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = ' ',
                    package_pending = ' ',
                    package_uninstalled = ' ',
                },
                border = 'single',
                height = 0.8,
            },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'cssls',
                'emmet_ls',
                'html',
                'intelephense',
                'jdtls',
                'jsonls',
                'ltex',
                'lua_ls',
                'ruff',
                'rust_analyzer',
                'ts_ls',
                'volar',
                'yamlls',
            },
        })
    end,
}
