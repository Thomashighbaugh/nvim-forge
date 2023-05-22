local settings = require("core.settings")

local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		--install_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" }),
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- After setting up mason-lspconfig you may set up servers via lspconfig
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").rust_analyzer.setup({})

		require("mason-tool-installer").setup({
			ensure_installed = settings.mason_tool_installer_ensure_installed,
		})
	end,
}

return M
