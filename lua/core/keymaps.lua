local Utils = require("utils")
local map = Utils.safe_keymap_set

-- ┣━━━━━━━━━━━━━━━━━━━━━━━┫ General Mappings ┣━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all" })
map("n", "<leader><Tab>", "<c-6>", { desc = "Switch buffer" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- ┣━━━━━━━━━━━━━━━━━━━┫ Better Window Navigation ┣━━━━━━━━━━━━━━━━━━━┫

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Indentation ┣━━━━━━━━━━━━━━━━━━━━━━━┫

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "p", '"_dP')

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━┫ Resize Windows ┣━━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ┣━━━━━━━━━━━━━━━━━━┫ Move Text Up/Down By Line ┣━━━━━━━━━━━━━━━━┫

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

-- ┣━━━━━━━━━━━━━━━━━━━━━━━┫ Clear Highlights ┣━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", ";", ":noh<CR>", { desc = "Clear search" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Inspect ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<F2>", "<cmd>Inspect<CR>", { desc = "Inspect highlight fallback" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━┫ Split Windows ┣━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<leader>\\", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>/", ":split<CR>", { desc = "Split window horizontally" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Swap Window ┣━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<A-o>", "<C-w>r", { desc = "Rotate window" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Select All ┣━━━━━━━━━━━━━━━━━━━━━━━━━━┫

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Fuzzy Search ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫

vim.keymap.set("n", "<C-f>", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes"))
end, { desc = "[/] Fuzzily search in current buffer]" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━┫ Save Function ┣━━━━━━━━━━━━━━━━━━━━━━┫

map("v", "<C-s>", "<esc><cmd>wa!<cr>", { desc = "Save file" })
map("i", "<C-s>", "<esc><cmd>wa!<cr>", { desc = "Save file" })
map("n", "<C-s>", "<esc><cmd>wa!<cr>", { desc = "Save file" })
map("x", "<C-s>", "<esc><cmd>wa!<cr>", { desc = "Save file" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Comment Bars ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫

-- With Titles --
map("v", "<M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
map("i", "<M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
map("n", "<M-->", "<cmd>lua require('comment-box').lcline(11)<cr>", { desc = "comment line" })
-- No Titles --
map("v", "<C-M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })
map("i", "<C-M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })
map("n", "<C-M-->", "<cmd>lua require('comment-box').line(11)<cr>", { desc = "alternative comment line" })

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

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━┫ QuickNotes ┣━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Create --
map("n", "<leader>qcc", "<cmd>lua require('quicknote').NewNoteAtCurrentLine()<cr>", { desc = "QuickNote Current Line" })
map(
  "n",
  "<leader>qcd",
  "<cmd>:lua require('quicknote').NewNoteAtCWD()<cr>",
  { desc = "Create a New Note For the Current Working Directory" }
)
map(
  "n",
  "<leader>qcg",
  "<cmd>:lua require('quicknote').NewNoteAtGlobal()<cr>",
  { desc = "Create a New Globally Scoped Note" }
)

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Open --
map(
  "n",
  "<leader>qoc",
  "<cmd>:lua require('quicknote').OpenNoteAtCurrentLine()<cr>",
  { desc = "Open a New Globally Scoped Note" }
)
map(
  "n",
  "<leader>qod",
  "<cmd>:lua require('quicknote').OpenNoteAtCWD()<cr>",
  { desc = "Open a New Note For the Current Working Directory" }
)
map(
  "n",
  "<leader>qog",
  "<cmd>:lua require('quicknote').OpenNoteAtGlobal()<cr>",
  { desc = "Open a New Globally Scoped Note" }
)

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Delete --
map(
  "n",
  "<leader>qdc",
  "<cmd>:lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
  { desc = "Delete Note At Current Line" }
)
map(
  "n",
  "<leader>qdd",
  "<cmd>:lua require('quicknote').DeleteNoteAtCWD()<cr>",
  { desc = "Delete Note At Current Working Directory" }
)
map(
  "n",
  "<leader>qdg",
  "<cmd>:lua require('quicknote').DeleteNoteAtGlobal()<cr>",
  { desc = "Delete Globally Scoped Note" }
)

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- List --
map(
  "n",
  "<leader>qlc",
  "<cmd>:lua require('quicknote').ListNotesForCurrentBuffer()<cr>",
  { desc = "List Notes At Current Line" }
)
map(
  "n",
  "<leader>qld",
  "<cmd>:lua require('quicknote').ListNotesForCWD()<cr>",
  { desc = "List Notes For Current Working Directory" }
)
map(
  "n",
  "<leader>qlg",
  "<cmd>:lua require('quicknote').ListNotesForGlobal()<cr>",
  { desc = "List Globally Scoped Notes" }
)

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Jump --
map("n", "<leader>qjj", "<cmd>:lua require('quicknote').JumpToPreviousNote()<cr>", { desc = "Jump To Prior Note" })
map("n", "<leader>qjk", "<cmd>:lua require('quicknote').JumpToNextNote()<cr>", { desc = "Jump To Next Note" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Get --
map(
  "n",
  "<leader>qgc",
  "<cmd>:lua require('quicknote').GetNotesForCurrentBuffer()<cr>",
  { desc = "Get Note For Current Buffer" }
)
map(
  "n",
  "<leader>qgd",
  "<cmd>:lua require('quicknote').GetNotesForCWD()<cr>",
  { desc = "Get Notes For Current Working Directory" }
)
map(
  "n",
  "<leader>qgg",
  "<cmd>:lua require('quicknote').GetNotesForGlobal()<cr>",
  { desc = "Get Globally Scoped Notes" }
)

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Signs --
map("n", "<leader>qss", "<cmd>:lua require('quicknote').ShowNoteSigns()<cr>", { desc = "Show Note Signs" })
map("n", "<leader>qsd", "<cmd>:lua require('quicknote').HideNoteSigns()<cr>", { desc = "Hide Note Signs" })
map("n", "<leader>qst", "<cmd>:lua require('quicknote').ToggleNoteSigns()<cr>", { desc = "Toggle Note Signs" })

-- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
-- Export --
map(
  "n",
  "<leader>qec",
  "<cmd>:lua require('quicknote').ExportNotesForCurrentBuffer()<cr>",
  { desc = "Export Notes For Current Buffer" }
)
map(
  "n",
  "<leader>qed",
  "<cmd>:lua require('quicknote').ExportNotesForCWD()<cr>",
  { desc = "Export Notes For Current Working Directory" }
)
map(
  "n",
  "<leader>qeg",
  "<cmd>:lua require('quicknote').ExportNotesForGlobal()<cr>",
  { desc = "Export Globally Scoped Notes" }
)
-- Import --
map(
  "n",
  "<leader>qic",
  "<cmd>:lua require('quicknote').ImportNotesForCurrentBuffer()<cr>",
  { desc = "Import Notes For Current Buffer" }
)
map(
  "n",
  "<leader>qid",
  "<cmd>:lua require('quicknote').ImportNotesForCWD()<cr>",
  { desc = "Import Notes For Current Working Directory" }
)
map(
  "n",
  "<leader>qig",
  "<cmd>:lua require('quicknote').ImportNotesForGlobal()<cr>",
  { desc = "Import Globally Scoped Notes" }
)
-- Mode --
map("n", "<leader>qmt", "<cmd>:lua require('quicknote').ToggleMode()<cr>", { desc = "Toggle Mode" })
map("n", "<leader>qmp", "<cmd>:lua require('quicknote').SwitchToPortableMode()", { desc = "Switch To Portable Mode" })
map("n", "<leader>qmr", "<cmd>:lua require('quicknote').SwitchToResidentMode()", { desc = "Switch To Resident Mode" })
