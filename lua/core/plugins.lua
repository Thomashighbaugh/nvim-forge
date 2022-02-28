---@diagnostic disable: different-requires
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return require("packer").startup(
    function(use)
        use("wbthomason/packer.nvim")
        -- startup diagnostics
        use("lewis6991/impatient.nvim")
        use("nathom/filetype.nvim")
        use("nvim-lua/plenary.nvim")

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
            "akinsho/org-bullets.nvim",
            config = function()
                require("org-bullets").setup {
                    symbols = function(default_list)
                        table.insert(default_list, "♥")
                        return default_list
                    end
                }
            end
        }

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
        -- ------------------------------------------------- --
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
        use ({
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
})
     -- -- ------------------------------------------------- --
     -- use(
     --     {
     --         "kdheepak/tabline.nvim",
     --         config = function()
     --             require("plugins.statusline.tabline")
     --         end,
     --         requires = {{"hoob3rt/lualine.nvim"}, {"kyazdani42/nvim-web-devicons", opt = true}}
     --     }
     -- )

     -- -- ------------------------------------------------- --
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
        -- ------------------ Indent Lines ----------------- --
        use({"lukas-reineke/indent-blankline.nvim"})
        -- ------------------------------------------------- --
        -- -------------- Increment Decrement -------------- --
        use(
            {
                "zegervdv/nrpattern.nvim",
                config = function()
                    -- Basic setup
                    -- See below for more options
                    require "nrpattern".setup()
                end
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
                    "nvim-telescope/telescope-frecency.nvim",
                    "nvim-telescope/telescope-symbols.nvim",
                    "nvim-telescope/telescope-file-browser.nvim",
                    "nvim-telescope/telescope-hop.nvim",
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
        -- ------------------------------------------------- --
        -- -------------------- whichkey ------------------- --
        use(
            {
                "folke/which-key.nvim",
                config = function()
                    require("plugins.statusline.whichkey")
                end
            }
        )
        -- ------------------------------------------------- --
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
        -- ------------------ editorconfig ----------------- --
        use({"gpanders/editorconfig.nvim"})
        -- ------------------------------------------------- --
        -- ---------------------- lsp ---------------------- --
        use(
            {
                "williamboman/nvim-lsp-installer",
                requires = {
                    {"onsails/lspkind-nvim"},
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
        -- ------------------------------------------------- --
        use(
            {
                "j-hui/fidget.nvim",
                config = function()
                    require("fidget").setup(
                        {
                            text = {spinner = "bouncing_bar"}
                        }
                    )
                end
            }
        )
        -- ------------------------------------------------- --
        use({"nvim-lua/lsp-status.nvim"})
        use(
            {
                "RishabhRD/popfix",
                "RishabhRD/nvim-lsputils"
            }
        )
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
                    "petertriho/cmp-git",
                    "hrsh7th/cmp-calc",
                    "ray-x/cmp-treesitter",
                    "lukas-reineke/cmp-rg",
                    "hrsh7th/cmp-copilot",
                    "hrsh7th/cmp-cmdline",
                    "hrsh7th/cmp-nvim-lsp-signature-help",
                    "windwp/nvim-autopairs",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/nvim-cmp",
                    "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip",
                    "rafamadriz/friendly-snippets"
                }
            }
        )
        -- ------------------------------------------------- --
        use(
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("plugins.formatting.auto-pairs")
                end,
                after = "nvim-cmp"
            }
        )
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
        -- ------------------------------------------------- --
        -- -------------------- Projects ------------------- --
        use(
            {
                "ahmedkhalf/project.nvim",
                config = function()
                    require("plugins.project")
                end
            }
        )

        -- ------------------------------------------------- --
        --                 lang/syntax stuff                 --
        -- ------------------------------------------------- --
        use(
            {
                "nvim-treesitter/nvim-treesitter",
                requires = {
                    {"nvim-treesitter/nvim-treesitter-textobjects", event = "BufRead"},
                    "RRethy/nvim-treesitter-textsubjects",
                    "nvim-treesitter/playground",
                    "RRethy/nvim-treesitter-endwise",
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
        use({"p00f/nvim-ts-rainbow"})
        -- ------------------------------------------------- --
        use({"TornaxO7/tree-setter"})
        -- ------------------------------------------------- --
        use(
            {
                "yioneko/nvim-yati",
                requires = "nvim-treesitter/nvim-treesitter",
                config = function()
                    require("nvim-treesitter.configs").setup(
                        {
                            yati = {enable = true}
                        }
                    )
                end
            }
        )
        -- ------------------------------------------------- --
        -- ------------------ Refactoring ------------------ --
        use(
            {
                "ThePrimeagen/refactoring.nvim",
                requires = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"},
                event = "BufRead",
                config = function()
                    require("refactoring").setup({})
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
        -- ------------------- Quick Fix ------------------- --
        use(
            {
                "stefandtw/quickfix-reflector.vim",
                config = function()
                    vim.g.qf_write_changes = 0
                end
            }
        )

        -- ------------------------------------------------- --
        -- -------------- Syntax Highlighting -------------- --
        use({"sheerun/vim-polyglot"})
        -- ------------------------------------------------- --
        -- -------------------- Tab Out -------------------- --
        use(
            {
                "abecodes/tabout.nvim",
                config = function()
                    require("plugins.formatting.tabout")
                end,
                wants = {"nvim-treesitter"}, -- or require if not used so far
                after = {"nvim-cmp"} -- if a completion plugin is using tabs load it before
            }
        )
        -- ------------------------------------------------- --
        -- -------------------- Comments ------------------- --
        use(
            {
                "numToStr/Comment.nvim",
                event = "BufWinEnter",
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
        -- ---------------- to do highlights --------------- --
        use(
            {
                "folke/todo-comments.nvim",
                requires = "nvim-lua/plenary.nvim",
                config = function()
                    require("plugins.formatting.todo-comments")
                end,
                event = "BufWinEnter"
            }
        )
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
        -- ------------------ Sudo in vim ------------------ --
        use(
            {
                "lambdalisue/suda.vim",
                cmd = {"SudaRead", "SudaWrite"}
            }
        )
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
        -- ------- AI powered autocopletion and more ------- --
        use(
            {
                "github/copilot.vim"
            }
        )
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
        -- -------------------- MatchUp -------------------- --
        use {
            "andymass/vim-matchup",
            event = "BufRead"
        }
        -- ------------------------------------------------- --
        -- ----------------- spell checker ----------------- --
        use {
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup {enable = true}
            end
        }
        -- ------------------------------------------------- --
        -- ----------------- Format Installer  ----------------- --
        use(
            {
                "jose-elias-alvarez/null-ls.nvim",
                requires = "PlatyPew/format-installer.nvim",
                config = function()
                    require("plugins.formatting.finstaller")
                end,
                after = "nvim-lspconfig" -- To prevent null-ls from failing to read buffer
            }
        )
        -- ------------------------------------------------- --
        -- --------------- Buffer Switcher ----------------- --
        use(
            {
                "matbme/JABS.nvim",
                config = function()
                    require("plugins.file-explorer.jabs")
                end
            }
        )
    end
)
