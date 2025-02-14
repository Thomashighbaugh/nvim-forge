-- Check if code actions are availeble on lsp
local M = {}

local lsp_util = vim.lsp.util

function M.code_action_listener()
    local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
    local params = lsp_util.make_range_params()
    params.context = context
    -- Produces the most annoying error preventing one from working on lines 1-8
    -- need to either replace with some plugin or turn off the message
    -- vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, result, ctx, config) end)
end

return M
