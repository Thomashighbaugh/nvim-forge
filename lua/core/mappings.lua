local map = vim.keymap.set

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- switch buffer
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

-- Cancel search highlighting with ESC
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- Sort selected lines alphabetically
map("v", "<C-p>", "<cmd>Sort <cr>", { desc = "Sort Lines Alphabetically" })

-- move over a closing element in insert mode
map("i", "<C-l>", function()
	return require("utils.functions").escapePair()
end)

-- search like you are used to
map("n", "<C-f>", "/", { desc = "Search buffer" })

-- save like your are used to
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- toggles
map("n", "<leader>th", function()
	vim.o.list = vim.o.list == false and true or false
end, { desc = "Toggle hidden chars" })
map("n", "<leader>tl", function()
	vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })
map("n", "<leader>tv", function()
	vim.o.virtualedit = vim.o.virtualedit == "all" and "block" or "all"
end, { desc = "Toggle virtualedit" })
map("n", "<leader>ts", function()
	vim.o.spell = vim.o.spell == false and true or false
end, { desc = "Toggle spell" })
map("n", "<leader>tw", function()
	vim.o.wrap = vim.o.wrap == false and true or false
end, { desc = "Toggle wrap" })
map("n", "<leader>tc", function()
	vim.o.cursorline = vim.o.cursorline == false and true or false
end, { desc = "Toggle cursorline" })
map("n", "<leader>to", "<cmd>lua require('utils.functions').toggle_colorcolumn()<cr>", { desc = "Toggle colorcolumn" })
map(
	"n",
	"<leader>tt",
	"<cmd>lua require('plugins.lsp.utils').toggle_virtual_text()<cr>",
	{ desc = "Toggle Virtualtext" }
)
map("n", "<leader>tS", "<cmd>SymbolsOutline<cr>", { desc = "Toggle SymbolsOutline" })

-- Comment Box
map("v", "<leader>bb", "<cmd>CBllbox5<cr>", { desc = "left aligned fixed size box with left aligned text" })

map("v", "<leader>br", "<cmd>CBrrbox5<cr>", { desc = "left aligned fixed size box with left aligned text" })

map("v", "<leader>bc", "<cmd>CBccbox5<cr>", { desc = " center aligned fixed size box with center aligned text" })

map("i", "<M-l>", "<cmd>CBcline10<cr>", { desc = "centered line" })

local wk = require("which-key")

--  +-------------------------------------------------------------------------+

-- register non leader based mappings
wk.register({
	sa = "Add surrounding",
	sd = "Delete surrounding",
	sh = "Highlight surrounding",
	sn = "Surround update n lines",
	sr = "Replace surrounding",
	sF = "Find left surrounding",
	sf = "Replace right surrounding",
	ss = { "<cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>", "Jump to character" },
	st = { "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobject" },
})

--  +-------------------------------------------------------------------------+

-- Register leader based mappings
wk.register({
	["<tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
	b = {
		name = "Comment Box",
		b = {
			"<cmd>CBllbox5<cr>",
			"left aligned fixed size box with left aligned text",
		},

		c = {
			"<cmd>CBccbox5<cr>",
			"center aligned fixed size box with center aligned text",
		},

		r = {
			"<cmd>CBrrbox5<cr>",
			"right aligned fixed size box with right aligned text",
		},

		l = {
			"<cmd>CBcline10<cr>",
			"centered line",
		},
	},

	--  +-------------------------------------------------------------------------+

	B = {
		name = "Buffers",
		b = {
			"<cmd>Telescope buffers<cr>",
			"Find buffer",
		},
		D = {
			"<cmd>%bd|e#|bd#<cr>",
			"Close all but the current buffer",
		},
		d = { "<cmd>Bdelete<cr>", "Close buffer" },
	},

	--  +-------------------------------------------------------------------------+

	f = {
		name = "Files",
		b = { "<cmd>Telescope file_browser grouped=true<cr>", "File browser" },
		f = { "<cmd>" .. require("utils.functions").project_files() .. "<cr>", "Find File" },
		p = { "<cmd>Neotree reveal toggle<cr>", "Toggle Filetree" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		s = { "<cmd>w<cr>", "Save Buffer" },
	},

	--  +-------------------------------------------------------------------------+

	m = {
		name = "Misc",
		C = { "<cmd>:CBcatalog<cr>", "Commentbox Catalog" },
		S = { "<cmd>:Cheatsheet <cr>", "Open Cheatsheet" },
		l = { "<cmd>LuaSnipListAvailable <cr>", "List available snippets" },
		p = { "<cmd>Lazy check<cr>", "Lazy check" },
		u = { "<cmf>Lazy sync", "Update Packages" },
	},

	--  +-------------------------------------------------------------------------+

	q = {
		name = "Quickfix",
		j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
		k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
		q = { "<cmd>lua require('utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
		t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
	},
	--   +---------------------------------------------------------------+
	x = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Workspace Diagnostics" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Document Diagnostics" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Trouble Loc List" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Quick Fix" },
		s = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP References" },
	},
	--  +-------------------------------------------------------------------------+

	t = { name = "Toggles" },
	-- hydra heads
	s = { "Search" },
	w = { "Windows" },
	z = { "Spelling" },
}, { prefix = "<leader>", mode = { "n", "v" }, default_options })
