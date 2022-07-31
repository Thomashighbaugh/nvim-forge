--- NOTE: Focuses on functions such as brightness, productivity boosts. etc
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "sunjon/shade.nvim",
  config = function()
    require("plugin.config.wellbeing.shade")
  end,
  keys = "<leader>s",
  cmd = "Shade",
})

use({
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require("plugin.config.wellbeing.twilight")
  end,
})

use({
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require("plugin.config.wellbeing.zenmode")
  end,
})


-- vim:ft=lua
