local settings = require("core.settings")

if settings.theme == "tundra" then
  return {
    "sam4llis/nvim-tundra",
    config = function()
      require("plugins.themes.tundra")
    end,
  }

elseif settings.theme == "kanagawa" then
  return {
    "rebelot/kanagawa.nvim",
    config = function()
      require("lua.plugins.themes.kanagawa")
    end,
  }
else 
  return {
    "EdenEast/nightfox.nvim",
    config = function()
      require("plugins.themes.nightfox")
    end,
  }
end
