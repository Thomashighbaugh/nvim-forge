local M = {
  plugins = {
    -- Dependencies (Utilities)
    -- ------------------------
    -- Some lua plugins require plenary as a utility dependency like
    -- telescope.nvim
    {'nvim-lua/plenary.nvim'},
    -- Core (What is essential - for me at least)
    -- ------------------------------------------
    -- Pretty much the standard plugin to have when working with teams that
    -- use different editors/IDEs, compliments nicely with my plugin above.
    {'editorconfig/editorconfig-vim'},
    -- Lua plugin to automatically insert pairs like single-quote ('),
    -- double-quote ("), etc when in insert mode.
    {'windwp/nvim-autopairs'},
    -- Lua plugin to highlight the line where the error occurred when
    -- browsing the quickfix list (:help quickfix) or the location-list
    {'kevinhwang91/nvim-bqf'},
    -- Kind of hard to explain, but a vim plugin that can spell corrections,
    -- substitions, and coersion i.e. changing different casing like
    -- snake_case to camelCase, etc.
    {'tpope/vim-abolish', opt = true},
    -- Vim plugin to select text and surround them in quotes, parenthesis, etc,
    -- in normal/visual mode.
    {'tpope/vim-surround', opt = true},
    -- Vim plugin to repeat the above two plugins with the dot (.) operator.
    {'tpope/vim-repeat', opt = true},
    -- Easily align text with a pivot
    {'junegunn/vim-easy-align'},
    -- Making things go zoom at startup
    {'lewis6991/impatient.nvim'}
  }
}

function M.after()
  -- nvim-autopairs Config
  -- ---
  require('nvim-autopairs').setup({})
end

return M
