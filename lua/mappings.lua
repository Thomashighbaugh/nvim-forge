local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
-- OPEN TERMINALS --
map('n', '<C-l>', [[<Cmd>vnew term://zsh <CR>]], opt) -- term over right
map('n', '<C-x>', [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  term bottom
map('n', '<C-t>t', [[<Cmd> tabnew | term <CR>]], opt) -- term newtab

map('n', '<C-t>n', [[<Cmd> tabnew<CR> ]], opt) -- term newtab
map('n', '<C-x>', [[<Cmd> split<CR> ]], opt) -- term newtab
map('n', '<C-v>', [[<Cmd> vsplit<CR> ]], opt) -- term newtab
-- COPY EVERYTHING --
map('n', '<C-a>', [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map('n', '<leader>n', [[ <Cmd> set numbers<CR>]], opt)

map('n', '<C-s>', [[ <Cmd> w <CR>]], opt)

-- explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opt)

-- Comments
map('n', '<leader>/', ':CommentToggle<CR>', opt)
map('v', '<leader>/', ':CommentToggle<CR>', opt)

-- dashboard
map('n', '<Leader>;', ':Dashboard<CR>', opt)
