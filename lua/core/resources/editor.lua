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

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
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
      -- Git
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
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
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 10, -- how many suggestions should be shown in the list?
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
        winblend = 5, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        border = "shadow",
        position = "bottom",
      },
      layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 5, max = 50 }, -- min and max width of the columns
        spacing = 10, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        ["<leader>w"] = { "<cmd>w!<CR>", "Save" },
        ["<leader>q"] = { "<cmd>q<CR>", "Quit" },
        ["<leader>Q"] = { "<cmd>qa<CR>", "Quit All" },
        ["<leader>h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
        ["<leader><Tab>"] = { "<c-6>", "Navigate previous buffer" },
        ["<leader>l"] = { name = "+LSP" },
        ["f"] = { name = "Fold" },
        ["g"] = { name = "Goto" },
        ["s"] = { name = "Search" },
      }
      wk.register(keymaps)
      wk.register({
        sa = "Add surrounding",
        sd = "Delete surrounding",
        sh = "Highlight surrounding",
        sn = "Surround update n lines",
        sr = "Replace surrounding",
        sF = "Find left surrounding",
        sf = "Replace right surrounding",
      })
      wk.register({
        l = {
          name = "+LSP",
          a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
          d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
          w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
          h = { "<cmd>vim.lsp.inlay_hint(0, nil)<cr>", "Toggle inlay hints" },
          i = { "<cmd>LspInfo<cr>", "Info" },
          I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
          j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
          k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
          l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
          q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
          r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
          S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        },
        a = {
          name = "Git",
          g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
          j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "prev hunk" },
          l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "blame" },
          p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "preview hunk" },
          r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "reset hunk" },
          R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "reset buffer" },
          s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "stage hunk" },
          u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "undo stage hunk" },
          d = { "<cmd>gitsigns diffthis head<cr>", "diff" },
        },
        s = {
          name = "+Session",
          s = { "<cmd>lua require('persistence').load()<cr>", "Restore Session" },
          l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore Last Session" },
          d = { "<cmd>lua require('persistence;).stop()<cr>", "Don't Save Current Session" },
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
