return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "dot",
        "go",
        "graphql",
        "graphql",
        "html",
        "http",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "query",
        "regex",
        "ruby",
        "rust",
        "scss",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
        "yaml",
        "zig",
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { "yaml", "python", "html" } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
      endwise = {
        enable = true,
      },
      autopairs = { enable = true },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
            ["ir"] = "@parameter.inner",
            ["ar"] = "@parameter.outer",
          },
        },

        context_commentstring = { enable = true },
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          disable = { "jsx", "html" },
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        require("nvim-ts-autotag").setup()
      end,
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    init = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
