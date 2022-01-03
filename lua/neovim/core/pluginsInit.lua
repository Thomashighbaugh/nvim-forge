---@diagnostic disable: different-requires
local present, neovim_packer = pcall(require, 'neovim.packer')

if not present then
    return false
end

local packer = neovim_packer.packer
local use = packer.use

local ok, user_plugins = pcall(require, 'neovim.config.plugins')
if not ok then
    user_plugins = {
        add = {},
        disable = {}
    }
end

if not vim.tbl_islist(user_plugins.add) then
    user_plugins.add = {}
end
if not vim.tbl_islist(user_plugins.disable) then
    user_plugins.disable = {}
end

local config = require('neovim.config')

return packer.startup(
    function()
        use(
            {
                'wbthomason/packer.nvim',
                'lewis6991/impatient.nvim',
                'nathom/filetype.nvim',
                'nvim-lua/plenary.nvim',
                'nekonako/xresources-nvim'
            }
        )

        use(
            {
                'rcarriga/nvim-notify',
                config = function()
                    require('neovim.plugins.notify')
                end,
                after = 'xresources-nvim'
            }
        )

        -- theme stuff
        use(
            {
                -- statusline
                'NTBBloodbath/galaxyline.nvim',
                branch = 'main',
                requires = {'kyazdani42/nvim-web-devicons', opt = true},
                config = function()
                    require('neovim.plugins.galaxyline')
                end,
                after = 'xresources-nvim'
            }
        )
        use(
            {
                'kdheepak/tabline.nvim',
                config = function()
                    require('neovim.plugins.tabline')
                end,
                requires = {{'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true}}
            }
        )
        use(
            {
                'lukas-reineke/headlines.nvim',
                config = function()
                    require('headlines').setup()
                end
            }
        )
        -- file explorer
        use(
            {
                'kyazdani42/nvim-tree.lua',
                config = function()
                    require('neovim.plugins.nvim-tree')
                    require('neovim.plugins.nvim-tree.mappings')
                end,
                opt = true,
                cmd = {
                    'NvimTreeClipboard',
                    'NvimTreeClose',
                    'NvimTreeFindFile',
                    'NvimTreeOpen',
                    'NvimTreeRefresh',
                    'NvimTreeToggle'
                }
            }
        )

        use(
            {
                'CosmicNvim/cosmic-ui',
                requires = {
                    'MunifTanjim/nui.nvim'
                },
                config = function()
                    require('neovim.plugins.cosmic-ui')
                end
            }
        )

        use(
            {
                'neovim/nvim-lspconfig',
                config = function()
                    require('neovim.lsp')
                end,
                requires = {
                    {'b0o/SchemaStore.nvim'},
                    {'williamboman/nvim-lsp-installer'},
                    {'jose-elias-alvarez/nvim-lsp-ts-utils'},
                    {
                        'jose-elias-alvarez/null-ls.nvim',
                        config = function()
                            require('neovim.lsp.providers.null_ls')
                        end,
                        disable = vim.tbl_contains(user_plugins.disable, 'null-ls'),
                        after = 'nvim-lspconfig'
                    },
                    {
                        'ray-x/lsp_signature.nvim',
                        config = function()
                            require('neovim.plugins.lsp-signature')
                        end,
                        after = 'nvim-lspconfig'
                    }
                }
            }
        )
        use({'nvim-lua/lsp-status.nvim'})
        use(
            {
                'RishabhRD/popfix',
                'RishabhRD/nvim-lsputils'
            }
        )

        -- autocompletion
        use(
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    require('neovim.plugins.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        config = function()
                            require('neovim.plugins.luasnip')
                        end,
                        requires = {
                            'rafamadriz/friendly-snippets'
                        }
                    },
                    {'onsails/lspkind-nvim'},
                    {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
                    'L3MON4D3/LuaSnip',
                    {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
                    {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
                    {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'},
                    {'hrsh7th/cmp-path', after = 'nvim-cmp'},
                    {
                        'windwp/nvim-autopairs',
                        config = function()
                            require('neovim.plugins.auto-pairs')
                        end,
                        after = 'nvim-cmp'
                    }
                },
                event = 'InsertEnter'
            }
        )

        -- git commands
        use(
            {
                'tpope/vim-fugitive',
                opt = true,
                cmd = 'Git'
            }
        )

        -- git column signs
        use(
            {
                'lewis6991/gitsigns.nvim',
                requires = {'nvim-lua/plenary.nvim'},
                opt = true,
                event = 'BufRead',
                config = function()
                    require('neovim.plugins.gitsigns')
                end
            }
        )

        -- floating terminal
        use(
            {
                'voldikss/vim-floaterm',
                opt = true,
                event = 'BufWinEnter',
                config = function()
                    require('neovim.plugins.terminal')
                    require('neovim.plugins.terminal.mappings')
                end
            }
        )

        -- file navigation
        use(
            {
                'nvim-telescope/telescope.nvim',
                requires = {
                    'nvim-lua/popup.nvim',
                    'nvim-lua/plenary.nvim',
                    {
                        'nvim-telescope/telescope-fzf-native.nvim',
                        run = 'make'
                    }
                },
                config = function()
                    require('neovim.plugins.telescope.mappings').init()
                    require('neovim.plugins.telescope')
                end,
                event = 'BufWinEnter'
            }
        )

        -- session/project management
        use(
            {
                'glepnir/dashboard-nvim',
                config = function()
                    require('neovim.plugins.dashboard')
                end
            }
        )

        use(
            {
                'rmagatti/auto-session',
                config = function()
                    require('neovim.plugins.auto-session')
                    require('neovim.plugins.auto-session.mappings')
                end
            }
        )

        -- lang/syntax stuff
        use(
            {
                'nvim-treesitter/nvim-treesitter',
                requires = {
                    'windwp/nvim-ts-autotag',
                    'JoosepAlviste/nvim-ts-context-commentstring',
                    'nvim-treesitter/nvim-treesitter-refactor'
                },
                run = ':TSUpdate',
                config = function()
                    require('neovim.plugins.treesitter')
                end
            }
        )
        use({'sheerun/vim-polyglot'})
        -- comments and stuff
        use(
            {
                'numToStr/Comment.nvim',
                config = function()
                    require('neovim.plugins.comments')
                end,
                event = 'BufWinEnter'
            }
        )

        -- task highlights
        use(
            {
                'folke/todo-comments.nvim',
                requires = 'nvim-lua/plenary.nvim',
                config = function()
                    require('neovim.plugins.todo-comments')
                end,
                event = 'BufWinEnter'
            }
        )
        use(
            {
                's1n7ax/nvim-comment-frame',
                requires = {
                    {'nvim-treesitter'}
                },
                config = function()
                    require('neovim.plugins.comment-bars')
                end
            }
        )
        -- colorized hex codes
        use(
            {
                'norcalli/nvim-colorizer.lua',
                opt = true,
                cmd = {'ColorizerToggle'},
                config = function()
                    require('colorizer').setup()
                end
            }
        )
        use(
            {
                'AckslD/nvim-neoclip.lua',
                config = function()
                    require('neoclip').setup()
                end
            }
        )
        -- error highlighting
        use(
            {
                'folke/trouble.nvim',
                requires = 'kyazdani42/nvim-web-devicons',
                config = function()
                    require('neovim.plugins.trouble')
                end
            }
        )
        use('kosayoda/nvim-lightbulb')
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Sudo in vim
        use(
            {
                'lambdalisue/suda.vim',
                cmd = {'SudaRead', 'SudaWrite'}
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        --whichkey
        use(
            {
                'folke/which-key.nvim',
                config = function()
                    require('neovim.plugins.whichkey')
                end
            }
        )

        if user_plugins.add and not vim.tbl_isempty(user_plugins.add) then
            for _, plugin in pairs(user_plugins.add) do
                use(plugin)
            end
        end

        if neovim_packer.first_install then
            packer.sync()
        end
    end
)
