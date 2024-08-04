local Utils = require("utils")

-- ─────────────────────────────────────────────────────────────────
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  command = "set nopaste",
  pattern = "*",
})

-- ─────────────────────────────────────────────────────────────────
-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = Utils.augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual" })
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = Utils.augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("close_with_q"),
  pattern = {
    "qf",
    "muren",
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

-- ─────────────────────────────────────────────────────────────────
-- fix comment
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = Utils.augroup("comment_newline"),
  pattern = { "*" },
  callback = function()
    vim.cmd([[set formatoptions-=cro]])
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- set shell for NixOS quirkiness
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile" }, {
  pattern = "*",
  group = Utils.augroup("set_shell"),
  callback = function()
    vim.cmd([[set shell=/run/current-system/sw/bin/zsh]])
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- determine project root
vim.api.nvim_create_autocmd({ "BufEnter" }, {
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

-- clear cmd output
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = Utils.augroup("clear_term"),
  callback = function()
    vim.cmd([[echon '']])
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "help" },
  callback = function()
    vim.cmd([[wincmd L]])
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- fix comment on new line
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[set formatoptions-=cro]])
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = Utils.augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- ─────────────────────────────────────────────────────────────────
-- placement of the help window
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = Utils.augroup("help_placement"),
  pattern = { "help" },
  callback = function()
    vim.cmd([[wincmd L]])
  end,
})
--   +---------------------------------------------------------------+
-- terminal settings
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = Utils.augroup("terminal_settings"),
  pattern = { "*" },
  callback = function()
    vim.opt_local["number"] = false
    vim.opt_local["signcolumn"] = "no"
  end,
})
