-- Check if code actions are availeble on lsp
local M = {}

local lsp_util = vim.lsp.util

function M.code_action_listener()
    local context = { diagnostics = vim.diagnostic.get() }
    -- local params = lsp_util.make_range_params()
    --  params.context = context
end

return M
