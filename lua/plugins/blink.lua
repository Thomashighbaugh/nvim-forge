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
            trigger = {
                -- In markdown, suppress ALL backspace-related triggers to avoid
                -- re-cascading the full completion engine on every delete.
                show_on_backspace = false,
                show_on_backspace_in_keyword = false,
                show_on_backspace_after_accept = false,
                show_on_backspace_after_insert_enter = false,
                show_on_keyword = true, -- still fire, but delayed via menu auto_show + min_keyword_length
                -- Block trigger characters (like `.`) that are common in prose
                show_on_blocked_trigger_characters = function(ctx)
                    if vim.bo.filetype == 'markdown' then
                        return { ' ', '\n', '\t', '.', '/', '(', '[', ':', '!' }
                    end
                    return { ' ', '\n', '\t' }
                end,
            },
            menu = {
                -- Delay the menu in markdown so fast typing / backspace doesn't
                -- spawn ripgrep + lsp + spell + dictionary on every keystroke.
                -- The engine still runs, but the menu appearance is deferred
                -- until you actually pause long enough to want to look at it.
                auto_show_delay_ms = function(ctx)
                    return vim.bo.filetype == 'markdown' and 600 or 0
                end,
            },
            list = {
                selection = {
                    preselect = function(ctx)
                        return vim.bo.filetype ~= 'markdown'
                    end,
                    auto_insert = true,
                },
            },
        },
        signature = { enabled = true },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'ripgrep', 'spell', 'dictionary' },
            -- In prose (markdown), require at least 3 typed chars before completion fires
            -- instead of the default 0. This avoids spawning the engine on every 1-2 char
            -- prefix which is where most backspace/rapid-typing overhead comes from.
            min_keyword_length = function()
                return vim.bo.filetype == 'markdown' and 3 or 0
            end,
            per_filetype = {
                -- Code filetypes — buffer is useful here for identifiers
                lua = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                python = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                rust = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                go = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                typescript = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                javascript = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                typescriptreact = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                javascriptreact = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                java = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                c = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                cpp = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                sh = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                zsh = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                bash = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                yaml = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                json = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                html = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
                css = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                scss = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                less = { 'lsp', 'path', 'snippets', 'buffer', 'css_vars' },
                -- Prose filetypes — no buffer, spell/dictionary win
                markdown = { 'lsp', 'path', 'snippets', 'emoji', 'ripgrep', 'spell', 'dictionary' },
                text = { 'spell', 'dictionary', 'register' },
                help = { 'spell', 'dictionary' },
                -- Special filetypes
                gitcommit = { 'conventional_commits', 'git', 'nerdfont' },
                ['dap-repl'] = { 'dap' },
            },
            providers = {
                -- Snippets — friendly-snippets + custom snippets from scissors
                snippets = {
                    name = 'Snippets',
                    opts = {
                        search_paths = {
                            vim.fn.stdpath('config') .. '/snippets',
                        },
                    },
                },
                -- Buffer — code-only, capped at 3 items so stale codebases don't flood
                buffer = {
                    name = 'Buffer',
                    max_items = 3,
                },
                spell = {
                    name = 'Spell',
                    module = 'blink-cmp-spell',
                    score_offset = 20,
                    opts = {},
                },
                ripgrep = {
                    name = 'Ripgrep',
                    module = 'blink-ripgrep',
                    opts = {
                        prefix_min_len = 4,
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
                    score_offset = 20,
                    opts = {
                        dictionary_search_threshold = 3,
                    },
                },
                dict = {
                    name = 'Dict',
                    module = 'blink-cmp-dictionary',
                    score_offset = 20,
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
