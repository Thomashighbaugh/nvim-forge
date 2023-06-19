local M = {
  "echasnovski/mini.animate",
  event = "UIEnter",
  config = function()
    local timing = { timing = require("mini.animate").gen_timing.linear({ duration = 67, unit = "total" }) }

    require("mini.animate").setup({
      cursor = { timing = require("mini.animate").gen_timing.linear({ duration = 125, unit = "total" }) },
      scroll = timing,
      resize = timing,
      open = timing,
      close = timing,
    })
  end,
}

return M