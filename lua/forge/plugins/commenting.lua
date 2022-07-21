local M = {
  plugins = {
    {'numToStr/Comment.nvim', opt = true}
  }
}

function M.after()
  require('forge.plugins.ui.comments')
end
return M
