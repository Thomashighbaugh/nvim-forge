return {
  {
    "kevinhwang91/rnvimr",
    event = { "BufReadPost", "BufNewFile" },
    keys = { { "<leader>r", "<cmd>RnvimrToggle<cr>", desc = "Open file manager" } },
    init = function()
      -- Make Ranger to be hidden after picking a file
      vim.g.rnvimr_enable_picker = 1

      -- Change the border's color
      -- vim.g.rnvimr_border_attr = { fg = 31, bg = -1 }
      vim.g.rnvimr_border_attr = { fg = 3, bg = -1 }

      -- Draw border with both
      vim.g.rnvimr_ranger_cmd = { "ranger", "--cmd=set draw_borders both" }

      -- Add a shadow window, value is equal to 100 will disable shadow
      vim.g.rnvimr_shadow_winblend = 90
    end,
  },

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