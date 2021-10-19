-- TODO organize this again its all outta whack
local present, _ = pcall(require, "plugins.packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {
            "wbthomason/packer.nvim",
            event = "VimEnter"
        }
        -- Note Taking
        use {
            "vimwiki/vimwiki",
            config = function()
                require "plugins.configs.vimwiki"
            end
        }
        use {
            "mnowotnik/noteflow.nvim",
            run = "bash build.sh",
            config = function()
                require "plugins.configs.noteflow"
            end
        }
        use {
            "wincent/corpus",
            config = function()
                require "plugins.configs.corpus"
            end
        }
        use {
            "ishchow/nvim-deardiary",
            config = function()
                require "plugins.configs.deardiary"
            end
        }

        use {
            "stevearc/qf_helper.nvim",
            config = function()
                require("plugins.configs.qfhelper")
            end
        }

        -- Tabline
        use {
            "kdheepak/tabline.nvim",
            config = function()
                require("plugins.configs.tabline")
            end,
            requires = {{"hoob3rt/lualine.nvim"}, {"kyazdani42/nvim-web-devicons", opt = true}}
        }

        use {
            "glepnir/galaxyline.nvim",
            config = function()
                require "plugins.configs.statusline"
            end
        }
        use "nekonako/xresources-nvim"
        use {
            "ThePrimeagen/refactoring.nvim",
            config = function()
                require "plugins.configs.refactoring"
            end
        }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.configs.trouble")
            end
        }
        -- color related stuff
        use {
            "siduck76/nvim-base16.lua",
            after = "packer.nvim",
            config = function()
                require "colors.theme"
            end
        }

        -- language related plugins
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require "plugins.configs.treesitter"
            end
        }

        use {
            "kabouzeid/nvim-lspinstall",
            config = function()
                require "plugins.configs.lspconfig"
            end
        }
        use {
            "folke/which-key.nvim",
            config = function()
                require "plugins.configs.whichkey"
            end
        }

        use {
            "neovim/nvim-lspconfig",
            config = function()
                require "plugins.configs.lspconfig"
            end
        }

        use {
            "onsails/lspkind-nvim",
            config = function()
                require("plugins.configs.others").lspkind()
            end
        }
        use {"ray-x/lsp_signature.nvim", module = "lsp_signature"}

        -- load compe in insert mode only

        use "rafamadriz/friendly-snippets"
        use {
            "hrsh7th/nvim-cmp", --- Autocompletion
            config = function()
                require("plugins.configs.cmp")
            end
        }
        use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
        use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
        use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
        use {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"}
        use {"hrsh7th/cmp-calc", after = "nvim-cmp"}
        use {"hrsh7th/cmp-path", after = "nvim-cmp"}
        use {"L3MON4D3/LuaSnip"}

        use {"voldikss/vim-floaterm"} --- Terminal
        use {"vim-scripts/genutils"} --- general utilities
        use {"godlygeek/tabular"} --- tabbing

        use {"mfussenegger/nvim-dap"} --- debugging
        use {"qpkorr/vim-bufkill"} --- kill buffers properly
        use {
            "lukas-reineke/format.nvim",
            cmd = "FormatWrite",
            config = function()
                require "plugins.configs.format"
            end
        }

        use {
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.configs.icons"
            end
        }

        use {
            "nvim-lua/plenary.nvim"
        }
        use {
            "nvim-lua/popup.nvim"
        }

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = function()
                require "plugins.configs.telescope"
            end,
            module = "telescope"
        }
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
        }
        use {
            "nvim-telescope/telescope-media-files.nvim"
        }

        use {
            "nvim-telescope/telescope-packer.nvim",
            cmd = "Telescope"
        }
        use {
            "mfussenegger/nvim-lint",
            config = function()
                require("plugins.configs.linter")
            end,
            module = "lint"
        }
        use {"tami5/sqlite.lua", module = "sqlite"}
        use {
            "AckslD/nvim-neoclip.lua",
            config = function()
                require("neoclip").setup()
            end
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            config = function()
                require "plugins.configs.autopairs"
            end
        }

        use {
            "andymass/vim-matchup"
        }

        use {
            "terrortylor/nvim-comment",
            config = function()
                require("plugins.configs.others").comment()
            end
        }

        use {
            "tweekmonster/startuptime.vim"
        }

        use "kosayoda/nvim-lightbulb"
        -- smooth scroll
        use {
            "karb94/neoscroll.nvim",
            config = function()
                require("plugins.configs.others").neoscroll()
            end
        }

        use "alvan/vim-closetag" -- for html autoclosing tag

        use {
            "lukas-reineke/indent-blankline.nvim",
            setup = function()
                require("plugins.configs.others").blankline()
            end
        }
        use(
            {
                "kdheepak/lazygit.nvim",
                cmd = {"LazyGit", "LazyGitConfig"},
                keys = "<leader>gg"
            }
        )
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins.configs.gitsigns")
            end,
            module = "gitsigns",
            keys = "<space>g"
        }
        use {
            "lambdalisue/suda.vim",
            cmd = {"SudaRead", "SudaWrite"}
        }
        use {
            "rinx/nvim-minimap",
            cmd = {
                "Minimap",
                "MinimapClose",
                "MinimapToggle",
                "MinimapRefresh",
                "MinimapUpdateHighlight"
            }
        }
        -- Terminal

        use {
            "akinsho/nvim-toggleterm.lua",
            config = function()
                require("plugins.configs.toggleterm")
            end,
            module = {"toggleterm", "toggleterm.terminal"},
            cmd = {"ToggleTerm", "TermExec"},
            keys = {"n", "<space>t"}
        }

        use {
            "kristijanhusak/orgmode.nvim",
            config = function()
                require("orgmode").setup {}
            end
        }
        use {
            "williamboman/nvim-lsp-installer"
        }
        use {"nvim-lua/lsp-status.nvim"}
        use {
            "RishabhRD/popfix",
            "RishabhRD/nvim-lsputils"
        }
        use {
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu"
        }
        -- }}}
        use {"RRethy/nvim-treesitter-textsubjects"}
        use {"nvim-treesitter/nvim-treesitter-textobjects"}
        use {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle"}
        use {"p00f/nvim-ts-rainbow"}
        --- }}}
        --- [[ Languages ]]
        use {"sheerun/vim-polyglot"}
        use {"rust-lang/rust.vim"} --- rust!
        use {"arzg/vim-rust-syntax-ext"} --- rust: syntax extension
        use {"simrat39/rust-tools.nvim"} --- rust: loads of tools
        -- use { 'plasticboy/vim-markdown' }  --- markdown

        use {
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require "plugins.configs.nvimtree"
            end
        }
        -- [[ Make it pretty ]]

        use {"xiyaowong/nvim-transparent"} --- transparency

        -- finder
        use {"unblevable/quick-scope"} --- horizonal movement

        -- [[ Miscellaneous ]]
        use {"stevearc/aerial.nvim"}
        use {
            "glepnir/dashboard-nvim",
            config = function()
                require("plugins.configs.dashboard")
            end
        } --- Start Screen
        use {
            "jghauser/mkdir.nvim", --- Make directory
            config = function()
                require("mkdir")
            end,
            event = "BufWritePre"
        }
    end
)
