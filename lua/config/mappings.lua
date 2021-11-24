local g = vim.g
local map = require("config.utils").map

g.mapleader = " "

-- Quickfix
map("n", "<leader>ck", ":cexpr []<CR>", { noremap = true })
map("n", "<leader>cc", ":cclose <CR>", { noremap = true })
map("n", "<leader>co", ":copen <CR>", { noremap = true })
map("n", "<leader>cf", ":cfdo %s/", { noremap = true })

require("config.core.navigation.mappings").init()
require("config.core.file-explorer.mappings")
require("config.core.terminal.mappings")
require("config.core.window.mappings")
