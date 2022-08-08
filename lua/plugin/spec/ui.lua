--- NOTE: Adds and polishes neovim UI components. Such as tabline, indent lines, etc.
local use = require("packer").use

use(
  {
    "edluffy/specs.nvim",
    config = function()
      require("plugin.config.ui.specs")
    end,
    event = {"CursorMoved", "CursorMovedI"}
  }
)

use(
  {
    "toppair/reach.nvim",
    config = function()
      require("plugin.config.ui.reach")
    end,
    module = "reach"
  }
)

use(
  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    config = function()
      require("plugin.config.ui.bufferline")
    end,
    wants = "nvim-web-devicons"
  }
)

use(
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugin.config.ui.devicons")
    end,
    module = "nvim-web-devicons"
  }
)

use(
  {
    "lukas-reineke/indent-blankline.nvim",
    cmd = {
      "IndentBlanklineEnable",
      "IndentBlanklineDisable",
      "IndentBlanklineToggle",
      "IndentBlanklineRefresh",
      "IndentBlanklineRefreshScroll"
    },
    config = function()
      require("plugin.config.ui.blankline")
    end
  }
)

use(
  {
    "VonHeikemen/fine-cmdline.nvim",
    cmd = "FineCmdline",
    config = function()
      require("plugin.config.ui.finecmdline")
    end
  }
)

use(
  {
    "VonHeikemen/searchbox.nvim",
    cmd = {
      "SearchBoxIncSearch",
      "SearchBoxClear",
      "SearchBoxSimple",
      "SearchBoxReplace",
      "SearchBoxMatchAll"
    },
    config = function()
      require("plugin.config.ui.searchbox")
    end
  }
)

use(
  {
    "goolord/alpha-nvim",
    wants = "nvim-web-devicons",
    config = function()
      require("plugin.config.ui.alpha")
    end,
    cmd = {
      "Alpha",
      "AlphaRedraw"
    }
  }
)

-- vim:ft=lua
