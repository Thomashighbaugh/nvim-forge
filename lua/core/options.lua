-- Search
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Indents, spaces
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- UI
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.showcmd = true
vim.o.cmdheight = 0
vim.opt.signcolumn = 'yes:1'
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append({ tab = '»-' })
vim.opt.listchars:append({ trail = '·' })
vim.opt.listchars:append({ extends = '»' })
vim.opt.listchars:append({ precedes = '«' })
vim.opt.fillchars:append({ eob = ' ', fold = ' ', foldsep = ' ', foldopen = '', foldclose = '' })
vim.opt.confirm = true
vim.opt.smoothscroll = true
vim.opt.winminwidth = 5

-- Text
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.selection = 'inclusive'
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.conceallevel = 0
vim.opt.virtualedit = 'onemore'

-- Folding
vim.o.foldenable = false

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Keys
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.mouse = 'a'

-- Cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.guicursor = {
    'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100',
}

-- Path
vim.opt.path:append('**')

-- Spell
vim.opt.spell = true
vim.opt.spelllang = { 'en' }

-- Split
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'

-- Other
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.url_effect_enabled = true -- Highlight URLs with an underline effect.

vim.g.autoformat_enabled = true -- Enable auto formatting at start.
vim.g.autopairs_enabled = true -- Enable autopairs at start.

-- Markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'lua', 'js=javascript' }
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

-- For treesitter commentstring
vim.opt.updatetime = 100
vim.g.skip_ts_context_commentstring_module = true

-- Disable providers for health checks
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_node_provider = 0
