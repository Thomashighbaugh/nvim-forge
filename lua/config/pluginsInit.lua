---@diagnostic disable: different-requires
local present, packer = pcall(require, 'config.packer')

if not present then
    return false
end

local use = packer.use

return packer.startup(
    function()
        use('wbthomason/packer.nvim')

        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- startup diagnostics
        use('lewis6991/impatient.nvim')
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Note Taking
        use(
            {
                'vimwiki/vimwiki',
                config = function()
                    require('config.core.notes.vimwiki')
                end
            }
        )
        use(
            {
                'wincent/corpus',
                config = function()
                    require('config.core.notes.corpus')
                end
            }
        )
        use(
            {
                'kristijanhusak/orgmode.nvim',
                config = function()
                    require('config.core.notes.orgmode')
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- colors
        use('nekonako/xresources-nvim')

        use(
            {
                -- icons
                'kyazdani42/nvim-web-devicons',
                after = 'xresources-nvim'
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- theme stuff
        use(
            {
                -- statusline
                'NTBBloodbath/galaxyline.nvim',
                branch = 'main',
                requires = {'kyazdani42/nvim-web-devicons', opt = true},
                config = function()
                    require('config.core.statusline')
                end,
                after = 'nvim-web-devicons'
            }
        )
        use(
            {
                'kdheepak/tabline.nvim',
                config = function()
                    require('config.core.statusline.tabline')
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
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- file explorer
        use(
            {
                'kyazdani42/nvim-tree.lua',
                config = function()
                    require('config.core.file-explorer').init()
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
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- lsp
        use(
            {
                'williamboman/nvim-lsp-installer',
                requires = {
                    'neovim/nvim-lspconfig',
                    'ray-x/lsp_signature.nvim',
                    'jose-elias-alvarez/nvim-lsp-ts-utils'
                },
                config = function()
                    require('config.lsp')
                end
            }
        )

        use({'nvim-lua/lsp-status.nvim'})
        use(
            {
                'RishabhRD/popfix',
                'RishabhRD/nvim-lsputils'
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- autocompletion
        use(
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    require('config.lsp.autocomplete')
                end,
                requires = {
                    'hrsh7th/cmp-nvim-lsp',
                    'windwp/nvim-autopairs',
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                    'hrsh7th/cmp-nvim-lua',
                    'hrsh7th/nvim-cmp',
                    'L3MON4D3/LuaSnip',
                    'saadparwaiz1/cmp_luasnip',
                    'onsails/lspkind-nvim'
                }
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
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
                event = 'BufRead',
                config = function()
                    require('gitsigns').setup()
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- floating terminal
        use(
            {
                'voldikss/vim-floaterm',
                opt = true,
                cmd = {'FloatermToggle', 'FloatermNew', 'FloatermSend'},
                config = function()
                    require('config.core.terminal')
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
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
                    require('config.core.navigation')
                end,
                event = 'BufRead'
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
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
                    require('config.core.treesitter')
                end
            }
        )
        use(
            {
                'weilbith/nvim-code-action-menu',
                cmd = 'CodeActionMenu'
            }
        )
        use({'sheerun/vim-polyglot'})
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- comments
        use(
            {
                'b3nj5m1n/kommentary',
                event = 'BufRead'
            }
        )
        use(
            {
                's1n7ax/nvim-comment-frame',
                requires = {
                    {'nvim-treesitter'}
                },
                config = function()
                    require('config.core.formatting.comment-bars')
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
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
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- clipboard normalization
        use(
            {
                'AckslD/nvim-neoclip.lua',
                config = function()
                    require('neoclip').setup()
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- error highlighting
        use(
            {
                'folke/trouble.nvim',
                requires = 'kyazdani42/nvim-web-devicons',
                config = function()
                    require('config.core.treesitter.trouble')
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
                    require('config.core.statusline.whichkey')
                end
            }
        )

        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Formatting
        use(
            {
                'mhartington/formatter.nvim',
                config = function()
                    require('config.core.formatting')
                end
            }
        )

        -- Formatting
        use({'sbdchd/neoformat'})

        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- AI powered autocopletion and more
        use(
            {
                'github/copilot.vim'
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Resize buffers
        use(
            {
                'camspiers/animate.vim'
            }
        )
        use(
            {
                'camspiers/lens.vim'
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Makes Directories If They Don't Exist at Save Time
        use(
            {
                'jghauser/mkdir.nvim',
                config = function()
                    require('mkdir')
                end
            }
        )
        -- ########################################################################
        -- ########################################################################
        -- ########################################################################
        -- Window Management
        use(
            {
                'sindrets/winshift.nvim',
                config = function()
                    require('config.core.window.winshift')
                end
            }
        )

        -- spell checker
        use(
            {
                'lewis6991/spellsitter.nvim',
                config = function()
                    require('spellsitter').setup()
                end
            }
        )
    end
)
