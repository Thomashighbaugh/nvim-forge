local Icons = require("core").icons
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "features.lsp.lang.docker", enabled = true },
    { import = "features.lsp.lang.flutter", enabled = true },
    { import = "features.lsp.lang.go", enabled = true },
    { import = "features.lsp.lang.java", enabled = false },
    { import = "features.lsp.lang.json", enabled = true },
    { import = "features.lsp.lang.markdown", enabled = true },
    { import = "features.lsp.lang.markup", enabled = true },
    { import = "features.lsp.lang.nix", enabled = true },
    { import = "features.lsp.lang.python", enabled = true },
    { import = "features.lsp.lang.rust", enabled = true },
    { import = "features.lsp.lang.typescript", enabled = true },
    { import = "features.lsp.lang.vue", enabled = false },
  },
  defaults = {
    lazy = true,
    -- version = false, -- always use the latest git commit
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "monokai-pro" } },
  checker = { enabled = false, notify = false },
  ui = {
    icons = {
      ft = Icons.lazy.ft,
      lazy = Icons.lazy.lazy,
      loaded = Icons.lazy.loaded,
      not_loaded = Icons.lazy.not_loaded,
    },
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
