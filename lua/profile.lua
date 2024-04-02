---@class Profile
---@field name string -- Your editor name
---@field author? string
---@field version? string
---@field license? string
local M = {
  name = "nvim-forge",
}
M = setmetatable({}, { __index = M })

---@param opts? Profile
function M.setup(opts)
  M = vim.tbl_deep_extend("force", M, opts or {})
end

return M
