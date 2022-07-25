--  Utility plugins. Used by most of other plugins and by this configs utilities as well.
--  Probably the most important plugin group right after plugins.core
local use = require('packer').use

use(
  {
    'nvim-lua/popup.nvim',
    opt = true
  }
)

use(
  {
    'luukvbaal/stabilize.nvim',
    event = {
      'CmdlineEnter',
      'InsertEnter'
    }
  }
)

use(
  {
    'rcarriga/nvim-notify',
    event = 'UIEnter',
    config = function()
      require('plugin.config.utils.notify')
    end
  }
)

use({'MunifTanjim/nui.nvim', module = 'nui'})

use({'tami5/sqlite.lua', module = 'sqlite'})

-- vim:ft=lua
