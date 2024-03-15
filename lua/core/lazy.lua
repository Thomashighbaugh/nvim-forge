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
    { import = "resources" },
    { import = "resources.lang.markdown", enabled = true },
    { import = "resources.lang.nix", enabled = true },
    { import = "resources.lang.rust", enabled = true },
    { import = "resources.lang.python", enabled = true },
    { import = "resources.lang.php", enabled = true },
    { import = "resources.lang.typescript", enabled = true },
    { import = "resources.lang.json", enabled = true },
    { import = "resources.lang.java", enabled = false },
    { import = "resources.lang.docker", enabled = true },
    { import = "resources.lang.clangd", enabled = false },
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
