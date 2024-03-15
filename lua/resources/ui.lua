local Util = require("util")
local Icon = require("core.icons")

return {
  -- ─────────────────────────────────────────────────────────────────
  -- Notifications styler with useful notifications clear command
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>N",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      icons = {
        ERROR = Icon.diagnostics.error .. " ",
        INFO = Icon.diagnostics.info .. " ",
        WARN = Icon.diagnostics.warn .. " ",
      },
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- buffers listed as tabs above editor window interface
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
      { "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
      { "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
      { "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
      { "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
      { "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
      { "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
      { "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
      { "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
      { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<A-S-l>", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
      { "<A-S-h>", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
    },
    opts = function()
      local monokai_opts = require("util").opts("monokai-pro.nvim")
      return {
        options = {
          diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
          --     separator_style = "", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
          separator_style = { "thick", "thick" }, -- | "thick" | "thin" | { 'any', 'any' },
          -- separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
          indicator = {
            -- icon = " ",
            -- style = 'icon',
            style = "underline",
          },
          close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          diagnostics_indicator = function(count, _, _, _)
            if count > 9 then
              return "9+"
            end
            return tostring(count)
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "EXPLORER",
              text_align = "center",
              separator = not vim.tbl_contains(monokai_opts.background_clear or {}, "neo-tree"), -- set to `true` if clear background of neo-tree
            },
            {
              filetype = "NvimTree",
              text = "EXPLORER",
              text_align = "center",
              separator = not vim.tbl_contains(monokai_opts.background_clear or {}, "nvim-tree"), -- set to `true` if clear background of neo-tree
            },
          },
          hover = {
            enabled = true,
            delay = 0,
            reveal = { "close" },
          },
        },
      }
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- Status bar below editor window with some useful information I never look at
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local monokai_opts = require("util").opts("monokai-pro.nvim")
      return {
        float = not vim.tbl_contains({}, "neo-tree"),
        separator = "bubble", -- bubble | triangle
        ---@type any
        colorful = true,
      }
    end,
    config = function(_, opts)
      local lualine_config = require("config.lualine")
      lualine_config.setup(opts)
      lualine_config.load()
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- provides identation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.SCOPE_ACTIVE, function(bufnr)
        return vim.api.nvim_buf_line_count(bufnr) < 2000
      end)

      local highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      }
      return {
        debounce = 200,
        indent = {
          char = "▏",
          tab_char = "▏",
        },
        scope = {
          injected_languages = true,
          highlight = highlight,
          show_start = true,
          show_end = false,
          char = "▏",
          include = {
            node_type = { ["*"] = { "*" } },
          },
          exclude = {
            node_type = { ["*"] = { "source_file", "program" }, python = { "module" }, lua = { "chunk" } },
          },
        },
        exclude = {
          filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "neo-tree",
          },
          buftypes = {
            "terminal",
            "nofile",
          },
        },
      }
    end,
    main = "ibl",
  },
  -- ─────────────────────────────────────────────────────────────────
  -- provides indentation support using pipe symbol
  {
    "echasnovski/mini.indentscope",
    lazy = true,
    enabled = true,
    -- lazy = true,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = false },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
  -- ─────────────────────────────────────────────────────────────────

  {
    "utilyre/barbecue.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      attach_navic = false,
      theme = "auto",
      include_buftypes = { "" },
      exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
      show_modified = false,
      kinds = Icon.kinds,
    },
  },
  -- ─────────────────────────────────────────────────────────────────
  -- my finally functional terminal popup that works with NixOS
  {
    "akinsho/toggleterm.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = "1",
      start_in_insert = true,
      direction = "float",
      insert_mappings = true,
      persist_size = true,
      close_on_exit = false,
      shell = "/run/current-system/sw/bin/zsh",
      autochdir = false,
      float_opts = {
        border = "single",
        winblend = 3,
        width = 85,
        height = 55,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      winbar = {
        enabled = false,
        name_formatter = function(term)
          return term.name
        end,
      },
    },
  },
  -- ─────────────────────────────────────────────────────────────────
  -- a dashboard for that rare situation I open nvim without any particular file in mind
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    keys = { { "<leader>0", "<cmd>Dashboard<CR>", desc = "Dashboard" } },
    config = function()
      require("config.dashboard")
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- icons for nvim-tree
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- scrollbars for nvim
  {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      set_highlights = false,
      excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
        "neo-tree",
        "dashboard",
        "alpha",
        "lazy",
        "mason",
        "DressingInput",
        "",
      },
      handlers = {
        gitsigns = true,
      },
    },
  },
  -- ─────────────────────────────────────────────────────────────────
  -- window animations are fun
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = true },
    },
    opts = {
      animation = { enable = true, duration = 150, fps = 60 },
      autowidth = { enable = true },
    },
    keys = { { "<leader>m", "<cmd>WindowsMaximize<CR>", desc = "Zoom window" } },
    init = function()
      vim.o.winwidth = 30
      vim.o.winminwidth = 30
      vim.o.equalalways = true
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- because I am still not able to translate hex codes to colors in my head
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    init = function()
      require("colorizer").setup()
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {
      input = {
        border = Util.generate_borderchars("thick", "tl-t-tr-r-bl-b-br-l"),
        win_options = { winblend = 0 },
      },
      select = { telescope = Util.telescope_theme("cursor") },
    },
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          cmdline = { icon = "  " },
          search_down = { icon = "  󰄼" },
          search_up = { icon = "  " },
          lua = { icon = "  " },
        },
      },
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = false },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
        },
      },
    },
  },
  --─────────────────────────────────────────────────────────────────
  -- ease neovim development somehow I don't remember
  {
    "folke/neodev.nvim",
    lazy = true,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- TODO:Move this to coding or lang/java
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  -- ─────────────────────────────────────────────────────────────────
  -- dependency of many other things, probably not needed here but mitigates issues because it is
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- Adds things like :Move, :Rename, :SudoWrite, etc.
  { "tpope/vim-eunuch", event = "VeryLazy" },
  -- ─────────────────────────────────────────────────────────────────
  -- useful popup windows
  {
    "anuvyklack/hydra.nvim",
    dependencies = {
      "anuvyklack/keymap-layer.nvim",
    },
    config = function()
      require("config.hydra.hydra")
    end,
  },
  -- ─────────────────────────────────────────────────────────────────
  -- window picking when opening a buffer with splits open
  {
    "s1n7ax/nvim-window-picker",
    lazy = false,
    opts = {
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = {
            "neo-tree",
            "neo-tree-popup",
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
          },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { "nofile", "help", "terminal" },
        },
      },
      other_win_hl_color = "#948ae3",
    },
  },
}
