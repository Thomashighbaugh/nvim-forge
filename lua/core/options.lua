local options = {
  background = "dark",
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 0, -- more space in the neovim command line for displaying messages
  completeopt = { "preview", "menu", "menuone" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  confirm = true, -- Confirm before exiting a modified buffer
  cursorline = true, -- highlight the current line
  expandtab = true, -- convert tabs to spaces
  fileencoding = "utf-8", -- the encoding written to a file
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --hidden --vimgrep --smart-case",
  hidden = true, -- Enable modified buffers in background
  history = 500, -- Use the 'history' option to set the number of lines from command mode that are remembered.
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  inccommand = "nosplit",
  incsearch = true, -- incremental search
  laststatus = 3,
  linespace = 8,
  list = true, -- Show some invisible characters (tabs...
  listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<",
  mouse = "a", -- allow the mouse to be used in neovim
  mousemoveevent = true, -- allow mapping mouse movement
  number = true, -- set numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}
  pumblend = 10, -- popup blend
  pumheight = 10, -- pop up menu height
  relativenumber = false, -- no relative numbered lines
  scrolloff = 3, -- Minimal number of screen lines to keep above and below the cursor
  selection = "inclusive", -- "inclusive", "exclusive" or "old"
  shiftround = true, -- Round indent
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showcmd = false,
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  sidescrolloff = 5,
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  spelllang = { "en" },
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = true, -- creates a swapfile
  syntax = "off",
  tabstop = 2, -- insert 2 spaces for a tab
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true,
  titlestring = "%<%F%=%l/%L - nvim",
  undofile = true, -- enable persistent undo
  undolevels = 10000,
  updatetime = 500, -- faster completion (4000ms default)
  virtualedit = "onemore",
  winminwidth = 5, -- minimum window width
  wrap = true, -- scrolling sideways sucks
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- Default splitting will cause your main splits to jump when opening an edgebar.
  -- To prevent this, set `splitkeep` to either `screen` or `topline`.
  splitkeep = "screen",

  -- use fold
  foldlevelstart = 99,
  foldlevel = 99,
  foldenable = true,
  foldcolumn = "1",
  fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },
  -- Command Line Completion
  wildmode = "longest:full,full", -- Command-line completion mode
  wildignorecase = true,
  wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]],
  -- session
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shortmess:append("c")
vim.opt.viewoptions:remove("curdir") -- disable saving current directory with views

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,]")
vim.cmd([[set iskeyword+=-]])
-- diable open fold with `l`
vim.cmd([[set foldopen-=hor]])

if vim.g.neovide then
  vim.opt.guifont = "Rounded Mplus 1c ExtraBold:h10" -- the font used in graphical neovim applications
  vim.g.neovide_scale_factor = 1
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
