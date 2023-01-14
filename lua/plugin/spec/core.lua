--- NOTE: Contains plugin.spec that this config is fully dependent on.
local use = require("packer").use

local disabled = require("control.disabled")

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

--[[ use({
  "dharmx/nvim-colo",
  config = function()
    require("colo").setup()
  end,
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",    ---optional
    "nvim-lua/plenary.nvim",            ---optional
    "nvim-telescope/telescope.nvim",    ---optional
    "feline-nvim/feline.nvim",          ---optional
    "akinsho/bufferline.nvim",          ---optional
    "lewis6991/gitsigns.nvim",          ---optional
    "kyazdani42/nvim-web-devicons",     ---optional
  }
}) ]]
-- vim:ft=lua
