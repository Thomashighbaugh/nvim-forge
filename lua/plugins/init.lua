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
        use {"MattesGroeger/vim-bookmarks"} --- bookmarks
        use {"tpope/vim-commentary"} --- commenting

        use {
            "stevearc/qf_helper.nvim",
            config = function()
                require("plugins.configs.qfhelper")
            end
        }
        use {"voldikss/vim-floaterm"} --- Terminal
        use {"vim-scripts/genutils"} --- general utilities
        use {"godlygeek/tabular"} --- tabbing
        use {"rafamadriz/friendly-snippets"} --- snippets
        use {"edluffy/specs.nvim"} --- cursor beacon
        -- use { 'mfussenegger/nvim-dap' }     --- debugging
        use {"qpkorr/vim-bufkill"} --- kill buffers properly
        use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
        -- Tabline {{{
        use {
            "kdheepak/tabline.nvim",
            config = function()
                require("plugins.configs.tabline")
            end,
            requires = {{"hoob3rt/lualine.nvim"}, {"kyazdani42/nvim-web-devicons", opt = true}}
        }

        use {
            "glepnir/galaxyline.nvim",
            after = "nvim-base16.lua",
            config = function()
                require "plugins.configs.statusline"
            end
        }
        use "nekonako/xresources-nvim"
        use {
            "ThePrimeagen/refactoring.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"nvim-treesitter/nvim-treesitter"}
            },
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

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").colorizer()
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
            event = "BufRead"
        }
        use {
            "folke/which-key.nvim",
            config = function()
                require "plugins.configs.whichkey"
            end
        }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
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
        use {
            "simrat39/symbols-outline.nvim",
            setup = function()
                vim.g.symbols_outline = {
                    highlight_hovered_item = true,
                    show_guides = true,
                    auto_preview = true,
                    position = "right",
                    width = 25,
                    show_numbers = false,
                    show_relative_numbers = false,
                    show_symbol_details = true,
                    keymaps = {
                        close = "q",
                        goto_location = "<CR>",
                        focus_location = "<space>",
                        hover_symbol = "K",
                        toggle_preview = "p",
                        rename_symbol = "r",
                        code_actions = "a"
                    }
                }
            end,
            cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose"}
        }
        -- load compe in insert mode only
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require "plugins.configs.compe"
            end,
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    event = "InsertCharPre",
                    config = function()
                        require "plugins.configs.luasnip"
                    end
                },
                {
                    "rafamadriz/friendly-snippets",
                    event = "InsertCharPre"
                }
            }
        }
        use {
            "hrsh7th/nvim-cmp", --- Autocompletion
            config = function()
                require("plugins.configs.cmp")
            end,
            requires = {
                {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
                {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"},
                {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
                {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"},
                {"hrsh7th/cmp-calc", after = "nvim-cmp"},
                {"hrsh7th/cmp-path", after = "nvim-cmp"},
                {"L3MON4D3/LuaSnip"}
            }
        }
        use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
        use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
        use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
        use {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"}
        use {"hrsh7th/cmp-calc", after = "nvim-cmp"}
        use {"hrsh7th/cmp-path", after = "nvim-cmp"}
        use {"L3MON4D3/LuaSnip"}
        use {
            "sbdchd/neoformat",
            cmd = "Neoformat"
        }
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
            "nvim-lua/plenary.nvim",
            event = "BufRead"
        }
        use {
            "nvim-lua/popup.nvim",
            after = "plenary.nvim"
        }

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = function()
                require "plugins.configs.telescope"
            end,
            requires = {
                "nvim-lua/plenary.nvim", -- Useful Lua utilities
                "nvim-lua/popup.nvim",
                -- FZF sorter for Telescope
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"}
            }
        }

        use {
            "nvim-telescope/telescope-media-files.nvim",
            cmd = "Telescope"
        }

        use {
            "nvim-telescope/telescope-packer.nvim",
            cmd = "Telescope"
        }
        use {
            "mfussenegger/nvim-lint",
            config = function()
                require("plugins.configs.linter")
            end
            -- module = "lint",
        }
        use {
            "AckslD/nvim-neoclip.lua",
            requires = {"tami5/sqlite.lua", module = "sqlite"},
            config = function()
                require("neoclip").setup()
            end
        }

        use {
            "mnowotnik/noteflow.nvim",
            run = "bash build.sh",
            config = function()
                require("plugins.configs.noteflow")
            end,
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim",
                "nvim-lua/popup.nvim",
                "kyazdani42/nvim-web-devicons"
            }
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            after = "nvim-compe",
            config = function()
                require "plugins.configs.autopairs"
            end
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved"
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

        -- load autosave only if its globally enabled
        use {
            "Pocco81/AutoSave.nvim",
            config = function()
                require "plugins.configs.autosave"
            end,
            cond = function()
                return vim.g.auto_save == true
            end
        }

        use "kosayoda/nvim-lightbulb"
        -- smooth scroll
        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("plugins.configs.others").neoscroll()
            end
        }

        use "alvan/vim-closetag" -- for html autoclosing tag

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
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
            "nvim-neorg/neorg",
            branch = "unstable",
            config = function()
                require("neorg").setup {
                    load = {
                        ["core.defaults"] = {}, -- Load all the defaults
                        ["core.norg.concealer"] = {}, -- Allows the use of icons
                        ["core.keybinds"] = {config = {default_keybinds = true, neorg_leader = "<leader>o"}},
                        ["core.gtd.base"] = {config = {workspace = "gtd"}},
                        ["core.integrations.treesitter"] = {
                            config = {
                                highlights = {
                                    Unordered = {
                                        List = {
                                            ["1"] = "+NeorgHeading1Title",
                                            ["2"] = "+NeorgHeading2Title",
                                            ["3"] = "+NeorgHeading3Title",
                                            ["4"] = "+NeorgHeading4Title",
                                            ["5"] = "+NeorgHeading5Title",
                                            ["6"] = "+NeorgHeading6Title"
                                        },
                                        Link = {
                                            ["1"] = "+htmlh1",
                                            ["2"] = "+htmlh2",
                                            ["3"] = "+htmlh3",
                                            ["4"] = "+htmlh4",
                                            ["5"] = "+htmlh5",
                                            ["6"] = "+htmlh6"
                                        }
                                    },
                                    Ordered = {
                                        List = {
                                            ["1"] = "+NeorgHeading1Title",
                                            ["2"] = "+NeorgHeading2Title",
                                            ["3"] = "+NeorgHeading3Title",
                                            ["4"] = "+NeorgHeading4Title",
                                            ["5"] = "+NeorgHeading5Title",
                                            ["6"] = "+NeorgHeading6Title"
                                        },
                                        Link = {
                                            ["1"] = "+htmlh1",
                                            ["2"] = "+htmlh2",
                                            ["3"] = "+htmlh3",
                                            ["4"] = "+htmlh4",
                                            ["5"] = "+htmlh5",
                                            ["6"] = "+htmlh6"
                                        }
                                    },
                                    Quote = {
                                        ["1"] = {[""] = "+htmlH1", Content = "+htmlH1"},
                                        ["2"] = {[""] = "+htmlH2", Content = "+htmlH2"},
                                        ["3"] = {[""] = "+htmlH3", Content = "+htmlH3"},
                                        ["4"] = {[""] = "+htmlH4", Content = "+htmlH4"},
                                        ["5"] = {[""] = "+htmlH5", Content = "+htmlH5"},
                                        ["6"] = {[""] = "+htmlH6", Content = "+htmlH6"}
                                    },
                                    Definition = {
                                        [""] = "+Exception",
                                        End = "+Exception",
                                        Title = "+TSStrong",
                                        Content = "+TSEmphasis"
                                    },
                                    TodoItem = {
                                        ["1"] = {
                                            [""] = "+NeorgUnorderedList1",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        },
                                        ["2"] = {
                                            [""] = "+NeorgUnorderedList2",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        },
                                        ["3"] = {
                                            [""] = "+NeorgUnorderedList3",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        },
                                        ["4"] = {
                                            [""] = "+NeorgUnorderedList4",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        },
                                        ["5"] = {
                                            [""] = "+NeorgUnorderedList5",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        },
                                        ["6"] = {
                                            [""] = "+NeorgUnorderedList6",
                                            Undone = "+StringDelimiter",
                                            Pending = "+TSPunctDelimiter",
                                            Done = "+TSString"
                                        }
                                    },
                                    EscapeSequence = "+TSType",
                                    StrongParagraphDelimiter = "+Comment",
                                    WeakParagraphDelimiter = "+Comment",
                                    HorizontalLine = "+htmlH4",
                                    Marker = {[""] = "+Structure", Title = "+TSStrong"},
                                    Tag = {
                                        Begin = "+TSKeyword",
                                        ["End"] = "+TSKeyword",
                                        Name = {[""] = "+Normal", Word = "+TSKeyword"},
                                        Parameter = "+TSType",
                                        Content = "+Normal"
                                    },
                                    Insertion = {
                                        [""] = "cterm=bold gui=bold",
                                        Prefix = "+TSPunctDelimiter",
                                        Variable = {
                                            [""] = "+TSString",
                                            Value = "+TSPunctDelimiter"
                                        },
                                        Item = "+TSNamespace",
                                        Parameters = "+TSComment"
                                    },
                                    EscapeSequence = "+TSType"
                                }
                            }
                        },
                        ["core.norg.dirman"] = {
                            -- Manage Neorg directories
                            config = {
                                workspaces = {
                                    main = "~/neorg",
                                    work = "~/neorg/work",
                                    personal = "~/neorg/personal"
                                },
                                autochdir = true,
                                autodetect = false
                            }
                        },
                        ["core.integrations.telescope"] = {},
                        ["core.norg.completion"] = {config = {engine = "nvim-cmp"}}
                    },
                    logger = {level = "warn"}
                }
            end,
            after = "nvim-treesitter"
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
        use {"RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter"}
        use {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"}
        use {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle", after = "nvim-treesitter"}
        use {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"}
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
