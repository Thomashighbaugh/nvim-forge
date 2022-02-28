local M = {}
local wiki = {}

wiki.path = "$HOME/.vimwiki"

wiki.syntax = "markdown"

wiki.ext = ".md"

wiki.list_margin = 0
wiki.auto_toc = 1
wiki.auto_generate_links = 1

local wiki2 = {}
wiki2.path = "~/HinduismWiki"
wiki2.path_html = "~/HinduismWiki/html"
wiki2.syntax = "markdown"
wiki2.ext = ".md"
wiki2.list_margin = 0
wiki2.auto_toc = 1
wiki2.auto_generate_links = 1

local wiki3 = {}
wiki3.path = "~/Notes"
wiki3.path_html = "~/Notes/html"
wiki3.syntax = "markdown"
wiki3.ext = ".md"
wiki3.list_margin = 0
wiki3.auto_toc = 1
wiki3.auto_generate_links = 1

vim.g.vimwiki_list = { wiki, wiki2, wiki3 }
vim.g.vimwiki_autowriteall = 1
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_use_mouse = 1
vim.g.vimwiki_folding = "custom"
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_table_mappings = 0

return M
