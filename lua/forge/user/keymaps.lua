local keymap = require('forge.core.keymap')
local nmap   = keymap.nmap
local vmap   = keymap.vmap
local tmap   = keymap.tmap
local imap   = keymap.imap


-- Resize window panes, we can use those arrow keys
-- to help use resize windows - at least we give them some purpose
nmap('<Leader><Up>', [[<Cmd>resize +2<CR>]])
nmap('<Leader><Down>', [[<Cmd>resize -2<CR>]])
nmap('<Leader><Left>', [[<Cmd>vertical resize -2<CR>]])
nmap('<Leader><Right>', [[<Cmd>vertical resize +2<CR>]])

-- Map Esc, to perform quick switching between Normal and Insert mode
imap('jk', [[<Esc>]])

-- Map escape from terminal input to Normal mode
tmap('<Esc>', [[<C-\><C-n>]])
tmap('<C-[>', [[<C-\><C-n>]])

-- Disable highlights
nmap('<Leader><CR>', [[<Cmd>noh<CR>]])

-- Buffer maps
-- ---
-- List all buffers
nmap('<Leader>bl', [[<Cmd>buffers<CR>]])
-- Go to next buffer
nmap('<C-l>', [[<Cmd>bnext<CR>]])
nmap('<Leader>bn', [[<Cmd>bnext<CR>]])
-- Go to previous buffer
nmap('<C-h>', [[<Cmd>bprevious<CR>]])
nmap('<Leader>bp', [[<Cmd>bprevious<CR>]])
-- Close the current buffer, and more?
nmap('<Leader>bd', [[<Cmd>bp<Bar>sp<Bar>bn<Bar>bd<CR>]])
-- Close all buffer except current
nmap('<Leader>bx', [[<Cmd>%bd<Bar>e#<Bar>bd#<CR>]])

-- Text maps
-- ---
-- Move a line of text Alt+[j/k]
nmap('<M-j>', [[mz:m+<CR>`z]])
nmap('<M-k>', [[mz:m-2<CR>`z]])
vmap('<M-j>', [[:m'>+<CR>`<my`>mzgv`yo`z]])
vmap('<M-k>', [[:m'<-2<CR>`>my`<mzgv`yo`z]])

-- Edit vimrc and gvimrc
nmap('<Leader>ve', [[<Cmd>edit $MYVIMRC<CR>]])

-- Source the vimrc to reflect changes
nmap('<Leader>vs', [[<Cmd>ConfigReload<CR>]])

-- Reload file
nmap('<Leader>r', [[<Cmd>edit!<CR>]])

-- List maps
nmap('<Leader>mn', [[<Cmd>nmap<CR>]])
nmap('<Leader>mv', [[<Cmd>vmap<CR>]])
nmap('<Leader>mi', [[<Cmd>imap<CR>]])
nmap('<Leader>mt', [[<Cmd>tmap<CR>]])
nmap('<Leader>mc', [[<Cmd>cmap<CR>]])

-- Copy/Paste from clipboard
nmap('<Leader>y', [["+y]])
nmap('<Leader>p', [["+p]])
