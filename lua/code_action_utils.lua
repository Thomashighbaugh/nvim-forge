-- Check if code actions are availeble on lsp
local M = {}

local lsp_util = vim.lsp.util

function M.code_action_listener()
    local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
    local params = lsp_util.make_range_params()
    params.context = context
end

return M
