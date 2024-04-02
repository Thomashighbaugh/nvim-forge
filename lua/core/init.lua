local Profile = require("profile")
local Utils = require("utils")

---@class Core
---@field icons core.icons
---@field logos core.logos
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local mod = require("core." .. k)
    return mod
  end,
})

---@param mod "autocmds" | "options" | "keymaps" | "commands"
M.load = function(mod)
  Utils.try(function()
    require("core." .. mod)
  end, { msg = "Error loading '" .. mod .. "'" })
end

M.setup = function()
  local no_file = vim.fn.argc(-1) == 0
  -- Lazy load `autocmds` when opening a file
  if not no_file then
    M.load("autocmds")
    M.load("commands")
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    group = group,
    callback = function()
      if no_file then
        M.load("autocmds")
        M.load("commands")
      end
      M.load("keymaps")
    end,
  })
end

M.init = function()
  M.load("options")
  local colorscheme = vim.g.colors_name
  if colorscheme == nil then
    vim.cmd.colorscheme("torte")
  end
end

return M
