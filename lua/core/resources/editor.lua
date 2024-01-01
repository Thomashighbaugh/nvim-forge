local Util = require("util")
local Icons = require("core.icons")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = "mrbjarksen/neo-tree-diagnostics.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "left", dir = require("util").get_root() })
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
            dir = Util.get_root(),
          })
        end,
        desc = "Explorer Float (root dir)",
      },
    },
    opts = require("config.neo-tree"),
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
  --╞═══════════════════════════════════════════════════════════════╡
  -- {"github/copilot.vim"},

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    lazy = true,

    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "top", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<C-M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = true,
          svn = true,
          hgcommit = true,
          cvs = true,
          ["."] = true,
          ["*"] = true,
        },
      })
    end,
  },
  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({})
  --   end,
  -- },
  {
    "serenevoid/kiwi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      {
        name = "Tech",
        path = "/home/tlh/DB/Wiki/",
      },
      {
        name = "SanatanaDharma",
        path = "/home/tlh/DB/HinduismWiki",
      },
    },
    keys = {
      {
        "<leader>wp",
        ':lua require("kiwi").open_wiki_index("Tech")<cr>',
        desc = "Open index of personal wiki",
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
        -- But it should only be used with residen
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "0.1.4", -- telescope did only one release, so use HEAD for now
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        borderchars = {
          prompt = Util.generate_borderchars(
            "thick",
            nil,
            { top = "█", top_left = "█", left = "█", right = " ", top_right = " ", bottom_right = " " }
          ),
          results = Util.generate_borderchars(
            "thick",
            nil,
            { top = "█", top_left = "█", right = " ", top_right = " ", bottom_right = " " }
          ),
          preview = Util.generate_borderchars("thick", nil, { top = "█", top_left = "█", top_right = "█" }),
        },
        dynamic_preview_title = true,
        hl_result_eol = true,
        sorting_strategy = "ascending",
        file_ignore_patterns = {
          ".git/",
          "target/",
          "docs/",
          "vendor/*",
          "%.lock",
          "__pycache__/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          -- "%.jpg",
          -- "%.jpeg",
          -- "%.png",
          "%.svg",
          "%.otf",
          "%.ttf",
          "%.webp",
          ".dart_tool/",
          ".github/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "gradle/",
          "node_modules/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.ico",
          "%.pdf",
          "%.dylib",
          "%.jar",
          "%.docx",
          "%.met",
          "smalljre_*/*",
          ".vale/",
          "%.burp",
          "%.mp4",
          "%.mkv",
          "%.rar",
          "%.zip",
          "%.7z",
          "%.tar",
          "%.bz2",
          "%.epub",
          "%.flac",
          "%.tar.gz",
        },
        results_title = "",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
    keys = {
      -- goto
      { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
      { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
      -- search
      { "Sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "Sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "Sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "SM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "Sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "SR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "Sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "SC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "SH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },

      -- Find
      { "<leader>f", Util.telescope("find_files"), desc = "Find files" },
      { "<leader>F", Util.telescope("live_grep"), desc = "Find Text" },
      { "<leader>b", Util.telescope("buffers"), desc = "Find buffer" },
    },
    -- config = function() require("config.telescope") end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "kdheepak/lazygit.nvim",
    },
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },

        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        }, -- This fix mapping for fold when press f and nothing show up
      },
      window = {
        margin = { 1, 0, 2, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 0, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 15, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        border = "double",
        position = "bottom",
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 5, max = 50 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        ["<leader>h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
        ["<leader><Tab>"] = { "<c-6>", "Navigate previous buffer" },
        ["g"] = { name = "Goto" },
        ["<leader>l"] = { name = "+LSP" },
        ["<leader>w"] = { name = "Wiki" },
      }
      wk.register(keymaps)
      wk.register({
        C = {
          name = "Comment Box",
          b = { "<cmd>Bllbox5<cr>", "left aligned fixed size box" },
          r = { "<cmd>CBrrbox5<cr>", "right aligned fixed size box with left aligned text" },
          c = { "<cmd>CBccbox5<cr>", "center aligned fixed size box with center aligned text" },
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
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = Icons.gitsigns.add },
        change = { text = Icons.gitsigns.change },
        delete = { text = Icons.gitsigns.delete },
        topdelhfe = { text = Icons.gitsigns.topdelhfe },
        changedelete = { text = Icons.gitsigns.changedelete },
        untracked = { text = Icons.gitsigns.untracked },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      preview_config = {
        border = Util.generate_borderchars("thick", "tl-t-tr-r-bl-b-br-l"), -- [ top top top - right - bottom bottom bottom - left ]
      },
    },
    keys = {},
  },

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

  {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = false,
        ft_ignore = { "neo-tree" },
        segments = {
          {
            -- line number
            text = { " ", builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { "%s" }, click = "v:lua.ScSa" }, -- Sign
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }, -- Fold
        },
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          if vim.bo.filetype == "neo-tree" then
            vim.opt_local.statuscolumn = ""
          end
        end,
      })
    end,
  },
}
