local M =  {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim',
                    'renerocksai/calendar-vim',
                    'nvim-lua/popup.nvim',
                    'nvim-lua/plenary.nvim',
                    'nvim-telescope/telescope.nvim',
                    'nvim-telescope/telescope-media-files.nvim',
                    'nvim-telescope/telescope-bibtex.nvim',
                    'nvim-telescope/telescope-symbols.nvim'
  },

  config = function()
      require('telekasten').setup({
      home = '/home/tlh/Notes', -- Put the name of your notes directory here
      })
  end

}

return M
