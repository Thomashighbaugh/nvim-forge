local Util = require("util")
--   +---------------------------------------------------------------+
-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = Util.augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
  end,
})
--   +---------------------------------------------------------------+
-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = Util.augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
--   +---------------------------------------------------------------+
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = Util.augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Set wrap and spell in markdown and gitcommit
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = Util.augroup("wrap_spell"),
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--    -- vim.opt_local.wrap = true  -- set globally, so I don't need this on to throw errors. I already got enough of that, thanks
--     vim.opt_local.spell = true
--   end,
-- })
--   +---------------------------------------------------------------+
-- remember folds
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = "?*",
  group = Util.augroup("remember_folds"),
  callback = function()
    vim.cmd([[silent! mkview 1]])
  end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "?*",
  group = Util.augroup("remember_folds"),
  callback = function()
    vim.cmd([[silent! loadview 1]])
  end,
})
--   +---------------------------------------------------------------+
-- set shell for NixOS quirkiness
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile" }, {
  pattern = "*",
  group = Util.augroup("set_shell"),
  callback = function()
    vim.cmd([[set shell=/run/current-system/sw/bin/zsh]])
  end,
})
--   +---------------------------------------------------------------+
-- fix comment
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile" }, {
  group = Util.augroup("comment_newline"),
  pattern = { "*" },
  callback = function()
    vim.cmd([[set formatoptions-=cro]])
  end,
})
--   +---------------------------------------------------------------+
-- determine project root
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = Util.augroup("project_root"),
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir()
  end,
})
--   +---------------------------------------------------------------+
-- clear cmd output
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = Util.augroup("clear_term"),
  callback = function()
    vim.cmd([[echon '']])
  end,
})
--   +---------------------------------------------------------------+
-- placement of the help window
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = Util.augroup("help_placement"),
  pattern = { "help" },
  callback = function()
    vim.cmd([[wincmd L]])
  end,
})
--   +---------------------------------------------------------------+
-- terminal settings
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = Util.augroup("terminal_settings"),
  pattern = { "*" },
  callback = function()
    vim.opt_local["number"] = false
    vim.opt_local["signcolumn"] = "no"
  end,
})

--   +---------------------------------------------------------------+
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = Util.augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

--   +---------------------------------------------------------------+
-- Update file when there are changes to it
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  group = Util.augroup("update_file_when_changed"),
  callback = function()
    vim.cmd("checktime")
  end,
})
-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = Util.augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
