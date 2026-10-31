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
            registries = {
                'github:mason-org/mason-registry',
            },
            providers = {
                'mason.providers.registry-api',
                'mason.providers.client',
            },
            install_root_dir = vim.fn.stdpath('data') .. '/mason',
            pip = {
                install_args = {},
            },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {},
            automatic_installation = true,
            automatic_enable = {
                exclude = { 'jdtls', 'gitlab_duo' },
            },
        })
    end,
}
