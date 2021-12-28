local map = require("utils").map

map("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>r", ":NvimTreeRefresh<CR>", {noremap = true})
