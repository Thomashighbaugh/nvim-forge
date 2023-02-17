return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local theme = {
      normal = {
        a = { bg = "#1c1c1c", fg = "#a9a9a9" },
        b = { bg = "#222222", fg = "#b6b6b6" },
        c = { bg = "#2c2c2c", fg = "#d1d1d1" },
      },

      insert = {
        a = { bg = "#323232", fg = "#4dd564" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      command = {
        a = { bg = "NONE", fg = "#ECBE7B" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      visual = {
        a = { bg = "NONE", fg = "#C678DD" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      replace = {
        a = { bg = "NONE", fg = "#DB4B4B" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      terminal = {
        a = { bg = "NONE", fg = "#7AA2F7" },
        b = { bg = "NONE", fg = "#BBC2CF" },
      },

      inactive = {
        a = { bg = "NONE", fg = "#BBC2CF" },
        b = { bg = "NONE", fg = "#BBC2CF" },
        c = { bg = "NONE", fg = "#BBC2CF" },
      },
    }

    local lualine = require "lualine"

    local statusline = require "plugins.lualine.default"

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "TelescopePrompt",
          "toggleterm",
          "alpha",
          "lazy",
        },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          statusline.branch,
          statusline.mode,
          statusline.diagnostics,
          statusline.lsp,
        },
        lualine_x = {
          statusline.diff,
          statusline.filetype,
          statusline.filesize,
          statusline.progress,
          statusline.percent,
          statusline.total_lines,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
