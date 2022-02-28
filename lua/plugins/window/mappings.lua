local map = require("utils").map

map("n", "<C-W><C-M>", ":WinShift<CR>", { noremap = true })
map("t", "<C-W>m", ":WinShift<CR>", { noremap = true })
map("t", "<C-W>X", ":WinShift swap<CR>", { noremap = true })
map("t", "<C-W-H>", ":WinShift left<CR>", { noremap = true })
map("t", "<C-W-J>", ":WinShift down<CR>", { noremap = true })
map("t", "<C-W-K>", ":WinShift up<CR>", { noremap = true })
map("t", "<C-W-L>", ":WinShift right<CR>", { noremap = true })
