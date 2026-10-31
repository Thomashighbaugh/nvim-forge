require('core.bootstrap')

pcall(function()
    vim.lsp.set_log_level('WARN')
end)

vim.g.mapleader = ','
vim.g.maplocalleader = ','

require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.usercommands')

pcall(vim.cmd, 'colorscheme default')

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        require('core.notifications').setup()
        require('core.smart-redraw').setup()
        require('core.error-logging').setup()
    end,
})

require('utils.window').setup()
require('utils.todo-marker').setup()
require('utils.toggler').setup()
require('utils.substitute').setup()

local opts = {
    ui = {
        border = 'single',
        icons = {
            lazy = '💤',
        },
    },
    checker = {
        enabled = true,
    },
    concurrency = 8,
    change_detection = { notify = false },
    git = {
        timeout = 600,
        filter = false,
    },
}

require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lsp' } }, opts)
