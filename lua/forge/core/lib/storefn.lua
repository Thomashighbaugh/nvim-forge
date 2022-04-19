local clonefn = require('forge.core.lib.clonefn')
local M = {}

---Store the function to the relevant global store
---and return the lua command equvilant of the function
---@param key string
---@param source string
---@param fnref function
---@return string
function M.store_lua_fn(key, source, fnref)
  table.insert(_G.Forge[key], { source = source, callback = clonefn(fnref) })
  local pos = vim.tbl_count(_G.Forge[key])
  return string.format([=[lua _G.Forge[%q][%d].callback()]=], key, pos)
end

---Store the function to the relevant global store
---and return the v:lua equvilant of the function
---@param key string
---@param source string
---@param fnref function
---@return string
function M.store_vlua_fn(key, source, fnref)
  table.insert(_G.Forge[key], { source = source, callback = clonefn(fnref) })
  local pos = vim.tbl_count(_G.Forge[key])
  return string.format([=[v:lua.Forge[%q][%d].callback()]=], key, pos)
end

return M
