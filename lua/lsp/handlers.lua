-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
local M = {}

function M.setup()
	local config = { -- your config
		virtual_text = lsp.diagnostics.virtual_text,
		signs = lsp.diagnostics.signs,
		underline = lsp.diagnostics.underline,
		update_in_insert = lsp.diagnostics.update_in_insert,
		severity_sort = lsp.diagnostics.severity_sort,
		float = lsp.diagnostics.float,
	}
	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

return M
