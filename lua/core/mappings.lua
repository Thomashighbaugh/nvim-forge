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
end, { desc = "Toggle sgincolumn" })
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
map(
  "n",
  "<leader>to",
  "<cmd>lua require('utils.functions').toggle_colorcolumn()<cr>",
  { desc = "Toggle colorcolumn" }
)
map(
  "n",
  "<leader>tt",
  "<cmd>lua require('plugins.lsp.utils').toggle_virtual_text()<cr>",
  { desc = "Toggle Virtualtext" }
)
map("n", "<leader>ts", "<cmd>SymbolsOutline<cr>", { desc = "Toggle SymbolsOutline" })

local wk = require("which-key")

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

-- Register leader based mappings
wk.register({
  ["<tab>"] = { "<cmd>e#<cr>", "Prev buffer" },
  b = {
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
  f = {
    name = "Files",
    b = { "<cmd>Telescope file_browser grouped=true<cr>", "File browser" },
    f = { "<cmd>" .. require("utils.functions").project_files() .. "<cr>", "Find File" },
    p = { "<cmd>Neotree reveal toggle<cr>", "Toggle Filetree" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<cmd>w<cr>", "Save Buffer" },
  },
  m = {
    name = "Misc",
    C = { "<cmd>:CBcatalog<cr>", "Commentbox Catalog" },
    l = { "<cmd>source ~/.config/nvim/snippets/*<cr>", "Reload snippets" },
    p = { "<cmd>Lazy check<cr>", "Lazy check" },
  },
  M = {
    name = "Mind",
    c = {
      "<cmd> lua require('mind').wrap_smart_project_tree_fn(function(args) require'mind.commands'.create_node_index(args.get_tree(), require'mind.node'.MoveDir.INSIDE_END,args.save_tree, args.opts) end)<cr>", "Create Project Index"  },
    C = {"<cmd> lua  require('mind').wrap_main_tree_fn(function(args) require'mind.commands'.create_node_index(args.get_tree(), require'mind.node'.MoveDir.INSIDE_END,args.save_tree, args.opts)end) <cr>", "Create Main Index"},
    i = {"<cmd> lua vim.notify('initializing project tree')require('mind').wrap_smart_project_tree_fn(function(a)local b=a.get_tree()local c=require'mind.node'local d,e=c.get_node_by_path(b,'/Tasks',true)e.icon='陼'local d,f=c.get_node_by_path(b,'/Tasks/Backlog',true)f.icon=' 'local d,g=c.get_node_by_path(b,'/Tasks/On-going',true)g.icon=' 'local d,h=c.get_node_by_path(b,'/Tasks/Done',true)h.icon=' 'local d,i=c.get_node_by_path(b,'/Tasks/Cancelled',true)i.icon=' 'local d,j=c.get_node_by_path(b,'/Notes',true)j.icon=' 'a.save_tree()end) <cr>", "Initialize Mind Directories"},
    l = {"<cmd> lua require('mind').wrap_smart_project_tree_fn(function(a)require'mind.commands'.copy_node_link_index(a.get_tree(),nil,a.opts)end) <cr>", "Copy Node Link to Project Index"},
    L = {"<cmd> lua require('mind').wrap_main_tree_fn(function(a)require'mind.commands'.copy_node_link_index(a.get_tree(),nil,a.opts)end) <cr>", "Copy Node Link to Main Index"},
    j = {"<cmd> lua require('mind').wrap_main_tree_fn(function(a)local b=a.get_tree()local c=vim.fn.strftime('/Journal/%Y/%b/%d')local d,e=require'mind.node'.get_node_by_path(b,c,true)if e==nil then vim.notify('cannot open journal 🙁',vim.log.levels.WARN)return end;require'mind.commands'.open_data(b,e,a.data_dir,a.save_tree,a.opts)a.save_tree()end) <cr>", "Open Journal"},
    M = {"<cmd> MindOpenMain <cr>", "Open Main Node Index"},
    m = {"<cmd> MindOpenSmartProject <cr>", "Open Project Index"},
    s = {"<cmd> lua require('mind').wrap_smart_project_tree_fn(function(a)require'mind.commands'.open_data_index(a.get_tree(),a.data_dir,a.save_tree,a.opts)end) <cr>", "Open Data Index for Project"},
    S = {"<cmd> lua require('mind').wrap_main_tree_fn(function(a)require'mind.commands'.open_data_index(a.get_tree(),a.data_dir,a.save_tree,a.opts)end) <cr>", "Open Data Index for Main"}

  },
  q = {
    name = "Quickfix",
    j = { "<cmd>cnext<cr>", "Next Quickfix Item" },
    k = { "<cmd>cprevious<cr>", "Previous Quickfix Item" },
    q = { "<cmd>lua require('utils.functions').toggle_qf()<cr>", "Toggle quickfix list" },
    t = { "<cmd>TodoQuickFix<cr>", "Show TODOs" },
  },
  t = { name = "Toggles" },
  -- hydra heads
  s = { "Search" },
  w = { "Windows" },
  z = { "Spelling" },
}, { prefix = "<leader>", mode = "n", default_options })
