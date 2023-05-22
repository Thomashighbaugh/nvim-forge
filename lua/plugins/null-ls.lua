local M = {
	"jose-elias-alvarez/null-ls.nvim",
	lazy = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("plugins.lsp.null-ls")
	end,
}

return M
