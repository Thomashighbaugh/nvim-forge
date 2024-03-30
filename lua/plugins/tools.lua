return {

  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
  },

  --  ╞═══════════════════════════════════════════════════════════════╡
  {
    "loctvl842/compile-nvim",
    lazy = true,
    config = function()
      require("plugins.config.compile")
    end,
  },
  --  ╞═══════════════════════════════════════════════════════════════╡
  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
      { "<leader>d", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
      { "<C-w>", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
    },
  },
  --  ╞═══════════════════════════════════════════════════════════════╡
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
