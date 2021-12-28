-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", {"nvim-0.5"}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg =
  pcall(
  function()
    local time
    local profile_info
    local should_profile = false
    if should_profile then
      local hrtime = vim.loop.hrtime
      profile_info = {}
      time = function(chunk, start)
        if start then
          profile_info[chunk] = hrtime()
        else
          profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
        end
      end
    else
      time = function(chunk, start)
      end
    end

    local function save_profiles(threshold)
      local sorted_times = {}
      for chunk_name, time_taken in pairs(profile_info) do
        sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
      end
      table.sort(
        sorted_times,
        function(a, b)
          return a[2] > b[2]
        end
      )
      local results = {}
      for i, elem in ipairs(sorted_times) do
        if not threshold or threshold and elem[2] > threshold then
          results[i] = elem[1] .. " took " .. elem[2] .. "ms"
        end
      end

      _G._packer = _G._packer or {}
      _G._packer.profile_output = results
    end

    time([[Luarocks path setup]], true)
    local package_path_str =
      "/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
    local install_cpath_pattern = "/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
    if not string.find(package.path, package_path_str, 1, true) then
      package.path = package.path .. ";" .. package_path_str
    end

    if not string.find(package.cpath, install_cpath_pattern, 1, true) then
      package.cpath = package.cpath .. ";" .. install_cpath_pattern
    end

    time([[Luarocks path setup]], false)
    time([[try_loadstring definition]], true)
    local function try_loadstring(s, component, name)
      local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
      if not success then
        vim.schedule(
          function()
            vim.api.nvim_notify(
              "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
              vim.log.levels.ERROR,
              {}
            )
          end
        )
      end
      return result
    end

    time([[try_loadstring definition]], false)
    time([[Defining packer_plugins]], true)
    _G.packer_plugins = {
      LuaSnip = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/LuaSnip",
        url = "https://github.com/L3MON4D3/LuaSnip"
      },
      ["animate.vim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/animate.vim",
        url = "https://github.com/camspiers/animate.vim"
      },
      ["cmp-buffer"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/cmp-buffer",
        url = "https://github.com/hrsh7th/cmp-buffer"
      },
      ["cmp-nvim-lsp"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
        url = "https://github.com/hrsh7th/cmp-nvim-lsp"
      },
      ["cmp-nvim-lua"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
        url = "https://github.com/hrsh7th/cmp-nvim-lua"
      },
      ["cmp-path"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/cmp-path",
        url = "https://github.com/hrsh7th/cmp-path"
      },
      cmp_luasnip = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
        url = "https://github.com/saadparwaiz1/cmp_luasnip"
      },
      ["copilot.vim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/copilot.vim",
        url = "https://github.com/github/copilot.vim"
      },
      corpus = {
        config = {"\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.notes.corpus\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/corpus",
        url = "https://github.com/wincent/corpus"
      },
      ["formatter.nvim"] = {
        config = {"\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.formatting\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/formatter.nvim",
        url = "https://github.com/mhartington/formatter.nvim"
      },
      ["galaxyline.nvim"] = {
        config = {"\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.statusline\frequire\0"},
        load_after = {},
        loaded = true,
        needs_bufread = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim",
        url = "https://github.com/NTBBloodbath/galaxyline.nvim"
      },
      ["gitsigns.nvim"] = {
        config = {"\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0"},
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
        url = "https://github.com/lewis6991/gitsigns.nvim"
      },
      ["headlines.nvim"] = {
        config = {
          "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0"
        },
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/headlines.nvim",
        url = "https://github.com/lukas-reineke/headlines.nvim"
      },
      ["impatient.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/impatient.nvim",
        url = "https://github.com/lewis6991/impatient.nvim"
      },
      kommentary = {
        config = {"\27LJ\2\nC\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0(plugins.formatting.comment-bars\frequire\0"},
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/kommentary",
        url = "https://github.com/b3nj5m1n/kommentary"
      },
      ["lens.vim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lens.vim",
        url = "https://github.com/camspiers/lens.vim"
      },
      ["lsp-status.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
        url = "https://github.com/nvim-lua/lsp-status.nvim"
      },
      ["lsp_signature.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
        url = "https://github.com/ray-x/lsp_signature.nvim"
      },
      ["lspkind-nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
        url = "https://github.com/onsails/lspkind-nvim"
      },
      ["lualine.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lualine.nvim",
        url = "https://github.com/hoob3rt/lualine.nvim"
      },
      ["mkdir.nvim"] = {
        config = {"\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
        url = "https://github.com/jghauser/mkdir.nvim"
      },
      neoformat = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/neoformat",
        url = "https://github.com/sbdchd/neoformat"
      },
      ["nvim-autopairs"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
        url = "https://github.com/windwp/nvim-autopairs"
      },
      ["nvim-cmp"] = {
        config = {"\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28lsp.autocomplete\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-cmp",
        url = "https://github.com/hrsh7th/nvim-cmp"
      },
      ["nvim-code-action-menu"] = {
        commands = {"CodeActionMenu"},
        loaded = false,
        needs_bufread = true,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
        url = "https://github.com/weilbith/nvim-code-action-menu"
      },
      ["nvim-colorizer.lua"] = {
        commands = {"ColorizerToggle"},
        config = {
          "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0"
        },
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
        url = "https://github.com/norcalli/nvim-colorizer.lua"
      },
      ["nvim-comment-frame"] = {
        config = {"\27LJ\2\nC\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0(plugins.formatting.comment-bars\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-comment-frame",
        url = "https://github.com/s1n7ax/nvim-comment-frame"
      },
      ["nvim-lightbulb"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
        url = "https://github.com/kosayoda/nvim-lightbulb"
      },
      ["nvim-lsp-installer"] = {
        config = {"\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
        url = "https://github.com/williamboman/nvim-lsp-installer"
      },
      ["nvim-lsp-ts-utils"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
        url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
      },
      ["nvim-lspconfig"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
        url = "https://github.com/neovim/nvim-lspconfig"
      },
      ["nvim-lsputils"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
        url = "https://github.com/RishabhRD/nvim-lsputils"
      },
      ["nvim-neoclip.lua"] = {
        config = {"\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
        url = "https://github.com/AckslD/nvim-neoclip.lua"
      },
      ["nvim-tree.lua"] = {
        commands = {
          "NvimTreeClipboard",
          "NvimTreeClose",
          "NvimTreeFindFile",
          "NvimTreeOpen",
          "NvimTreeRefresh",
          "NvimTreeToggle"
        },
        config = {
          "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\30plugins.file-explorer\frequire\0"
        },
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
        url = "https://github.com/kyazdani42/nvim-tree.lua"
      },
      ["nvim-treesitter"] = {
        config = {"\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.treesitter\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
        url = "https://github.com/nvim-treesitter/nvim-treesitter"
      },
      ["nvim-treesitter-refactor"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
        url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
      },
      ["nvim-ts-autotag"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
        url = "https://github.com/windwp/nvim-ts-autotag"
      },
      ["nvim-ts-context-commentstring"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
        url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
      },
      ["nvim-web-devicons"] = {
        after = {"galaxyline.nvim"},
        load_after = {},
        loaded = true,
        needs_bufread = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
        url = "https://github.com/kyazdani42/nvim-web-devicons"
      },
      ["orgmode.nvim"] = {
        config = {"\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.notes.orgmode\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/orgmode.nvim",
        url = "https://github.com/kristijanhusak/orgmode.nvim"
      },
      ["packer.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/packer.nvim",
        url = "https://github.com/wbthomason/packer.nvim"
      },
      ["plenary.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/plenary.nvim",
        url = "https://github.com/nvim-lua/plenary.nvim"
      },
      popfix = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/popfix",
        url = "https://github.com/RishabhRD/popfix"
      },
      ["popup.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/popup.nvim",
        url = "https://github.com/nvim-lua/popup.nvim"
      },
      ["spellsitter.nvim"] = {
        config = {
          "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0"
        },
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
        url = "https://github.com/lewis6991/spellsitter.nvim"
      },
      ["suda.vim"] = {
        commands = {"SudaRead", "SudaWrite"},
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/suda.vim",
        url = "https://github.com/lambdalisue/suda.vim"
      },
      ["tabline.nvim"] = {
        config = {"\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#plugins.statusline.tabline\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/tabline.nvim",
        url = "https://github.com/kdheepak/tabline.nvim"
      },
      ["telescope-fzf-native.nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
        url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
      },
      ["telescope.nvim"] = {
        config = {"\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.navigation\frequire\0"},
        loaded = false,
        needs_bufread = true,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
        url = "https://github.com/nvim-telescope/telescope.nvim"
      },
      ["trouble.nvim"] = {
        config = {"\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#plugins.treesitter.trouble\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/trouble.nvim",
        url = "https://github.com/folke/trouble.nvim"
      },
      ["vim-floaterm"] = {
        commands = {"FloatermToggle", "FloatermNew", "FloatermSend"},
        config = {"\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins.terminal\frequire\0"},
        loaded = false,
        needs_bufread = false,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
        url = "https://github.com/voldikss/vim-floaterm"
      },
      ["vim-fugitive"] = {
        commands = {"Git"},
        loaded = false,
        needs_bufread = true,
        only_cond = false,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
        url = "https://github.com/tpope/vim-fugitive"
      },
      ["vim-polyglot"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-polyglot",
        url = "https://github.com/sheerun/vim-polyglot"
      },
      vimwiki = {
        config = {"\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.notes.vimwiki\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vimwiki",
        url = "https://github.com/vimwiki/vimwiki"
      },
      ["which-key.nvim"] = {
        config = {"\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$plugins.statusline.whichkey\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/which-key.nvim",
        url = "https://github.com/folke/which-key.nvim"
      },
      ["winshift.nvim"] = {
        config = {"\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 plugins.window.winshift\frequire\0"},
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/winshift.nvim",
        url = "https://github.com/sindrets/winshift.nvim"
      },
      ["xresources-nvim"] = {
        loaded = true,
        path = "/home/tlh/.local/share/nvim/site/pack/packer/start/xresources-nvim",
        url = "https://github.com/nekonako/xresources-nvim"
      }
    }

    time([[Defining packer_plugins]], false)
    -- Config for: which-key.nvim
    time([[Config for which-key.nvim]], true)
    try_loadstring(
      "\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$plugins.statusline.whichkey\frequire\0",
      "config",
      "which-key.nvim"
    )
    time([[Config for which-key.nvim]], false)
    -- Config for: mkdir.nvim
    time([[Config for mkdir.nvim]], true)
    try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
    time([[Config for mkdir.nvim]], false)
    -- Config for: corpus
    time([[Config for corpus]], true)
    try_loadstring(
      "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.notes.corpus\frequire\0",
      "config",
      "corpus"
    )
    time([[Config for corpus]], false)
    -- Config for: tabline.nvim
    time([[Config for tabline.nvim]], true)
    try_loadstring(
      "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#plugins.statusline.tabline\frequire\0",
      "config",
      "tabline.nvim"
    )
    time([[Config for tabline.nvim]], false)
    -- Config for: vimwiki
    time([[Config for vimwiki]], true)
    try_loadstring(
      "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.notes.vimwiki\frequire\0",
      "config",
      "vimwiki"
    )
    time([[Config for vimwiki]], false)
    -- Config for: nvim-comment-frame
    time([[Config for nvim-comment-frame]], true)
    try_loadstring(
      "\27LJ\2\nC\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0(plugins.formatting.comment-bars\frequire\0",
      "config",
      "nvim-comment-frame"
    )
    time([[Config for nvim-comment-frame]], false)
    -- Config for: orgmode.nvim
    time([[Config for orgmode.nvim]], true)
    try_loadstring(
      "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.notes.orgmode\frequire\0",
      "config",
      "orgmode.nvim"
    )
    time([[Config for orgmode.nvim]], false)
    -- Config for: headlines.nvim
    time([[Config for headlines.nvim]], true)
    try_loadstring(
      "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0",
      "config",
      "headlines.nvim"
    )
    time([[Config for headlines.nvim]], false)
    -- Config for: formatter.nvim
    time([[Config for formatter.nvim]], true)
    try_loadstring(
      "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.formatting\frequire\0",
      "config",
      "formatter.nvim"
    )
    time([[Config for formatter.nvim]], false)
    -- Config for: spellsitter.nvim
    time([[Config for spellsitter.nvim]], true)
    try_loadstring(
      "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0",
      "config",
      "spellsitter.nvim"
    )
    time([[Config for spellsitter.nvim]], false)
    -- Config for: nvim-neoclip.lua
    time([[Config for nvim-neoclip.lua]], true)
    try_loadstring(
      "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0",
      "config",
      "nvim-neoclip.lua"
    )
    time([[Config for nvim-neoclip.lua]], false)
    -- Config for: nvim-treesitter
    time([[Config for nvim-treesitter]], true)
    try_loadstring(
      "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.treesitter\frequire\0",
      "config",
      "nvim-treesitter"
    )
    time([[Config for nvim-treesitter]], false)
    -- Config for: winshift.nvim
    time([[Config for winshift.nvim]], true)
    try_loadstring(
      "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 plugins.window.winshift\frequire\0",
      "config",
      "winshift.nvim"
    )
    time([[Config for winshift.nvim]], false)
    -- Config for: nvim-lsp-installer
    time([[Config for nvim-lsp-installer]], true)
    try_loadstring(
      "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp\frequire\0",
      "config",
      "nvim-lsp-installer"
    )
    time([[Config for nvim-lsp-installer]], false)
    -- Config for: nvim-cmp
    time([[Config for nvim-cmp]], true)
    try_loadstring(
      "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28lsp.autocomplete\frequire\0",
      "config",
      "nvim-cmp"
    )
    time([[Config for nvim-cmp]], false)
    -- Config for: trouble.nvim
    time([[Config for trouble.nvim]], true)
    try_loadstring(
      "\27LJ\2\n>\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0#plugins.treesitter.trouble\frequire\0",
      "config",
      "trouble.nvim"
    )
    time([[Config for trouble.nvim]], false)
    -- Load plugins in order defined by `after`
    time([[Sequenced loading]], true)
    vim.cmd [[ packadd xresources-nvim ]]
    vim.cmd [[ packadd nvim-web-devicons ]]
    vim.cmd [[ packadd galaxyline.nvim ]]

    -- Config for: galaxyline.nvim
    try_loadstring(
      "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.statusline\frequire\0",
      "config",
      "galaxyline.nvim"
    )

    time([[Sequenced loading]], false)

    -- Command lazy-loads
    time([[Defining lazy-load commands]], true)
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeClipboard lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClipboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file FloatermNew lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file FloatermSend lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file FloatermToggle lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    pcall(
      vim.cmd,
      [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
    )
    time([[Defining lazy-load commands]], false)

    vim.cmd [[augroup packer_load_aucmds]]
    vim.cmd [[au!]]
    -- Event lazy-loads
    time([[Defining lazy-load event autocommands]], true)
    vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'kommentary', 'telescope.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
    time([[Defining lazy-load event autocommands]], false)
    vim.cmd("augroup END")
    if should_profile then
      save_profiles()
    end
  end
)

if not no_errors then
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: ' ..
      error_msg .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
