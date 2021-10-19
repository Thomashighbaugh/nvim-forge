-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tlh/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/aerial.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  corpus = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.corpus\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/corpus"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.dashboard\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["format.nvim"] = {
    commands = { "FormatWrite" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.format\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.statusline\frequire\0" },
    load_after = {
      ["nvim-base16.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  genutils = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/genutils"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.gitsigns\frequire\0" },
    keys = { { "", "<space>g" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    commands = { "LazyGit", "LazyGitConfig" },
    keys = { { "", "<leader>gg" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/lazygit.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flspkind\27plugins.configs.others\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/mkdir.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14neoscroll\27plugins.configs.others\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.autopairs\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    after = { "galaxyline.nvim", "nvim-web-devicons" },
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17colors.theme\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-base16.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-calc", "cmp-nvim-lsp", "cmp-nvim-lua", "cmp-path", "cmp_luasnip", "cmp-buffer" },
    loaded = true,
    only_config = true
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\27plugins.configs.others\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-deardiary"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.deardiary\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-deardiary"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.linter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-lint"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.lspconfig\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-minimap"] = {
    commands = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-minimap"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-toggleterm.lua"] = {
    commands = { "ToggleTerm", "TermExec" },
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.toggleterm\frequire\0" },
    keys = { { "", "n" }, { "", "<space>t" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.nvimtree\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.treesitter\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.icons\frequire\0" },
    load_after = {
      ["nvim-base16.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    after = { "nvim-base16.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["qf_helper.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.qfhelper\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/qf_helper.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 plugins.configs.refactoring\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/sqlite.lua"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["suda.vim"] = {
    commands = { "SudaRead", "SudaWrite" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.tabline\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/tabline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.trouble\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-bufkill"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-bufkill"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rust-syntax-ext"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-rust-syntax-ext"
  },
  vimwiki = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.vimwiki\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.whichkey\frequire\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["xresources-nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^gitsigns"] = "gitsigns.nvim",
  ["^lint"] = "nvim-lint",
  ["^lsp_signature"] = "lsp_signature.nvim",
  ["^sqlite"] = "sqlite.lua",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "nvim-toggleterm.lua",
  ["^toggleterm%.terminal"] = "nvim-toggleterm.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14blankline\27plugins.configs.others\frequire\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-deardiary
time([[Config for nvim-deardiary]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.deardiary\frequire\0", "config", "nvim-deardiary")
time([[Config for nvim-deardiary]], false)
-- Config for: qf_helper.nvim
time([[Config for qf_helper.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.qfhelper\frequire\0", "config", "qf_helper.nvim")
time([[Config for qf_helper.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flspkind\27plugins.configs.others\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 plugins.configs.refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: corpus
time([[Config for corpus]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.corpus\frequire\0", "config", "corpus")
time([[Config for corpus]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugins.configs.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14neoscroll\27plugins.configs.others\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.vimwiki\frequire\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.tabline\frequire\0", "config", "tabline.nvim")
time([[Config for tabline.nvim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\27plugins.configs.others\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugins.configs.whichkey\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-calc ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'format.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGitConfig lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGitConfig", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapRefresh lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'nvim-toggleterm.lua'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope-packer.nvim', 'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TermExec lua require("packer.load")({'nvim-toggleterm.lua'}, { cmd = "TermExec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaRead lua require("packer.load")({'suda.vim'}, { cmd = "SudaRead", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapUpdateHighlight lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapUpdateHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LazyGit lua require("packer.load")({'lazygit.nvim'}, { cmd = "LazyGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'nvim-minimap'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapClose lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <space>g <cmd>lua require("packer.load")({'gitsigns.nvim'}, { keys = "<lt>space>g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>t <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>space>t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gg <cmd>lua require("packer.load")({'lazygit.nvim'}, { keys = "<lt>leader>gg", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWritePre * ++once lua require("packer.load")({'mkdir.nvim'}, { event = "BufWritePre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
