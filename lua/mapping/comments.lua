local M = {}

M.mappings = {
  ["ghh"] = {
    "<CMD>lua require('Comment.api').toggle_current_linewise(); vim.notify 'Toggled current_linewise'<CR>",
    "Comment line"
  },
  ["gcc"] = {
    "<CMD>ComComment <CR>; vim.notify 'Toggled Comment' <CR>",
    "Comment"
  },
  ["gcj"] = {
    "<CMD>ComAnnotation<CR>; vim.notify 'Toggled Annotation'<CR>",
    "Toggle Annotations"
  }
}

M.options = {
  mode = "n",
  silent = true,
  noremap = false,
  nowait = true
}

return M

-- vim:ft=lua
