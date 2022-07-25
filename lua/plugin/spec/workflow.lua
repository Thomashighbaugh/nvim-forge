--  This group assists workflow such as efficient motion control, jumps, searches,
--  bookmarks, auto-save, file explorer, etc.
local use = require('packer').use

local disabled = require('control.disabled')

use(
  {
    'MattesGroeger/vim-bookmarks',
    setup = function()
      require('plugin.config.workflow.bookmarks')
    end,
    cmd = 'BookmarkToggle',
    event = {
      'InsertEnter',
      'CmdlineEnter',
      'CursorMoved'
    }
  }
)

use(
  {
    'tjdevries/train.nvim',
    cmd = {
      'TrainUpDown',
      'TrainWord',
      'TrainTextObj'
    }
  }
)

use(
  {
    'kevinhwang91/rnvimr',
    cmd = {
      'RnvimrToggle',
      'RnvimrResize'
    },
    setup = function()
      require('plugin.config.workflow.rnvimr')
    end
  }
)

use(
  {
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle', 'NvimTreeRefresh', 'NvimTreeFocus'},
    config = function()
      require('plugin.config.workflow.nvimtree')
    end
  }
)

use(
  {
    'phaazon/hop.nvim',
    cmd = {'HopWord', 'HopLine', 'HopChar1', 'HopChar2', 'HopPattern'},
    config = function()
      require('plugin.config.workflow.hop')
    end
  }
)

use(
  {
    'mbbill/undotree',
    disable = disabled['undotree'],
    cmd = 'UndotreeToggle',
    config = function()
      require('plugin.config.workflow.undotree')
    end
  }
)

use({'abecodes/tabout.nvim', opt = true})

use(
  {
    'akinsho/toggleterm.nvim',
    disable = disabled['toggleterm.nvim'],
    config = function()
      require('plugin.config.workflow.toggleterm')
    end,
    module = {'toggleterm'},
    cmd = {'ToggleTerm', 'ToggleTermToggleAll'}
  }
)

use(
  {
    'folke/which-key.nvim',
    event = 'UIEnter',
    disable = disabled['which-key.nvim'],
    config = function()
      require('plugin.config.workflow.whichkey')
    end
  }
)

use(
  {
    'ggandor/lightspeed.nvim',
    opt = true
  }
)

use({'ggandor/leap.nvim', opt = true})

use(
  {
    'bennypowers/nvim-regexplainer',
    config = function()
      require('plugin.config.workflow.regexplainer')
    end,
    wants = 'nui.nvim',
    after = 'nvim-treesitter'
  }
)

use(
  {
    'winston0410/cmd-parser.nvim',
    event = 'CmdlineEnter',
    disable = disabled['cmd-parser.nvim']
  }
)

-- vim:ft=lua
