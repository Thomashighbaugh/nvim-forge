" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
  ["FTerm.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-auto-save"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gist"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-gist"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimwiki = {
    config = { "\27LJ\2\næ\4\0\0\5\0\24\0K4\0\0\0'\1\1\0=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0)\1\0\0=\1\6\0)\1\1\0=\1\a\0)\1\1\0=\1\b\0004\1\0\0'\2\t\0=\2\0\1'\2\v\0=\2\n\1'\2\3\0=\2\2\1'\2\5\0=\2\4\1)\2\0\0=\2\6\1)\2\1\0=\2\a\1)\2\1\0=\2\b\0014\2\0\0'\3\f\0=\3\0\2'\3\r\0=\3\n\2'\3\3\0=\3\2\2'\3\5\0=\3\4\2)\3\0\0=\3\6\2)\3\1\0=\3\a\2)\3\1\0=\3\b\0026\3\14\0009\3\15\0034\4\4\0>\0\1\4>\1\2\4>\2\3\4=\4\16\0036\3\14\0009\3\15\3)\4\1\0=\4\17\0036\3\14\0009\3\15\3)\4\0\0=\4\18\0036\3\14\0009\3\15\3)\4\1\0=\4\19\0036\3\14\0009\3\15\3'\4\21\0=\4\20\0036\3\14\0009\3\15\3)\4\1\0=\4\22\0036\3\14\0009\3\15\3)\4\0\0=\4\23\3K\0\1\0\27vimwiki_table_mappings\23vimwiki_auto_chdir\vcustom\20vimwiki_folding\22vimwiki_use_mouse\23vimwiki_global_ext\25vimwiki_autowriteall\17vimwiki_list\6g\bvim\24~/PersonalWiki/html\19~/PersonalWiki\24~/HinduismWiki/html\14path_html\19~/HinduismWiki\24auto_generate_links\rauto_toc\16list_margin\b.md\bext\rmarkdown\vsyntax\19$HOME/.vimwiki\tpath\0" },
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/webapi-vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["xresources-nvim"] = {
    loaded = true,
    path = "/home/tlh/.local/share/nvim/site/pack/packer/start/xresources-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\næ\4\0\0\5\0\24\0K4\0\0\0'\1\1\0=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0)\1\0\0=\1\6\0)\1\1\0=\1\a\0)\1\1\0=\1\b\0004\1\0\0'\2\t\0=\2\0\1'\2\v\0=\2\n\1'\2\3\0=\2\2\1'\2\5\0=\2\4\1)\2\0\0=\2\6\1)\2\1\0=\2\a\1)\2\1\0=\2\b\0014\2\0\0'\3\f\0=\3\0\2'\3\r\0=\3\n\2'\3\3\0=\3\2\2'\3\5\0=\3\4\2)\3\0\0=\3\6\2)\3\1\0=\3\a\2)\3\1\0=\3\b\0026\3\14\0009\3\15\0034\4\4\0>\0\1\4>\1\2\4>\2\3\4=\4\16\0036\3\14\0009\3\15\3)\4\1\0=\4\17\0036\3\14\0009\3\15\3)\4\0\0=\4\18\0036\3\14\0009\3\15\3)\4\1\0=\4\19\0036\3\14\0009\3\15\3'\4\21\0=\4\20\0036\3\14\0009\3\15\3)\4\1\0=\4\22\0036\3\14\0009\3\15\3)\4\0\0=\4\23\3K\0\1\0\27vimwiki_table_mappings\23vimwiki_auto_chdir\vcustom\20vimwiki_folding\22vimwiki_use_mouse\23vimwiki_global_ext\25vimwiki_autowriteall\17vimwiki_list\6g\bvim\24~/PersonalWiki/html\19~/PersonalWiki\24~/HinduismWiki/html\14path_html\19~/HinduismWiki\24auto_generate_links\rauto_toc\16list_margin\b.md\bext\rmarkdown\vsyntax\19$HOME/.vimwiki\tpath\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
