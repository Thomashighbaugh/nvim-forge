local M = {
  plugins = {
    -- galaxyline.nvim
    -- { 'NTBBloodbath/galaxyline.nvim' },

    -- feline.nvim
    -- { 'feline-nvim/feline.nvim', tag = 'v1.0.0' },

    -- lualine
    { 'nvim-lualine/lualine.nvim' },
  },
}

function M.after()
  -- galaxyline.nvim Config
  -- ---
  -- require('forge.plugins.statuslines.galaxyline')

  -- feline.nvim Config
  -- ---
  -- require('forge.plugins.statuslines.feline')

  -- lualine.nvim Config
  -- ---
  require('forge.plugins.statuslines.lualine')
end

return M
