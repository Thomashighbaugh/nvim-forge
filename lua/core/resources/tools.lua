return {

  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "loctvl842/compile-nvim",
    lazy = true,
    config = function()
      require("config.compile")
    end,
  },

  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
      { "<leader>d", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
      { "<C-w>", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "blank", "terminal", "folds", "tabpages" },
    },
    keys = {},
  },

  -- Easily switch virtual environment in python
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        post_set_venv = function()
          vim.cmd([[LspRestart]])
        end,
      })
    end,
  },
}
