local packer = require('packer')
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            'vimwiki/vimwiki',
            config = function()
                local wiki = {}

                wiki.path = '$HOME/.vimwiki'

                wiki.syntax = 'markdown'

                wiki.ext = '.md'

                wiki.list_margin = 0
                wiki.auto_toc = 1
                wiki.auto_generate_links = 1

                local wiki2 = {}
                wiki2.path = '~/HinduismWiki'
                wiki2.path_html = '~/HinduismWiki/html'
                wiki2.syntax = 'markdown'
                wiki2.ext = '.md'
                wiki2.list_margin = 0
                wiki2.auto_toc = 1
                wiki2.auto_generate_links = 1

                local wiki3 = {}
                wiki3.path = '~/PersonalWiki'
                wiki3.path_html = '~/PersonalWiki/html'
                wiki3.syntax = 'markdown'
                wiki3.ext = '.md'
                wiki3.list_margin = 0
                wiki3.auto_toc = 1
                wiki3.auto_generate_links = 1

                vim.g.vimwiki_list = {
                    wiki,
                    wiki2,
                    wiki3
                }
                vim.g.vimwiki_autowriteall = 1
                vim.g.vimwiki_global_ext = 0
                vim.g.vimwiki_use_mouse = 1
                vim.g.vimwiki_folding = 'custom'
                vim.g.vimwiki_auto_chdir = 1
                vim.g.vimwiki_table_mappings = 0
            end
        }

        -- appearance
        use 'nekonako/xresources-nvim'
        use 'norcalli/nvim-colorizer.lua'
        use 'akinsho/nvim-bufferline.lua'
        use 'glepnir/galaxyline.nvim'

        -- lang stuff
        use 'nvim-treesitter/nvim-treesitter'
        use 'sbdchd/neoformat'
        use 'nvim-lua/plenary.nvim'
        use 'windwp/nvim-ts-autotag'
        use 'andymass/vim-matchup'
        use 'windwp/nvim-autopairs'
        use 'nvim-treesitter/playground'
        use 'alvan/vim-closetag'
        -- LSP
        use 'neovim/nvim-lspconfig'
        use 'onsails/lspkind-nvim'
        use 'kabouzeid/nvim-lspinstall'
        use 'folke/trouble.nvim'
        use 'glepnir/lspsaga.nvim'

        --completion
        use 'hrsh7th/nvim-compe'

        -- Git
        use 'lewis6991/gitsigns.nvim'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'mattn/webapi-vim'
        -- snippet support
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'

        -- file management
        use 'kyazdani42/nvim-tree.lua'
        use 'kyazdani42/nvim-web-devicons'
        use 'ryanoasis/vim-devicons'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-media-files.nvim'
        use 'nvim-telescope/telescope-fzy-native.nvim'
        use 'nvim-telescope/telescope-project.nvim'
        use 'nvim-lua/popup.nvim'

        -- UI Functionality
        use 'glepnir/dashboard-nvim'
        use 'preservim/nerdcommenter'
        use 'tweekmonster/startuptime.vim'
        use 'karb94/neoscroll.nvim'
        use 'monaqa/dial.nvim'
        use 'nacro90/numb.nvim'
        use {'turbio/bracey.vim', run = 'npm install --prefix server'}

        use 'phaazon/hop.nvim'
        use 'windwp/nvim-spectre'
        use 'simrat39/symbols-outline.nvim'
        use 'folke/which-key.nvim'
        use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    end,
    {
        display = {
            border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}
        }
    }
)
