--       ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--       ┃                                                              ┃
--       ┃                        Editor Plugins                        ┃
--       ┃                                                              ┃
--       ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- NOTE: These are either additional features of the editor itself or somehow modify the editing experience

local Utils = require("utils")
local Icons = require("core").icons

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫

return {
  {
    "serenevoid/kiwi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      {
        name = "Work",
        path = "/Users/tlh/Dropbox/Wiki",
        -- TODO: Uncomment the below and comment out the above when using Linux again
        -- path = "/home/tlh/Wiki/",
      },
      {
        name = "SanatanaDharma",
        path = "Users/tlh/Dropbox/HinduismWiki",
        -- TODO: Uncomment the below and comment out the above when using Linux again
        --  path = "/home/tlh/HinduismWiki",
      },
    },
    keys = {
      {
        "<leader>wp",
        ':lua require("kiwi").open_wiki_index("Work")<cr>',
        desc = "Open index of Work-Related Wiki",
      },
      {
        "<leader>wh",
        ':lua require("kiwi").open_wiki_index("SanatanaDharma")<cr>',
        desc = "Open Sanatana Dharma Wiki index page",
      },
      { "<leader>t", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
    },
    lazy = true,
  },

  -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫

  {
    "RutaTang/quicknote.nvim",
    config = function()
      -- you must call setup to let quicknote.nvim works correctly
      require("quicknote").setup({
        mode = "portable", -- "portable" | "resident", default to "portable"
        sign = " ", -- This is used for the signs on the left side (refer to ShowNoteSigns() api).
        -- You can change it to whatever you want (eg. some nerd fonts icon), 'N' is default
        filetype = "md",
        git_branch_recognizable = false, -- If true, quicknote will separate notes by git branch
        -- But it should only be used with resident mode
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      window = {
        margin = { 1, 0, 2, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 0, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 5, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
      layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 100 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      defaults = {
        mode = { "n", "v" },
        ["<leader>g"] = { name = "+Git" },
        ["<leader>s"] = { name = "+Session" },
        ["<leader>c"] = { name = "+ChatGPT" },
        ["<leader>l"] = { name = "+LSP" },
        ["<leader>h"] = { name = "+Hunk" },
        ["<leader>w"] = { name = "Wiki" },
        ["g"] = { name = "+Goto" },
        ["s"] = { name = "+Search" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
      wk.register({
        C = {
          name = "Comment Box",
          t = { "<cmd>lua require('comment-box').ccbox(3)<cr>", "Title Box" },
          s = { "<cmd>lua require('comment-box').labox(17)<cr>", "Subtitle Box" },
        },

        x = {
          name = "Trouble",
          x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
          w = {
            "<cmd>TroubleToggle workspace_diagnostics <cr>",
            "Trouble Workspace Diagnostics",
          },
          d = {
            "<cmd>TroubleToggle document_diagnostics<cr>",
            "Trouble Document Diagnostics",
          },
          q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Quickfix" },
          l = { "<cmd>TroubleToggle loclist<cr>", "Trouble LOC List" },
          L = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP References" },
        },
        q = {
          name = "Quick Notes",
          c = {
            name = "Create Notes",
            c = {
              "<cmd>:lua require('quicknote').NewNoteAtCurrentLine()<cr>",
              "Create a New Note For the Current Line",
            },
            d = {
              "<cmd>:lua require('quicknote').NewNoteAtCWD()<cr>",
              "Create a New Note For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').NewNoteAtGlobal()<cr>", "Create a New Globally Scoped Note" },
          },
          o = {
            name = "Open Notes",
            c = { "<cmd>:lua require('quicknote').OpenNoteAtCurrentLine()<cr>", "Open a New Globally Scoped Note" },
            d = {
              "<cmd>:lua require('quicknote').OpenNoteAtCWD()<cr>",
              "Open a New Note For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').OpenNoteAtGlobal()<cr>", "Open a New Globally Scoped Note" },
          },
          d = {
            name = "Delete Notes",
            c = {
              "<cmd>:lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
              "Delete the Note Specific to the Current Line",
            },
            d = {
              "<cmd>:lua require('quicknote').DeleteNoteAtCWD()<cr>",
              "Delete the Note For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').DeleteNoteAtGlobal()<cr>", "Delete a Globally Scoped Note" },
          },
          l = {
            name = "List Notes",
            c = {
              "<cmd>:lua require('quicknote').ListNotesForCurrentBuffer()<cr>",
              "List the Notes Specific to the Current Buffer",
            },
            d = {
              "<cmd>:lua require('quicknote').ListNotesForCWD()<cr>",
              "List the Notes For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').ListNotesForGlobal()<cr>", "List the Globally Scoped Notes" },
          },
          j = {
            name = "Jump to Notes",
            j = {
              "<cmd>:lua require('quicknote').JumpToPreviousNote()<cr>",
              "jump to previous avaiable note in current buffer",
            },
            k = {
              "<cmd>:lua require('quicknote').JumpToNextNote()<cr>",
              "jump to next avaiable note in current buffer",
            },
          },
          g = {
            name = "Get Notes",
            c = {
              "<cmd>:lua require('quicknote').GetNotesForCurrentBuffer()<cr>",
              "Get the Notes Specific to the Current Buffer",
            },
            d = {
              "<cmd>:lua require('quicknote').GetNotesForCWD()<cr>",
              "Get the Notes For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').GetNotesForGlobal()<cr>", "Get the Globally Scoped Notes" },
          },
          s = {
            name = "Note Signs",
            s = { "<cmd>:lua require('quicknote').ShowNoteSigns()", "Show Note Signs" },
            h = { "<cmd>:lua require('quicknote').HideNoteSigns()", "Hide Note Signs" },
            t = { "<cmd>:lua require('quicknote').ToggleNoteSigns()", "Toggle Note Signs" },
          },
          e = {
            name = "Export Notes",
            c = {
              "<cmd>:lua require('quicknote').ExportNotesForCurrentBuffer()<cr>",
              "Export the Notes Specific to the Current Buffer",
            },
            d = {
              "<cmd>:lua require('quicknote').ExportNotesForCWD()<cr>",
              "Export the Notes For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').ExportNotesForGlobal()<cr>", "Export the Globally Scoped Notes" },
          },
          i = {
            name = "Import Notes",
            c = {
              "<cmd>:lua require('quicknote').ImportNotesForCurrentBuffer()<cr>",
              "Import the Notes Specific to the Current Buffer",
            },
            d = {
              "<cmd>:lua require('quicknote').ImportNotesForCWD()<cr>",
              "Import the Notes For the Current Working Directory",
            },
            g = { "<cmd>:lua require('quicknote').ImportNotesForGlobal()<cr>", "Import the Globally Scoped Notes" },
          },
          m = {
            name = "Switch Quicknote Mode",
            t = { "<cmd>:lua require('quicknote').ToggleMode()", "Toggle Mode" },
            p = { "<cmd>:lua require('quicknote').SwitchToPortableMode()", "Switch to Portable Mode" },
            r = { "<cmd>:lua require('quicknote').SwitchToResidentMode()", "Switch to Resident Mode" },
          },
        },
      }, { prefix = "<leader>", mode = { "n", "v" }, opts })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = "mrbjarksen/neo-tree-diagnostics.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "left", dir = Utils.root() })
        end,
        desc = "Explorer (root dir)",
        remap = true,
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            position = "float",
            dir = Utils.root(),
          })
        end,
        desc = "Explorer Float (root dir)",
      },
    },
    opts = require("features.neo-tree"),
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          ---@diagnostic disable-next-line: different-requires
          require("neo-tree")
          vim.cmd([[set showtabline=0]])
        end
      end
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = Icons.gitsigns.add },
        change = { text = Icons.gitsigns.change },
        delete = { text = Icons.gitsigns.delete },
        topdelhfe = { text = Icons.gitsigns.topdelete },
        changedelete = { text = Icons.gitsigns.changedelete },
        untracked = { text = Icons.gitsigns.untracked },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = Utils.ui.borderchars("thick", "tl-t-tr-r-br-b-bl-l"), -- [ top top top - right - bottom bottom bottom - left ]
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = Utils.safe_keymap_set

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Next git hunk" })
        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { buffer = bufnr, expr = true, desc = "Previous git hunk" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage current hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset current hunk" })
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage visual selection" })
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset visual selection" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage entire buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo last hunk staging" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset entire buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview current hunk changes" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Show blame for current line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame for current line" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff current hunk" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Diff all changes in the file" })
      end,
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    opts = function()
      local monokai_opts = Utils.plugin.opts("monokai-pro.nvim")
      local is_telescope_bg_clear = vim.tbl_contains(monokai_opts.background_clear or {}, "telescope")
      local opts = {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "   ",
          borderchars = is_telescope_bg_clear and Utils.ui.borderchars("rounded")
            or {
              prompt = Utils.ui.borderchars("thick", nil, {
                top = "▄",
                top_left = "▄",
                left = "█",
                right = " ",
                top_right = " ",
                bottom_right = " ",
              }),
              results = Utils.ui.borderchars(
                "thick",
                nil,
                { top = "█", top_left = "█", right = " ", top_right = " ", bottom_right = " " }
              ),
              preview = Utils.ui.borderchars("thick", nil, { top = "▄", top_left = "▄", top_right = "▄" }),
            },
          dynamic_preview_title = true,
          hl_result_eol = true,
          sorting_strategy = "ascending",
          results_title = "", -- Remove `Results` title
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.8,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
          },
        },
      }
      return opts
    end,
    keys = {
      -- goto
      { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
      { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
      -- search
      { "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
      -- Git
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
      -- Find
      { "<leader>f", Utils.telescope("find_files"), desc = "Find files" },
      { "<leader>F", Utils.telescope("live_grep"), desc = "Find Text" },
      { "<leader>b", Utils.telescope("buffers"), desc = "Find buffer" },
    },
  },

  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = {
      { "<leader>D", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
      { "<C-w>", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
    },
  },

  -- TODO: Remove this when upgrading Neovim to version >= 0.10.0.
  -- references
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "neo-tree",
        "alpha",
        "NvimTree",
        "neo-tree",
        "dashboard",
        "TelescopePrompt",
        "TelescopeResult",
        "DressingInput",
        "neo-tree-popup",
        "markdown",
        "",
      },
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}
