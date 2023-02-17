return {
  {
    "folke/neodev.nvim",
    lazy = true,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "moll/vim-bbye",
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },

   {
     "rcarriga/nvim-notify",
     config = function()
       vim.notify = require "notify"
     end,
   },

  {
    "dstein64/vim-startuptime",
    init = function()
      vim.g.startuptime_tries = 5
    end,
    cmd = "StartupTime",
    dependencies = {
      "nvim-lualine/lualine.nvim", -- Just to fix stuck issue on vim-startuptime
    },
  },
}
