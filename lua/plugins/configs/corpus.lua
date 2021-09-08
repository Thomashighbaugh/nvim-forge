require 'corpus'
-- init.lua (as Lua global):
CorpusDirectories = {
    ['~/.vimwiki/corpus'] = {
        autocommit = true,
        autoreference = 1,
        autotitle = 1,
        base = './',
        transform = 'web'
    },
    ['~/256/Dropbox/HinduismWiki/zettelkasten'] = {
        autocommit = false,
        autoreference = 1,
        autotitle = 1,
        base = './',
        transform = 'web'
    }
}
