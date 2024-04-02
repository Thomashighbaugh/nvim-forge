local M = {}

function M.bootstrap()
  require("core").setup()
  require("core.lazy")
end

return M
