local present, packer = pcall(require, "packer")

if not present then
    return false
end

local use = packer.use

return packer.startup(
    function()
        use("wbthomason/packer.nvim")
        -- startup diagnostics
        use("lewis6991/impatient.nvim")
        use("nathom/filetype.nvim")
        use("nvim-lua/plenary.nvim")

        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        --                                 Note Taking                                --
        -- ------------------------------------------------- --
        use(
            {
                "vimwiki/vimwiki",
                config = function()
                    require("plugins.notes.vimwiki")
                end
            }
        )
        -- ------------------------------------------------- --
        use(
            {
                "kristijanhusak/orgmode.nvim",
                config = function()
                    require("plugins.notes.orgmode")
                end
            }
        )
        -- ------------------------------------------------- --
        use {
            "nvim-neorg/neorg",
            config = function()
                require("neorg").setup {
                    -- Tell Neorg what modules to load
                    load = {
                        ["core.defaults"] = {}, -- Load all the default modules
                        ["core.norg.concealer"] = {}, -- Allows for use of icons
                        ["core.norg.dirman"] = {
                            -- Manage your directories with Neorg
                            config = {
                                workspaces = {
                                    my_workspace = "~/Notes"
                                }
                            }
                        }
                    }
                }
            end,
            requires = "nvim-lua/plenary.nvim"
        }

        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        --                   User Interface                  --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------ landing page ----------------- --
        use(
            {
                "glepnir/dashboard-nvim",
                config = function()
                    require("plugins.dashboard")
                end
            }
        )
        -- --------------------- colors -------------------- --
        use("nekonako/xresources-nvim")

        use(
            {
                -- icons
                "kyazdani42/nvim-web-devicons",
                after = "xresources-nvim"
            }
        )
        -- ------------------------------------------------- --
        -- ------------------ theme stuff ------------------ --
        use(
            {
                -- statusline
                "NTBBloodbath/galaxyline.nvim",
                branch = "main",
                requires = {"kyazdani42/nvim-web-devicons", opt = true},
                config = function()
                    require("plugins.statusline")
                end,
                after = "nvim-web-devicons"
            }
        )
        -- ------------------------------------------------- --
        use(
            {
                "kdheepak/tabline.nvim",
                config = function()
                    require("plugins.statusline.tabline")
                end,
                requires = {{"hoob3rt/lualine.nvim"}, {"kyazdani42/nvim-web-devicons", opt = true}}
            }
        )

        -- ------------------------------------------------- --
        use(
            {
                "lukas-reineke/headlines.nvim",
                config = function()
                    require("headlines").setup()
                end
            }
        )
        -- ------------------------------------------------- --
        -- ----------------- file explorer ----------------- --
        use(
            {
                "kyazdani42/nvim-tree.lua",
                config = function()
                    require("plugins.file-explorer").init()
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
        -- ------------------------------------------------- --
        -- ----------------- Notifications ----------------- --
        use(
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup()
                end,
                after = "xresources-nvim"
            }
        )
        -- ------------------------------------------------- --
        use({"stevearc/dressing.nvim"})
        -- ------------------------------------------------- --
        use({"MunifTanjim/nui.nvim"})
        -- ------------------------------------------------- --
        -- ---------------- file navigation ---------------- --
        use(
            {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim",
                    "nvim-telescope/telescope-media-files.nvim",
                    "artart222/telescope_find_directories",
                    {
                        "nvim-telescope/telescope-fzf-native.nvim",
                        run = "make"
                    }
                },
                config = function()
                    require("plugins.navigation")
                end,
                -- event = 'BufRead'
                cmd = "Telescope"
            }
        )
        -- -------------------- whichkey ------------------- --
        use(
            {
                "folke/which-key.nvim",
                config = function()
                    require("plugins.statusline.whichkey")
                end
            }
        )
        -- --------------- Window Management --------------- --
        use(
            {
                "sindrets/winshift.nvim",
                config = function()
                    require("plugins.window.winshift")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- lsp
        use(
            {
                "williamboman/nvim-lsp-installer",
                requires = {
                    {"neovim/nvim-lspconfig"},
                    {"ray-x/lsp_signature.nvim"},
                    {"jose-elias-alvarez/nvim-lsp-ts-utils"},
                    {"b0o/SchemaStore.nvim"},
                    {
                        "jose-elias-alvarez/null-ls.nvim",
                        after = "nvim-lspconfig"
                    }
                },
                config = function()
                    require("lsp")
                end
            }
        )

        use({"nvim-lua/lsp-status.nvim"})
        use(
            {
                "RishabhRD/popfix",
                "RishabhRD/nvim-lsputils"
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ----------------- autocompletion ---------------- --
        use(
            {
                "hrsh7th/nvim-cmp",
                config = function()
                    require("lsp.autocomplete")
                end,
                requires = {
                    "hrsh7th/cmp-nvim-lsp",
                    "windwp/nvim-autopairs",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/nvim-cmp",
                    "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip",
                    "onsails/lspkind-nvim"
                }
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------ git commands ----------------- --
        use(
            {
                "tpope/vim-fugitive",
                opt = true,
                cmd = "Git"
            }
        )
        -- ------------------------------------------------- --
        -- ---------------- git column signs --------------- --
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
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- --------------- floating terminal --------------- --
        use(
            {
                "voldikss/vim-floaterm",
                opt = true,
                cmd = {"FloatermToggle", "FloatermNew", "FloatermSend"},
                config = function()
                    require("plugins.terminal")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- --------------- session management -------------- --
        -- use(
        --     {
        --         'rmagatti/auto-session',
        --         event = 'VimEnter',
        --         config = function()
        --             require('auto-session').setup(
        --                 {
        --                     pre_save_cmds = {'NvimTreeClose', 'cclose'}
        --                 }
        --             )
        --         end
        --     }
        -- )
        -- -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- --------------- lang/syntax stuff --------------- --
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
                    require("plugins.treesitter")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------ code actions ----------------- --
        use(
            {
                "weilbith/nvim-code-action-menu",
                cmd = "CodeActionMenu"
            }
        )
        -- ------------------------------------------------- --
        -- -------------- Syntax Highlighting -------------- --
        use({"sheerun/vim-polyglot"})
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- -------------------- Comments ------------------- --
        use(
            {
                "b3nj5m1n/kommentary",
                event = "BufRead",
                config = function()
                    require("plugins.formatting.comments")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ----------------- Comment Boxes ----------------- --
        use(
            {
                "s1n7ax/nvim-comment-frame",
                requires = {
                    {"nvim-treesitter"}
                },
                config = function()
                    require("plugins.formatting.comment-bars")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- -------------- colorized hex codes -------------- --
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
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------ clipboard normalization ------------ --
        use(
            {
                "AckslD/nvim-neoclip.lua",
                config = function()
                    require("neoclip").setup()
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- --------------- error highlighting -------------- --
        use(
            {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function()
                    require("plugins.treesitter.trouble")
                end
            }
        )
        -- ------------------------------------------------- --

        use("kosayoda/nvim-lightbulb")
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------ Sudo in vim ------------------ --
        use(
            {
                "lambdalisue/suda.vim",
                cmd = {"SudaRead", "SudaWrite"}
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------- Formatting ------------------ --
        use(
            {
                "mhartington/formatter.nvim",
                config = function()
                    require("plugins.formatting")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------- AI powered autocopletion and more ------- --
        use(
            {
                "github/copilot.vim"
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ----------------- Resize buffers ---------------- --
        use(
            {
                "camspiers/animate.vim"
            }
        )
        use(
            {
                "camspiers/lens.vim"
            }
        )
        use(
            {
                "kwkarlwang/bufresize.nvim",
                config = function()
                    require("bufresize").setup()
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- --------------- Makes Directories --------------- --
        use(
            {
                "jghauser/mkdir.nvim",
                config = function()
                    require("mkdir")
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- -------------------- MatchUp -------------------- --
        use {
            "andymass/vim-matchup",
            event = "BufRead"
        }
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ------------------------------------------------- --
        -- ----------------- spell checker ----------------- --
        use {
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup()
            end
        }
    end
)
