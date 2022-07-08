local M = {
  plugins = {
    -- UI Plugins
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    {"nvim-treesitter/nvim-treesitter-textobjects"},
    {"nvim-treesitter/nvim-treesitter-context"},
    {"p00f/nvim-ts-rainbow"},
    {"JoosepAlviste/nvim-ts-context-commentstring"},
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
    {
      "sidebar-nvim/sidebar.nvim",
      rocks = {"luatz"}
    },
    {"j-hui/fidget.nvim"},
    {"goolord/alpha-nvim"},
    {"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"},
    {
      -- icons
      "kyazdani42/nvim-web-devicons",
      after = "xresources-nvim"
    },
    {
      "sudormrfbin/cheatsheet.nvim",
      requires = {
        {"nvim-telescope/telescope.nvim"},
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      }
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
  require("forge.plugins.ui.alpha")
  require("forge.plugins.ui.whichkey")
  require("forge.plugins.ui.sidebar")
  require("fidget").setup(
    {
      text = {spinner = "bouncing_bar"}
    }
  )
end

return M
