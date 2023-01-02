--- NOTE: Adds and polishes neovim UI components. Such as tabline, indent lines, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use {
  'fgheng/winbar.nvim',
  config = function()
    require("plugin.config.ui.winbar")
  end,
  event = "UIEnter",
}

use {
    "nvim-zh/colorful-winsep.nvim",
    config = function ()
        require("plugin.config.ui.winsep")
    end,
    event = "UIEnter",
}

use({
  "edluffy/specs.nvim",
  config = function()
    require("plugin.config.ui.specs")
  end,
  event = { "CursorMoved", "CursorMovedI" },
})

use({
  "b0o/incline.nvim",
  config = function()
    require("plugin.config.ui.incline")
  end,
  wants = "nvim-web-devicons",
})

use({
  "toppair/reach.nvim",
  config = function()
    require("plugin.config.ui.reach")
  end,
  module = "reach",
})

use({
  "akinsho/bufferline.nvim",
  tag = "v2.*",
  event = "UIEnter",
  config = function()
    require("plugin.config.ui.bufferline")
  end,
  wants = "nvim-web-devicons",
})

use({
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("plugin.config.ui.devicons")
  end,
  module = "nvim-web-devicons",
})

use({
  "lukas-reineke/indent-blankline.nvim",
  cmd = {
    "IndentBlanklineEnable",
    "IndentBlanklineDisable",
    "IndentBlanklineToggle",
    "IndentBlanklineRefresh",
    "IndentBlanklineRefreshScroll",
  },
  after = "nvim-treesitter",
  config = function()
    require("plugin.config.ui.blankline")
  end,

})

use({
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  config = function()
    require("plugin.config.ui.finecmdline")
  end,

})

use({
  "VonHeikemen/searchbox.nvim",
  cmd = {
    "SearchBoxIncSearch",
    "SearchBoxClear",
    "SearchBoxSimple",
    "SearchBoxReplace",
    "SearchBoxMatchAll",
  },
  config = function()
    require("plugin.config.ui.searchbox")
  end,

})

use({
  "goolord/alpha-nvim",
  wants = "nvim-web-devicons",
  config = function()
    require("plugin.config.ui.alpha")
  end,
  cmd = {
    "Alpha",
    "AlphaRedraw",
  },

})

use({
  "petertriho/nvim-scrollbar",
  config = function()
    require("plugin.config.ui.scrollbar")
  end,
  after = "gitsigns.nvim",

})

use({
  "sidebar-nvim/sidebar.nvim",
  config = function()
    require("plugin.config.workflow.sidebar")
  end,
  after = "nvim-lsp-installer",
})

-- Why Not?
use({
   'CosmicNvim/cosmic-ui',
    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('cosmic-ui').setup()
    end,
})
-- vim:ft=lua
