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
--─────────────────────────────────────────────────────────────────
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
--─────────────────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      -- When in diff mode, we want to use the default
      -- vim text objects c & C instead of the treesitter ones.
      local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
      local configs = require("nvim-treesitter.configs")
      for name, fn in pairs(move) do
        if name:find("goto") == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
              for key, query in pairs(config or {}) do
                if q == query and key:find("[%]%[][cC]") then
                  vim.cmd("normal! " .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },
--─────────────────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
  },
}
