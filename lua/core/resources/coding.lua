return {
  {
    "huggingface/llm.nvim",
    lazy = true,
    opts = {
      model = "bigcode/starcoder", -- can be a model ID or an http(s) endpoint
      accept_keymap = "<Tab>",
      dismiss_keymap = "<S-Tab>",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  {
    "mattn/emmet-vim",
    event = { "BufRead", "BufNewFile" },
    init = function()
      vim.g.user_emmet_leader_key = "f"
      vim.g.user_emmet_mode = "n"
      vim.g.user_emmet_settings = {
        variables = { lang = "ja" },
        javascript = {
          extends = "jsx",
        },
        html = {
          default_attributes = {
            option = { value = vim.null },
            textarea = {
              id = vim.null,
              name = vim.null,
              cols = 10,
              rows = 10,
            },
          },
          snippets = {
            ["!"] = "<!DOCTYPE html>\n"
              .. '<html lang="en">\n'
              .. "<head>\n"
              .. '\t<meta charset="${charset}">\n'
              .. '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">\n'
              .. '\t<meta http-equiv="X-UA-Compatible" content="ie=edge">\n'
              .. "\t<title></title>\n"
              .. "</head>\n"
              .. "<body>\n\t${child}|\n</body>\n"
              .. "</html>",
          },
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = { "InsertEnter", "CmdlineEnter" },
    -- commit = "b8c2a62b3bd3827aa059b43be3dd4b5c45037d65",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
      cmp.setup.filetype("java", {
        completion = {
          keyword_length = 2,
        },
      })
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<Esc>"] = cmp.mapping(function(fallback)
            require("luasnip").unlink_current()
            fallback()
          end),
        }),
        sources = cmp.config.sources({
          { name = "codeium" },
          { name = "nvim_lsp", keyword_length = 2 },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
            item.menu = ({
              codeium = "Codeium",
              nvim_lsp = item.kind,
              luasnip = "Snippet",
              buffer = "Buffer",
              path = "Path",
            })[entry.source.name]
            local icons = require("core.icons")
            if icons.kinds[item.kind] then
              item.kind = icons.kinds[item.kind]
            end
            if entry.source.name == "codeium" then
              item.kind = icons.misc.codeium
              item.kind_hl_group = "CmpItemKindVariable"
            end
            return item
          end,
        },
        experimental = { ghost_text = true },
        sorting = defaults.sorting,
      }
    end,
  },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter" },
    opts = {
      floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      hint_scheme = "Comment", -- highlight group for the virtual text
    },
  },

  {
    "LudoPinelli/comment-box.nvim",
    config = function()
      require("comment-box").setup({
        doc_width = 80, -- width of the document
        box_width = 65, -- width of the boxes
        borders = { -- symbols used to draw a box
          top = "─",
          bottom = "─",
          left = "│",
          right = "│",
          top_left = "╭",
          top_right = "╮",
          bottom_left = "╰",
          bottom_right = "╯",
        },
        line_width = 65, -- width of the lines
        line = { -- symbols used to draw a line
          line = "─",
          line_start = "─",
          line_end = "─",
        },
        outer_blank_lines = true, -- insert a blank line above and below the box
        inner_blank_lines = true, -- insert a blank line above and below the text
        line_blank_line_above = false, -- insert a blank line above the line
        line_blank_line_below = false, -- insert a blank line below the line
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      local status_ok, comment = pcall(require, "Comment")
      if not status_ok then
        vim.notify("Comment not found!")
        return
      end

      comment.setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    config = function()
      require("lspsaga").setup({})
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = {
          icon = " ",
          color = "warning",
          alt = { "WARNING", "XXX" },
        },
        PERF = {
          icon = " ",
          alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
        },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 1000, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
        warning = {
          "LspDiagnosticsDefaultWarning",
          "WarningMsg",
          "#FBBF24",
        },
        info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
        hint = { "LspDiagnosticsDefaultHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    },
  },
  {    "sQVe/sort.nvim",
    config = function()
        require("sort").setup()
    end,
},
}
