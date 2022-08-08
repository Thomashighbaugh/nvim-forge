--- NOTE: Focuses on functions such as brightness, productivity boosts. etc
local use = require("packer").use

use(
  {
    "sunjon/shade.nvim",
    config = function()
      require("plugin.config.wellbeing.shade")
    end,
    keys = "<leader>s",
    cmd = "Shade"
  }
)

-- vim:ft=lua
