-- Check if code actions are available on lsp
local M = {}

function M.code_action_listener(bufnr, range, context)
    local params = {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
        range = range,
        context = context,
    }
    return params
end

return M
