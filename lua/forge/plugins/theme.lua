local M = {
  plugins = {
    -- Theme Utils
    {"norcalli/nvim-colorizer.lua"},
    -- Themes
    {"nekonako/xresources-nvim"}
  }
}

function M.after()
  local augroup = require("forge.core.event").augroup

  -- nvim-colorizer.lua Config
  -- ---
  augroup(
    "user_colorizer_events",
    {
      {
        event = "ColorScheme",
        exec = function()
          require("colorizer").setup({"html", "css", "javascriptreact", "typescriptreact", "lua"})
        end
      }
    }
  )
end

return M
