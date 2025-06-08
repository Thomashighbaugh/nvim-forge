-- Bootstrap lazy.nvim plugin manager
-- This section ensures that lazy.nvim is installed before proceeding with the configuration
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- Clone lazy.nvim repository if it doesn't exist
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        -- Display error message and exit if cloning fails
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Add lazy.nvim to the runtime path
vim.opt.runtimepath:prepend(lazypath)

-- Set leader keys for custom key mappings
-- The leader key is used as a prefix for custom shortcuts
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Load core configuration modules
-- These modules contain the main Neovim configuration
require('core.options') -- General Neovim settings and options
require('core.keymaps') -- Custom key mappings and shortcuts
require('core.autocommands') -- Automatic commands triggered by events
require('core.usercommands') -- Custom user-defined commands

-- Configure lazy.nvim options
-- These settings customize the appearance and behavior of the plugin manager
local opts = {
    ui = {
        border = 'single', -- Set border style for lazy.nvim windows
        icons = {
            lazy = '💤', -- Icon displayed for lazy.nvim in the UI
        },
    },
    checker = {
        enabled = true, -- Enable automatic checking for plugin updates
    },
}

-- Initialize lazy.nvim with plugin configurations
-- This loads all plugins from the 'plugins' and 'plugins.lsp' directories
require('lazy').setup({ { import = 'plugins' }, { import = 'plugins.lsp' } }, opts)
