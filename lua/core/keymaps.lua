local map = Utils.safe_keymap_set

-------------------- General Mappings --------------------------
map("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all" })

-------------------- Better window navigation ------------------
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-------------------- Press jk fast to enter --------------------
map("i", "jk", "<ESC>", { desc = "Escape from insert mode" })
map("i", "Jk", "<ESC>", { desc = "Escape from insert mode" })
map("i", "jK", "<ESC>", { desc = "Escape from insert mode" })
-- map("i", "JK", "<ESC>", { desc = "Escape from insert mode" })

-------------------- Stay in indent mode ------------------------
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "p", '"_dP')

-------------------- Resize windows ----------------------------
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-------------------- Move text up/ down ------------------------
-- Normal --
map("n", "<A-S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- Block --
map("x", "<A-S-j>", ":move '>+1<CR>gv-gv", { desc = "Move down" })
map("x", "<A-S-k>", ":move '<-2<CR>gv-gv", { desc = "Move up" })
-- Insert --
map("i", "<A-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- Visual --
map("v", "<A-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-------------------- No highlight ------------------------------
map("n", ";", ":noh<CR>", { desc = "Clear search" })

-------------------- Inspect --------------------------------
map("n", "<F2>", "<cmd>Inspect<CR>", { desc = "Inspect highlight fallback" })

-------------------- split window ------------------------------
map("n", "<leader>\\", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>/", ":split<CR>", { desc = "Split window horizontally" })

-------------------- Switch two windows ------------------------
map("n", "<A-o>", "<C-w>r", { desc = "Rotate window" })

----------------- HACK: Toggle pin scrolloff -------------------
map("n", "<leader>to", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle pin scrolloff" })

------------------- Select all --------------------------------
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

map({ "n", "i", "v" }, "<C-U>", "<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>")
map({ "n", "i", "v" }, "<C-D>", "<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>")
-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Comment Bars ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫

-- With Titles --
map("v", "<C-M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
map("i", "<C-M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
map("n", "<C-M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
-- No Titles --
map("v", "<M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })
map("i", "<M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })
map("n", "<M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })

-- Tiltle Boxes --
map("n", "<leader>Ct", "<cmd>lua require('comment-box').ccbox(3)<cr>", { desc = "Titlebox" })
map("n", "<leader>Cs", "<cmd>lua require('comment-box').labox(17)<cr>", { desc = "Subtitle Box" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Trouble ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Trouble Workspace Diagnostics" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Trouble Document Diagnostics" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Quickfix" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble Location List" })
map("n", "<leader>xL", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble References" })

------------------ Fuzzy Search --------------------------------
vim.keymap.set("n", "<C-/>", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes"))
end, { desc = "[/] Fuzzily search in current buffer]" })
