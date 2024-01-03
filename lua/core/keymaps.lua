local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   +---------------------------------------------------------------+

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Window Navigation                                             ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-l>", "<c-w>l", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Indent                                                        ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "p", '"_dP', opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Resize Window                                                 ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<A-C-j>", ":resize +1<CR>", opts)
map("n", "<A-C-k>", ":resize -1<CR>", opts)
map("n", "<A-C-h>", ":vertical resize +1<CR>", opts)
map("n", "<A-C-l>", ":vertical resize -1<CR>", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Move Lines                                                    ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Visual --
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
-- Block --
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Normal --
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
-- Insert --
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏  No highlight                                                 ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", ";", ":noh<CR>", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Split Windows                                                 ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<leader>\\", ":vsplit<CR>", opts)
map("n", "<leader>/", ":split<CR>", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Compile                                                       ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<c-m-n>", "<cmd>only | Compile<CR>", opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Inspect                                                       ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<F2>", "<cmd>Inspect<CR>", opts)
--   +---------------------------------------------------------------+
-- paste over currently selected text without yanking it
map("v", "p", '"_dp', opts)
map("v", "P", '"_dP', opts)

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏  switch buffer                                                ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏  Sort selected lines alphabetically                           ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("v", "<C-p>", "<cmd>Sort <cr>", { desc = "Sort Lines Alphabetically" })

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏  Terminal                                                     ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true }) -- back to normal mode in Terminal
map("t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
map("t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
map("t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
map("t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Save Function                                                 ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

map("v", "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save file" })
map("i", "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save file" })
map("n", "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save file" })
map("x", "<C-s>", "<esc><cmd>wa<cr>", { desc = "Save file" })

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏  Comment Box                                                  ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛
map("v", "<leader>Cn", "<cmd>CBlcbox13<cr>", { desc = "Comment Box Multi-Line Notation" })
map("v", "<leader>Cs", "<cmd>CBlrbox19<cr>", { desc = "Sub-Heading Comment Box" })
map("v", "<leader>Ch", "<cmd>CBlcbox8<cr>", { desc = "Heading Comment Box" })
map("v", "<M-->", "<cmd>CBline7<cr>", { desc = "comment line" })
map("i", "<M-->", "<cmd>CBline7<cr>", { desc = "comment line" })
map("n", "<M-->", "<cmd>CBline7<cr>", { desc = "comment line" })
map("v", "<C-M-->", "<cmd>CBline6<cr>", { desc = "alternative comment line" })
map("i", "<C-M-->", "<cmd>CBline6<cr>", { desc = "alternative comment line" })
map("n", "<C-M-->", "<cmd>CBline6<cr>", { desc = "alternative comment line" })
map("n", "<leader>C?", "<cmd>CBcatalog<cr>", { desc = "Comment Box Style Catalog" })
map("n", "<leader>Cn", "<cmd>CBlcbox13<cr>", { desc = "Comment Box Multi-Line Notation" })
map("n", "<leader>Cs", "<cmd>CBlrbox19<cr>", { desc = "Sub-Heading Comment Box" })
map("n", "<leader>Ch", "<cmd>CBlcbox5<cr>", { desc = "Heading Comment Box" })

--  ┏╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
--  ╏                                                               ╏
--  ╏ Fuzzy Search                                                  ╏
--  ╏                                                               ╏
--  ┗╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

vim.keymap.set("n", "<C-f>", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes"))
end, { desc = "[/] Fuzzily search in current buffer]" })
