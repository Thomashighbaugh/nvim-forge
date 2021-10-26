local present, packer = pcall(require, "config.packer")

if not present then
  return false
end

local use = packer.use

return packer.startup(
  function()
    use("wbthomason/packer.nvim")

    use(
      {
        "lewis6991/impatient.nvim",
        config = function()
          require("impatient")
        end
      }
    )
    -- Note Taking
    use {
      "vimwiki/vimwiki",
      config = function()
        require "config.core.notes.vimwiki"
      end
    }
    use {
      "wincent/corpus",
      config = function()
        require "config.core.notes.corpus"
      end
    }
    use {
      "kristijanhusak/orgmode.nvim",
      config = function()
        require("orgmode").setup(
          {
            org_agenda_files = {"~/Notes/org/*", "~/my-orgs/**/*"},
            org_default_notes_file = "~/Notes/refile.org"
          }
        )
      end
    }
    -- colors
    use "nekonako/xresources-nvim"

    use(
      {
        -- icons
        "kyazdani42/nvim-web-devicons",
        after = "xresources-nvim"
      }
    )

    -- theme stuff
    use(
      {
        -- statusline
        "NTBBloodbath/galaxyline.nvim",
        branch = "main",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
          require("config.core.statusline")
        end,
        after = "nvim-web-devicons"
      }
    )
    use {
      "kdheepak/tabline.nvim",
      config = function()
        require("config.core.statusline.tabline")
      end,
      requires = {{"hoob3rt/lualine.nvim"}, {"kyazdani42/nvim-web-devicons", opt = true}}
    }

    -- file explorer
    use(
      {
        "kyazdani42/nvim-tree.lua",
        config = function()
          require("config.core.file-explorer").init()
        end,
        opt = true,
        cmd = {
          "NvimTreeClipboard",
          "NvimTreeClose",
          "NvimTreeFindFile",
          "NvimTreeOpen",
          "NvimTreeRefresh",
          "NvimTreeToggle"
        }
      }
    )

    use(
      {
        -- lsp
        "williamboman/nvim-lsp-installer",
        requires = {
          "neovim/nvim-lspconfig",
          "ray-x/lsp_signature.nvim",
          "jose-elias-alvarez/nvim-lsp-ts-utils"
        },
        config = function()
          require("config.lsp")
        end
      }
    )

    use {"nvim-lua/lsp-status.nvim"}
    use {
      "RishabhRD/popfix",
      "RishabhRD/nvim-lsputils"
    }

    -- autocompletion
    use(
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require("config.lsp.autocomplete")
        end,
        requires = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/nvim-cmp",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
          "windwp/nvim-autopairs",
          "onsails/lspkind-nvim"
        }
      }
    )

    -- git commands
    use(
      {
        "tpope/vim-fugitive",
        opt = true,
        cmd = "Git"
      }
    )

    -- git column signs
    use(
      {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        event = "BufRead",
        config = function()
          require("gitsigns").setup()
        end
      }
    )

    -- floating terminal
    use(
      {
        "voldikss/vim-floaterm",
        opt = true,
        cmd = {"FloatermToggle", "FloatermNew", "FloatermSend"},
        config = function()
          require("config.core.terminal")
        end
      }
    )

    -- file navigation
    use(
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
          {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
          }
        },
        config = function()
          require("config.core.navigation")
        end,
        event = "BufRead"
      }
    )

    -- session management
    use(
      {
        "rmagatti/auto-session",
        event = "VimEnter",
        config = function()
          require("auto-session").setup(
            {
              pre_save_cmds = {"NvimTreeClose", "cclose"}
            }
          )
        end
      }
    )

    -- lang/syntax stuff
    use(
      {
        "nvim-treesitter/nvim-treesitter",
        requires = {
          "windwp/nvim-ts-autotag",
          "JoosepAlviste/nvim-ts-context-commentstring",
          "nvim-treesitter/nvim-treesitter-refactor"
        },
        run = ":TSUpdate",
        config = function()
          require("config.core.treesitter")
        end
      }
    )
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu"
    }
    use {"sheerun/vim-polyglot"}
    -- comments and stuff
    use(
      {
        "b3nj5m1n/kommentary",
        event = "BufRead"
      }
    )

    -- colorized hex codes
    use(
      {
        "norcalli/nvim-colorizer.lua",
        opt = true,
        cmd = {"ColorizerToggle"},
        config = function()
          require("colorizer").setup()
        end
      }
    )
    -- clipboard normalization
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end
    }
    -- startup diagnostics
    use {
      "tweekmonster/startuptime.vim"
    }
    -- error highlighting
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("config.core.treesitter.trouble")
      end
    }
    use "kosayoda/nvim-lightbulb"
    -- Sudo in vim
    use {
      "lambdalisue/suda.vim",
      cmd = {"SudaRead", "SudaWrite"}
    }
    --whichkey
    use {
      "folke/which-key.nvim",
      config = function()
        require "config.core.statusline.whichkey"
      end
    }
  end
)
