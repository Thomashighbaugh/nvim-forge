--- NOTE: Contains plugin.spec that this config is fully dependent on.
local use = require("packer").use

use(
  {
    "wbthomason/packer.nvim",
    module = "packer",
    config = function()
      require("plugin.spec")
    end
  }
)

use({"nvim-lua/plenary.nvim"})

use({"lewis6991/impatient.nvim"})

-- vim:ft=lua