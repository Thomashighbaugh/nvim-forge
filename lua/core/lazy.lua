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
    { import = "plugins.lang.markdown", enabled = true },
    { import = "plugins.lang.nix", enabled = true },
    { import = "plugins.lang.rust", enabled = true },
    { import = "plugins.lang.python", enabled = true },
    { import = "plugins.lang.php", enabled = true },
    { import = "plugins.lang.typescript", enabled = true },
    { import = "plugins.lang.json", enabled = true },
    { import = "plugins.lang.java", enabled = false },
    { import = "plugins.lang.docker", enabled = true },
    { import = "plugins.lang.clangd", enabled = false },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "monokai-pro" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
