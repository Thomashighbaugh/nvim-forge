local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"
    use {
        "vimwiki/vimwiki",
        config = function()
            local wiki = {}

            wiki.path = "$HOME/.vimwiki"

            wiki.syntax = "markdown"

            wiki.ext = ".md"

            wiki.list_margin = 0
            wiki.auto_toc = 1
            wiki.auto_generate_links = 1

            local wiki2 = {}
            wiki2.path = "~/Dropbox/HinduismWiki"
            wiki2.path_html = "~/Dropbox/HinduismWiki/html"
            wiki2.syntax = "markdown"
            wiki2.ext = ".md"
            wiki2.list_margin = 0
            wiki2.auto_toc = 1
            wiki2.auto_generate_links = 1

            vim.g.vimwiki_list = {
                wiki,
                wiki2
            }
            vim.g.vimwiki_autowriteall = 1
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_use_mouse = 1
            vim.g.vimwiki_folding = "custom"
            vim.g.vimwiki_auto_chdir = 1
            vim.g.vimwiki_table_mappings = 0
        end
    }
    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    use {"folke/trouble.nvim", opt = true}
    use {"onsails/lspkind-nvim", opt = true}

    --Colors, using my system's theme because I made it and its just as good as the alternatives
    use {"nekonako/xresources-nvim"}
    use {"norcalli/nvim-colorizer.lua", opt = true}

    -- Telescope
    use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use {"nvim-telescope/telescope.nvim", opt = true}
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {"nvim-telescope/telescope-project.nvim", opt = true}

    -- Debugging
    use {"mfussenegger/nvim-dap", opt = true}

    -- Autocomplete
    use {"hrsh7th/nvim-compe", opt = true}
    use {"hrsh7th/vim-vsnip", opt = true}
    use {"rafamadriz/friendly-snippets", opt = true}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag", opt = true}
    use {'andymass/vim-matchup', opt = true}

    -- Explorer
    use {"kyazdani42/nvim-tree.lua", opt = true}
    use {"ahmedkhalf/lsp-rooter.nvim", opt = true} -- with this nvim-tree will follow you
    use "kevinhwang91/rnvimr"

 -- Git
    -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    use {"lewis6991/gitsigns.nvim", opt = true}
    use {'f-person/git-blame.nvim', opt = true}
    use {'tpope/vim-fugitive', opt = true}
    use {'tpope/vim-rhubarb', opt = true}


        -- Easily Create Gists
         use {'mattn/vim-gist', opt = true}
         use {'mattn/webapi-vim', opt = true}

    -- UI Functionality 
    use {"folke/which-key.nvim", opt = true}
    use {"ChristianChiarulli/dashboard-nvim", opt = true}
    use {"windwp/nvim-autopairs", opt = true}
    use {"kevinhwang91/nvim-bqf", opt = true}

    -- Comments
    use {"terrortylor/nvim-comment", opt = true}
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}



    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt = true}

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", opt = true}
    use {"romgrk/barbar.nvim", opt = true}

    use {"tweekmonster/startuptime.vim", opt = true}
    use {"907th/vim-auto-save", opt = true}
    use {"karb94/neoscroll.nvim", opt = true}
    use {'metakirby5/codi.vim', opt = true}

    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', opt = true}
    use {'numToStr/FTerm.nvim', opt = true}
    use {'monaqa/dial.nvim', opt = true}
    use {'nacro90/numb.nvim', opt = true}
    use {'turbio/bracey.vim', run = 'npm install --prefix server', opt = true}
    use {'phaazon/hop.nvim', opt = true}
    use {'windwp/nvim-spectre', opt = true}
    use {'simrat39/symbols-outline.nvim', opt = true}
    use {'nvim-treesitter/playground', opt = true}

    require_plugin('codi.vim')
    require_plugin('numToStr/FTerm.nvim')
    require_plugin('dial.nvim')
    require_plugin('numb.nvim')
    require_plugin('bracey.vim')
    require_plugin('playground')
    require_plugin('symbols-outline.nvim')
    require_plugin('windwp/nvim-spectre')
    require_plugin('hop.nvim')
    require_plugin('markdown-preview.nvim')
    require_plugin("startuptime.vim")
    require_plugin("vim-auto-save")
    require_plugin("neoscroll")
    require_plugin("lspkind-nvim")
    require_plugin("colorizer.lua")
    require_plugin("vimwiki")
    require_plugin("xresources-nvim")
    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    require_plugin('trouble.nvim')
    require_plugin("friendly-snippets")
    require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    require_plugin("telescope.nvim")
    require_plugin('telescope-project.nvim')
    require_plugin("nvim-dap")
    require_plugin("nvim-compe")
    require_plugin("vim-vsnip")
    require_plugin("nvim-treesitter")
    require_plugin("nvim-ts-autotag")
    require_plugin('vim-matchup')
    require_plugin("nvim-tree.lua")
    require_plugin("gitsigns.nvim")
    require_plugin("git-blame.nvim")
    require_plugin("which-key.nvim")
    require_plugin("dashboard-nvim")
    require_plugin("nvim-autopairs")
    require_plugin("nvim-comment")
    require_plugin("nvim-bqf")
    require_plugin("nvcode-color-schemes.vim")
    require_plugin("nvim-web-devicons")
    require_plugin("galaxyline.nvim")
    require_plugin("barbar.nvim")
    require_plugin('lsp-rooter.nvim')
    require_plugin("TrueZen.nvim")
    require_plugin("nvim-ts-context-commentstring")

end)
