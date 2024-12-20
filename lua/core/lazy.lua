local Icons = require("core").icons
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "features.fzf", enabled = true },
		{ import = "features.telescope", enabled = false },
		{ import = "features.lsp.lang.markup", enabled = true },
		{ import = "features.lsp.lang.python", enabled = true },
		{ import = "features.lsp.lang.markdown", enabled = false },
		{ import = "features.lsp.lang.typescript", enabled = true },
		{ import = "features.lsp.lang.flutter", enabled = false },
		{ import = "features.lsp.lang.vue", enabled = false },
		{ import = "features.lsp.lang.go", enabled = true },
		{ import = "features.lsp.lang.docker", enabled = true },
		{ import = "features.lsp.lang.dotnet", enabled = false },
		{ import = "features.lsp.lang.tailwind", enabled = false },
		{ import = "features.lsp.lang.dot", enabled = false },
		{ import = "features.lsp.lang.terraform", enabled = true },
		{ import = "features.lsp.lang.tex", enabled = true },
	},
	defaults = {
		lazy = false,
		-- version = false, -- always use the latest git commit
		version = nil, -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "monokai-pro" } },
	checker = { enabled = true, notify = false },
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
	ui = {
		icons = {
			ft = Icons.lazy.ft,
			lazy = Icons.lazy.lazy,
			loaded = Icons.lazy.loaded,
			not_loaded = Icons.lazy.not_loaded,
		},
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
