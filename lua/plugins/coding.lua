--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏                       Coding Resources                        ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

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
  --╞═══════════════════════════════════════════════════════════════╡
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/cmp-luasnip-choice",
    },

    config = function()
      local ls = require("luasnip")
      local vsc = require("luasnip.loaders.from_vscode")
      local lua = require("luasnip.loaders.from_lua")

      snip_env = {
        s = require("luasnip.nodes.snippet").S,
        sn = require("luasnip.nodes.snippet").SN,
        t = require("luasnip.nodes.textNode").T,
        f = require("luasnip.nodes.functionNode").F,
        i = require("luasnip.nodes.insertNode").I,
        c = require("luasnip.nodes.choiceNode").C,
        d = require("luasnip.nodes.dynamicNode").D,
        r = require("luasnip.nodes.restoreNode").R,
        l = require("luasnip.extras").lambda,
        rep = require("luasnip.extras").rep,
        p = require("luasnip.extras").partial,
        m = require("luasnip.extras").match,
        n = require("luasnip.extras").nonempty,
        dl = require("luasnip.extras").dynamic_lambda,
        fmt = require("luasnip.extras.fmt").fmt,
        fmta = require("luasnip.extras.fmt").fmta,
        conds = require("luasnip.extras.expand_conditions"),
        types = require("luasnip.util.types"),
        events = require("luasnip.util.events"),
        parse = require("luasnip.util.parser").parse_snippet,
        ai = require("luasnip.nodes.absolute_indexer"),
      }

      ls.config.set_config({ history = true, updateevents = "TextChanged" })

      -- load friendly-snippets
      vsc.lazy_load()

      vsc.lazy_load({
        paths = os.getenv("HOME") .. "/.config/nvim/snippets/vscode/",
      })
      -- load lua snippets
      lua.load({ paths = os.getenv("HOME") .. "/.config/nvim/snippets/" })

      -- expansion key
      -- this will expand the current item or jump to the next item within the snippet.
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      -- jump backwards key.
      -- this always moves to the previous item within the snippet
      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- selecting within a list of options.
      vim.keymap.set("i", "<c-h>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },
  -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  --  ╞═══════════════════════════════════════════════════════════════╡
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
  --  ╞═══════════════════════════════════════════════════════════════╡
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "David-Kunz/cmp-npm",
      "L3MON4D3/LuaSnip",
      "L3MON4D3/cmp-luasnip-choice",
      "davidsierradz/cmp-conventionalcommits",
      "dmitmel/cmp-cmdline-history",
      "doxnit/cmp-luasnip-choice",
      "garyhurtz/cmp_kitty",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "mfussenegger/nvim-jdtls",
      "petertriho/cmp-git",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "tamago324/cmp-zsh",
      "onsails/lspkind-nvim",
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {},
      },
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          require("util").on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            with_text = false,
            maxwidth = 50,
            mode = "symbol",
            menu = {
              buffer = "BUF",
              rg = "RG",
              nvim_lsp = "LSP",
              path = "PATH",
              luasnip = "SNIP",
              calc = "CALC",
            },
          }),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "calc" },
          { name = "crates" },
          { name = "treesitter" },
          { name = "cmdline" },
          { name = "cmdline-history" },
          { name = "zsh" },
          {
            name = "copilot",
            group_index = 1,
            priority = 100,
          },
          {
            name = "dictionary",
            keyword_length = 2,
          },
          { name = "luasnip-choice" },
          {
            name = "codeium",
            group_index = 1,
            priority = 100,
          },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },

          { name = "luasnip" },
          { name = "calc" },
          { name = "path" },
          { name = "buffer", keyword_length = 5 },
          { name = "treesitter" },
          { name = "cmdline" },
          { name = "cmdline-history" },
          { name = "zsh" },
          { name = "crates" },
        }),
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },

  --  ╞═══════════════════════════════════════════════════════════════╡
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  --  ╞═══════════════════════════════════════════════════════════════╡
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
  --  ╞═══════════════════════════════════════════════════════════════╡
  {
    "ray-x/lsp_signature.nvim",
    event = { "InsertEnter" },
    opts = {
      floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      hint_scheme = "Comment", -- highlight group for the virtual text
    },
  },
  --  ╞═══════════════════════════════════════════════════════════════╡
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
  --  ╞═══════════════════════════════════════════════════════════════╡
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
  --╞═══════════════════════════════════════════════════════════════╡
  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    config = function()
      require("lspsaga").setup({})
    end,
  },
  --╞═══════════════════════════════════════════════════════════════╡
  -- Highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    event = { "BufRead", "BufEnter" },
    dependencies = "nvim-telescope/telescope.nvim",
		-- stylua: ignore
		keys = {
			{ ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
			{ '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
			{ '<leader>Tt', '<cmd>TodoTrouble<CR>', desc = 'Todo (Trouble)' },
			{ '<leader>TT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
			{ '<leader>Tt', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
			{ '<leader>TT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
		},
    opts = { signs = false },
  },

  --╞═══════════════════════════════════════════════════════════════╡
  {
    "sQVe/sort.nvim",
    config = function()
      require("sort").setup()
    end,
  },
  -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
}
