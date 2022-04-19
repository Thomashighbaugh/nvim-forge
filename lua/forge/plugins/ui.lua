local M = {
  plugins = {
    -- UI Deps
    {"kyazdani42/nvim-web-devicons"},
    -- UI Plugins
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    {"nvim-treesitter/nvim-treesitter-textobjects"},
    {"nvim-treesitter/nvim-treesitter-refactor"},
    {"code-biscuits/nvim-biscuits"},
    {"lukas-reineke/indent-blankline.nvim", opt = true},
    {"akinsho/bufferline.nvim"},
    {"folke/todo-comments.nvim", opt = true},
    {"plasticboy/vim-markdown", opt = true},
    {"camspiers/animate.vim"},
    {"kosayoda/nvim-lightbulb"},
    {"MunifTanjim/nui.nvim"},
    {"stevearc/dressing.nvim"},
    {"onsails/diaglist.nvim"},
    {"folke/which-key.nvim"},
    {"nekonako/xresources-nvim"},
    {"j-hui/fidget.nvim"},
    {"glepnir/dashboard-nvim"},
    {
      -- icons
      "kyazdani42/nvim-web-devicons",
      after = "xresources-nvim"
    },
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup()
      end,
      after = "xresources-nvim"
    }
  }
}

function M.after()
  require("forge.plugins.ui.treesitter")
  require("forge.plugins.ui.biscuits")
  require("forge.plugins.ui.bufferline")
  require("forge.plugins.ui.diaglist")
  require("forge.plugins.ui.dashboard")
  require("forge.plugins.ui.whichkey")
  require("fidget").setup(
    {
      text = {spinner = "bouncing_bar"}
    }
  )
end

return M
