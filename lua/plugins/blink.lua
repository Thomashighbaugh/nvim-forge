return {
    'saghen/blink.cmp',
    version = '1.*',
    event = 'InsertEnter',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'ribru17/blink-cmp-spell',
        'mikavilpas/blink-ripgrep.nvim',
        'moyiz/blink-emoji.nvim',
        'archie-judd/blink-cmp-words',
        'Kaiser-Yang/blink-cmp-dictionary',
        'garyhurtz/blink_cmp_kitty',
        'marcoSven/blink-cmp-yanky',
        'bydlw98/blink-cmp-env',
        'Kaiser-Yang/blink-cmp-git',
        'disrupted/blink-cmp-conventional-commits',
        'jdrupal-dev/css-vars.nvim',
        'MahanRahmati/blink-nerdfont.nvim',
        'mayromr/blink-cmp-dap',
        'jmbuhr/cmp-pandoc-references',
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            ghost_text = { enabled = true },
        },
        signature = { enabled = true },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
            per_filetype = {
                gitcommit = { 'conventional_commits', 'git', 'nerdfont', 'buffer' },
                markdown = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer',
                    'emoji',
                    'nerdfont',
                    'dictionary',
                    'ripgrep',
                    'pandoc_references',
                },
                text = { 'buffer', 'spell', 'dictionary', 'register' },
                lua = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                css = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                scss = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                less = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                ['dap-repl'] = { 'dap' },
            },
            providers = {
                spell = {
                    name = 'Spell',
                    module = 'blink-cmp-spell',
                    opts = {},
                },
                ripgrep = {
                    name = 'Ripgrep',
                    module = 'blink-ripgrep',
                    opts = {
                        prefix_min_len = 3,
                        backend = {
                            use = 'gitgrep-or-ripgrep',
                        },
                    },
                },
                emoji = {
                    name = 'Emoji',
                    module = 'blink-emoji',
                    score_offset = 15,
                    opts = {
                        insert = true,
                        trigger = function()
                            return { ':' }
                        end,
                        should_show_items = function()
                            return vim.tbl_contains({ 'gitcommit', 'markdown' }, vim.o.filetype)
                        end,
                    },
                },
                thesaurus = {
                    name = 'blink-cmp-words',
                    module = 'blink-cmp-words.thesaurus',
                },
                dictionary = {
                    name = 'blink-cmp-words',
                    module = 'blink-cmp-words.dictionary',
                    opts = {
                        dictionary_search_threshold = 3,
                    },
                },
                dict = {
                    name = 'Dict',
                    module = 'blink-cmp-dictionary',
                    min_keyword_length = 3,
                    opts = {
                        force_fallback = true,
                    },
                },
                kitty = {
                    name = 'kitty',
                    module = 'blink_cmp_kitty',
                },
                yank = {
                    name = 'yank',
                    module = 'blink-yanky',
                    opts = {
                        minLength = 5,
                        onlyCurrentFiletype = false,
                    },
                },
                env = {
                    name = 'Env',
                    module = 'blink-cmp-env',
                    opts = {
                        show_braces = false,
                        show_documentation_window = true,
                    },
                },
                git = {
                    name = 'Git',
                    module = 'blink-cmp-git',
                    enabled = function()
                        return vim.tbl_contains({ 'octo', 'gitcommit', 'markdown' }, vim.bo.filetype)
                    end,
                },
                conventional_commits = {
                    name = 'Conventional Commits',
                    module = 'blink-cmp-conventional-commits',
                    enabled = function()
                        return vim.bo.filetype == 'gitcommit'
                    end,
                },
                css_vars = {
                    name = 'CSS Variables',
                    module = 'css-vars.blink',
                },
                nerdfont = {
                    name = 'Nerd Fonts',
                    module = 'blink-nerdfont',
                    score_offset = 15,
                    opts = {
                        insert = true,
                    },
                },
                dap = {
                    name = 'DAP',
                    module = 'blink-cmp-dap',
                },
                pandoc_references = {
                    name = 'Pandoc References',
                    module = 'cmp-pandoc-references.blink',
                    enabled = function()
                        return vim.tbl_contains({ 'markdown', 'pandoc' }, vim.bo.filetype)
                    end,
                },
            },
        },
        fuzzy = {
            implementation = 'prefer_rust_with_warning',
        },
    },
    opts_extend = { 'sources.default', 'sources.per_filetype' },
}
