return {
  {
    "windwp/nvim-autopairs",
    opts = {
      enable_check_bracket_line = false,       -- Don't add pairs if it already has a close pair in the same line, don't check next line
      ignored_next_char = "[%w%.]",            -- will ignore alphanumeric and `.` symbol
      check_ts = true,                         -- use treesitter to check for a pair.
      ts_config = {
        lua = { "string" },                    -- it will not add pair on that treesitter node
        javascript = { "template_string" },
        java = false,                          -- don't check treesitter on java
      },
    },
  },
  { "famiu/bufdelete.nvim" },

  {
    "ellisonleao/carbon-now.nvim",
    opts = {
      theme = "Material",
      window_theme = "none",
      font_family = "Cascadia Code",
      font_size = "18px",
      bg = "#4A90E2",
      line_numbers = true,
      line_height = "133%",
      drop_shadow = false,
      drop_shadow_offset_y = "20px",
      drop_shadow_blur = "68px",
      width = "680",
      watermark = false,
    },
    cmd = "CarbonNow",
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local colorizer = require("colorizer")

      colorizer.setup({
        css = {
          RGB = true,                -- #RGB hex codes
          RRGGBB = true,             -- #RRGGBB hex codes
          names = true,              -- "Name" codes like Blue
          RRGGBBAA = true,           -- #RRGGBBAA hex codes
          rgb_fn = true,             -- CSS rgb() and rgba() functions
          hsl_fn = true,             -- CSS hsl() and hsla() functions
          css = true,                -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,             -- Enable all CSS *functions*: rgb_fn, hsl_fn
        },
        html = { mode = "background" },
        markdown = { names = false },
        "yaml",
        lua = { names = false },
        "*",
      })
    end,
  },

  { "jghauser/follow-md-links.nvim" },
  { "rafamadriz/friendly-snippets" },
  { "tpope/vim-fugitive" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "rafcamlet/nvim-luapad",
    ft = "lua",
  },
  { "mzlogin/vim-markdown-toc" },
}
