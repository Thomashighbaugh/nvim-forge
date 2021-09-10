local present, _ = pcall(require, 'plugins.packerInit')
local packer

if present then
    packer = require 'packer'
else
    return false
end

local use = packer.use

return packer.startup(
    function()
        use {
            'wbthomason/packer.nvim',
            event = 'VimEnter'
        }
        -- Note Taking
        use {
            'vimwiki/vimwiki',
            config = function()
                require 'plugins.configs.vimwiki'
            end
        }
        use {
          'ishchow/nvim-deardiary',
          config = function()
            require'plugins.configs.deardiary'
          end

        }
        use {
            'wincent/corpus',
            config = function()
                require 'plugins.configs.corpus'
            end
        }
        use {
            'romgrk/barbar.nvim',
            after = 'nvim-web-devicons'
        }

        use {
            'glepnir/galaxyline.nvim',
            after = 'nvim-base16.lua',
            config = function()
                require 'plugins.configs.statusline'
            end
        }
        use 'nekonako/xresources-nvim'
        use {
            'ThePrimeagen/refactoring.nvim',
            requires = {
                {'nvim-lua/plenary.nvim'},
                {'nvim-treesitter/nvim-treesitter'}
            },
            config = function()
                require 'plugins.configs.refactoring'
            end
        }

        -- color related stuff
        use {
            'siduck76/nvim-base16.lua',
            after = 'packer.nvim',
            config = function()
                require 'colors.theme'
            end
        }

        use {
            'norcalli/nvim-colorizer.lua',
            event = 'BufRead',
            config = function()
                require('plugins.configs.others').colorizer()
            end
        }

        -- language related plugins
        use {
            'nvim-treesitter/nvim-treesitter',
            event = 'BufRead',
            config = function()
                require 'plugins.configs.treesitter'
            end
        }

        use {
            'kabouzeid/nvim-lspinstall',
            event = 'BufRead'
        }
        use {
            'folke/which-key.nvim',
            config = function()
                require 'plugins.configs.whichkey'
            end
        }

        use {
            'neovim/nvim-lspconfig',
            after = 'nvim-lspinstall',
            config = function()
                require 'plugins.configs.lspconfig'
            end
        }

        use {
            'onsails/lspkind-nvim',
            event = 'BufRead',
            config = function()
                require('plugins.configs.others').lspkind()
            end
        }
        -- load compe in insert mode only
        use {
            'hrsh7th/nvim-compe',
            event = 'InsertEnter',
            config = function()
                require 'plugins.configs.compe'
            end,
            wants = 'LuaSnip',
            requires = {
                {
                    'L3MON4D3/LuaSnip',
                    wants = 'friendly-snippets',
                    event = 'InsertCharPre',
                    config = function()
                        require 'plugins.configs.luasnip'
                    end
                },
                {
                    'rafamadriz/friendly-snippets',
                    event = 'InsertCharPre'
                }
            }
        }

        use {
            'sbdchd/neoformat',
            cmd = 'Neoformat'
        }
        use {
            'lukas-reineke/format.nvim',
            cmd = 'FormatWrite',
            config = function()
                require 'plugins.configs.configs.format'
            end
        }
        -- file managing , picker etc
        use {
            'kyazdani42/nvim-tree.lua',
            cmd = 'NvimTreeToggle',
            config = function()
                require 'plugins.configs.nvimtree'
            end
        }

        use {
            'kyazdani42/nvim-web-devicons',
            after = 'nvim-base16.lua',
            config = function()
                require 'plugins.configs.icons'
            end
        }

        use {
            'nvim-lua/plenary.nvim',
            event = 'BufRead'
        }
        use {
            'nvim-lua/popup.nvim',
            after = 'plenary.nvim'
        }

        use {
            'nvim-telescope/telescope.nvim',
            cmd = 'Telescope',
            config = function()
                require 'plugins.configs.telescope'
            end
        }

        use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
            cmd = 'Telescope'
        }
        use {
            'nvim-telescope/telescope-media-files.nvim',
            cmd = 'Telescope'
        }
        use {
            'mfussenegger/nvim-lint',
            config = function()
                require('plugins.configs.linter')
            end
            -- module = "lint",
        }
        -- misc plugins
        use {
            'windwp/nvim-autopairs',
            after = 'nvim-compe',
            config = function()
                require 'plugins.configs.autopairs'
            end
        }

        use {
            'andymass/vim-matchup',
            event = 'CursorMoved'
        }

        use {
            'terrortylor/nvim-comment',
            cmd = 'CommentToggle',
            config = function()
                require('plugins.configs.others').comment()
            end
        }

        use {
            'glepnir/dashboard-nvim',
            cmd = {
                'Dashboard',
                'DashboardNewFile',
                'DashboardJumpMarks',
                'SessionLoad',
                'SessionSave'
            },
            config = function()
                require 'plugins.configs.dashboard'
            end
        }

        use {
            'tweekmonster/startuptime.vim',
            cmd = 'StartupTime'
        }

        -- load autosave only if its globally enabled
        use {
            'Pocco81/AutoSave.nvim',
            config = function()
                require 'plugins.configs.autosave'
            end,
            cond = function()
                return vim.g.auto_save == true
            end
        }

        use 'kosayoda/nvim-lightbulb'
        -- smooth scroll
        use {
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('plugins.configs.others').neoscroll()
            end
        }

        use 'alvan/vim-closetag' -- for html autoclosing tag

        use {
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            setup = function()
                require('plugins.configs.others').blankline()
            end
        }
        use(
            {
                'kdheepak/lazygit.nvim',
                cmd = {'LazyGit', 'LazyGitConfig'},
                keys = '<leader>gg'
            }
        )
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('plugins.configs.gitsigns')
            end,
            module = 'gitsigns',
            keys = '<space>g'
        }
        use {
            'lambdalisue/suda.vim',
            cmd = {'SudaRead', 'SudaWrite'}
        }
        use {
            'rinx/nvim-minimap',
            cmd = {
                'Minimap',
                'MinimapClose',
                'MinimapToggle',
                'MinimapRefresh',
                'MinimapUpdateHighlight'
            }
        }
        -- Terminal

        use {
            'akinsho/nvim-toggleterm.lua',
            config = function()
                require('plugins.configs.toggleterm')
            end,
            module = {'toggleterm', 'toggleterm.terminal'},
            cmd = {'ToggleTerm', 'TermExec'},
            keys = {'n', '<space>t'}
        }
    end
)
