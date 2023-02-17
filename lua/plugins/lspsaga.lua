return {
  "glepnir/lspsaga.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lspsaga = require "lspsaga"

    lspsaga.setup {
      preview = {
        lines_above = 0,
        lines_below = 10,
      },

      code_action = {
        num_shortcut = true,
        keys = {
          quit = ";",
          exec = "<CR>",
        },
      },

      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      request_timeout = 2000,

      lightbulb = {
        enable = false,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },

      rename = {
        quit = ";",
        exec = "<CR>",
        in_select = false,
      },

      finder = {
        edit = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { ";", "<ESC>" },
      },

      diagnostic = {
        twice_into = false,
        show_code_action = true,
        show_source = true,
        keys = {
          exec_action = "o",
          quit = ";",
        },
      },

      symbol_in_winbar = {
        enable = tru,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
      },

      definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = ";",
        close = "<Esc>",
      },

      ui = {
        theme = "round",
        border = "rounded",
        winblend = 0,
        expand = "",
        collaspe = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        kind = {},
      },

      outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
          jump = "o",
          expand_collaspe = "u",
          quit = ";",
        },
      },

      callhierarchy = {
        show_detail = false,
        keys = {
          edit = "e",
          vsplit = "s",
          split = "i",
          tabe = "t",
          jump = "o",
          quit = ";",
          expand_collaspe = "u",
        },
      },
    }
  end,
}
