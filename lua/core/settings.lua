local opt = vim.opt
   -- ------------------------------------------------- --
-- show my pretty colors please neovim
opt.termguicolors = true
   -- ------------------------------------------------- --
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.wildmode = { "longest", "list", "full" }
   -- ------------------------------------------------- --
-- Cool floating window popup menu for completion on command line
opt.pumblend = 0

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + { "longest", "full" }

opt.wildoptions = "pum"
   -- ------------------------------------------------- --
-- I prefer knowing what is going on when I press keys personally
opt.showmode = true
-- Knowing what I am typing also helps
opt.showcmd = true
-- Height of the command bar
opt.cmdheight = 2
-- Leave extra space in the gutter (I need to live somewhere)
opt.signcolumn = "yes"
-- Makes search act like search in modern browsers
opt.incsearch = true
-- show matching brackets when text indicator is over them
opt.showmatch = true
-- Show relative line numbers
opt.relativenumber = true
-- But show also actual number for the line we're on
opt.number = true
-- Ignore case when searching...
opt.ignorecase = true
-- ... unless there is a capital letter in the query
opt.smartcase = true
-- I like having buffers stay around
opt.hidden = true
-- Highlight the current line
opt.cursorline = true
-- I don't like my windows changing all the time
opt.equalalways = true
-- Normalize window splitting to what most would expect
opt.splitright = true
opt.splitbelow = true
-- Make updates happen faster
opt.updatetime = 200
-- Get rid of highlights once done with search
opt.hlsearch = false
-- Make it so there are always ten lines below my cursor
opt.scrolloff = 15
   -- ------------------------------------------------- --
-- Tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.colorcolumn = "80"
   -- ------------------------------------------------- --
opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1
   -- ------------------------------------------------- --
-- The bell just shortens my life by causing mild heart attaacks when it beeps
opt.belloff = "all"
   -- ------------------------------------------------- --
-- the joys of clipboard on Linux
opt.clipboard = "unnamedplus"
   -- ------------------------------------------------- --
opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }

   -- ------------------------------------------------- --
-- set the shell
opt.shell = "/bin/zsh"
   -- ------------------------------------------------- --
-- never bad to be able to undo
opt.undofile = true
   -- ------------------------------------------------- --
-- set joinspaces
opt.joinspaces = false
   -- ------------------------------------------------- --
-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

   -- ------------------------------------------------- --
-- auto write all buffers and not loose work
vim.o.autowriteall = true


