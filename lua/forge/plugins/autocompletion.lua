local M = {
  plugins = {
    -- nvim-cmp
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-vsnip"},
    {"hrsh7th/cmp-buffer"},
    {"petertriho/cmp-git"},
    {"hrsh7th/cmp-calc"},
    {"ray-x/cmp-treesitter"},
    {"lukas-reineke/cmp-rg"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/cmp-nvim-lsp-signature-help"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-nvim-lua"},
    {"rafamadriz/friendly-snippets"},

  --   coq_nvim
    { 'ms-jpq/coq_nvim', branch = 'coq' },
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

    -- ddc.vim
   { 'Shougo/ddc.vim' },
   { 'tani/ddc-fuzzy' },
   {'vim-denops/denops.vim'},
  { 'matsui54/denops-popup-preview.vim' },
  { 'Shougo/ddc-nvim-lsp' },
  { 'Shougo/ddc-around' },
  { 'matsui54/ddc-buffer' },
  { 'hrsh7th/vim-vsnip-integ' },
  }
}

function M.before()
  -- coq_nvim Config
  -- ---
  require('forge.plugins.autocompletions.coq').before()
end

function M.after()
  -- nvim-cmp Config
  -- ---
  require("forge.plugins.autocompletions.cmp")

  -- coq_nvim Config
  -- ---
  require('forge.plugins.autocompletions.coq').after()

  -- ddc.vim Config
  -- ---
  require('forge.plugins.autocompletions.ddc')
end

return M
