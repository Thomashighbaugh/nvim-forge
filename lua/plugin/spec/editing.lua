--  This file contains plugins that assists general code editing.
--  Such as syntax highlighting, build helpers, URL highlights, previews, etc.
local use = require('packer').use

local disabled = require('control.disabled')

use(
  {
    'protex/better-digraphs.nvim',
    after = 'telescope.nvim',
    setup = function()
      require('plugin.config.editing.digraph')
    end
  }
)

use(
  {
    'sheerun/vim-polyglot',
    event = 'UIEnter'
  }
)

use(
  {
    'fedepujol/move.nvim',
    event = 'InsertEnter',
    config = function()
      require('plugin.config.editing.move')
    end
  }
)

use(
  {
    'bhurlow/vim-parinfer',
    ft = 'yuck'
  }
)

use(
  {
    'aspeddro/pandoc.nvim',
    ft = {
      'markdown',
      'tex',
      'xml',
      'org',
      'html',
      'plaintext',
      'txt'
    },
    disable = disabled['pandoc.nvim'],
    config = function()
      require('plugin.config.editing.pandoc')
    end
  }
)

use({'Fymyte/rasi.vim', ft = 'rasi'})
use({'elkowar/yuck.vim', ft = 'yuck'})
use({'kovetskiy/sxhkd-vim', ft = 'sxhkd'})
use({'MTDL9/vim-log-highlighting', ft = 'log'})
use({'vuki656/package-info.nvim', ft = 'package.json'})

use(
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    module = 'neogit'
  }
)

use(
  {
    'lewis6991/gitsigns.nvim',
    cmd = 'Gitsigns',
    config = function()
      require('plugin.config.editing.gitsigns')
    end,
    module = 'gitsigns'
  }
)

use(
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugin.config.editing.comments')
    end,
    event = {'CursorMoved', 'InsertEnter'}
  }
)

use(
  {
    'folke/todo-comments.nvim',
    event = {'CmdlineEnter', 'InsertEnter', 'CursorMoved', 'CursorHold'},
    config = function()
      require('plugin.config.editing.todo')
    end
  }
)

use(
  {
    'ellisonleao/glow.nvim',
    cmd = 'Glow',
    setup = function()
      require('plugin.config.editing.glow')
    end
  }
)

use(
  {
    'iamcco/markdown-preview.nvim',
    setup = function()
      require('plugin.config.editing.mdpreview')
    end,
    run = 'cd app && yarn install',
    ft = 'markdown'
  }
)

use(
  {
    'norcalli/nvim-colorizer.lua',
    cmd = {
      'ColorizerToggle',
      'ColorizerReloadAllBuffers',
      'ColorizerAttachToBuffers',
      'ColorizerDetachFromBuffers'
    }
  }
)

use(
  {
    'chrisbra/Colorizer',
    cmd = {
      'ColorToggle',
      'ColorClear',
      'ColorContrast',
      'ColorHighlight',
      'ColorSwapFgBg'
    }
  }
)

use(
  {
    'folke/trouble.nvim',
    cmd = {'Trouble', 'TroubleClose', 'TroubleRefresh', 'TroubleToggle'},
    config = function()
      require('plugin.config.editing.trouble')
    end
  }
)

use(
  {
    'NFrid/due.nvim',
    cmd = {'DueDraw', 'DueRedraw', 'DueClean', 'DueAsyncUpdate'}
  }
)
use(
  {
    'oberblastmeister/neuron.nvim',
    wants = 'popup.nvim',
    after = 'telescope.nvim',
    disable = disabled['neuron.nvim']
  }
)

use(
  {
    'axieax/urlview.nvim',
    wants = 'telescope-ui-select.nvim',
    cmd = 'UrlView'
  }
)

-- vim:ft=lua
