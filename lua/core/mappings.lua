local g = vim.g
local map = require("utils").map

g.mapleader = " "

-- Quickfix
map("n", "<leader>ck", ":cexpr []<CR>", { noremap = true })
map("n", "<leader>cc", ":cclose <CR>", { noremap = true })
map("n", "<leader>co", ":copen <CR>", { noremap = true })
map("n", "<leader>cf", ":cfdo %s/", { noremap = true })

require("plugins.navigation.mappings").init()
require("plugins.file-explorer.mappings")
require("plugins.terminal.mappings")
require("plugins.window.mappings")
