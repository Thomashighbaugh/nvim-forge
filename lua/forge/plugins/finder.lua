local M = {
  plugins = {
    -- telescope.nvim
    {"nvim-telescope/telescope.nvim"},
    {"nvim-lua/popup.nvim"},
    {"nvim-telescope/telescope-frecency.nvim"},
    {"nvim-telescope/telescope-symbols.nvim"},
    {"nvim-telescope/telescope-file-browser.nvim"},
    {"nvim-telescope/telescope-hop.nvim"},
    {"nvim-telescope/telescope-media-files.nvim"},
    {"artart222/telescope_find_directories"},
    { "ahmedkhalf/project.nvim" },
    { "nvim-telescope/telescope-github.nvim" },
    { "junegunn/fzf", run = "./install --bin" },
    { "ibhagwan/fzf-lua" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    },
    -- snap
    -- {'camspiers/snap'},

    -- fzf
    {"junegunn/fzf"},
    {"junegunn/fzf.vim"}
  }
}

function M.before()
  -- fzf.vim Config
  -- ---
  require("forge.plugins.finders.fzf").before()
end

function M.after()
  -- telescope.nvim Config
  -- ---
  require("forge.plugins.finders.telescope")

  -- snap Config
  -- ---
  -- require('forge.plugins.finders.snap')

  -- fzf.vim Config
  -- ---
  require("forge.plugins.finders.fzf").after()
end

return M
