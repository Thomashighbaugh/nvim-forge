--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  ╰──────────────────────────────────────────────────────────╯
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'b0o/schemastore.nvim',
        'saghen/blink.cmp',
    },
    config = function()
        -- ╭─────────────────────╮
        -- │ LSP CAPABILITIES    │
        -- ╰─────────────────────╯
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- ╭─────────────────────────────────╮
        -- │ LSP BORDER FOR :LSPINFO COMMAND │
        -- ╰─────────────────────────────────╯
        require('lspconfig.ui.windows').default_options.border = 'single'

        -- ╭───────────────────╮
        -- │ WINBAR WITH NAVIC │
        -- ╰───────────────────╯
        local navic = require('nvim-navic')

        -- ╭─────────────────────────────────────────────────────────╮
        -- │                   DIAGNOSTIC KEY MAPS                   │
        -- ╰─────────────────────────────────────────────────────────╯
        local opts = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end

        vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts('Open Diagnostic Window'))
        vim.keymap.set('n', '<space><left>', function()
            vim.diagnostic.jump({ count = -vim.v.count1 })
        end, opts('Previous Diagnostic'))
        vim.keymap.set('n', '<space><right>', function()
            vim.diagnostic.jump({ count = vim.v.count1 })
        end, opts('Next Diagnostic'))
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts('Send Diagnostic to Locallist'))

        -- ╭───────────────────────╮
        -- │ LSPATTACH AUTOCOMMAND │
        -- ╰───────────────────────╯
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Set completefunc for mini.completion compatibility
                vim.bo[ev.buf].completefunc = 'v:lua.vim.lsp.omnifunc'

                -- ╭─────────╮
                -- │ KEYMAPS │
                -- ╰─────────╯
                local bufopts = function(desc)
                    return { buffer = ev.buf, desc = desc }
                end
                -- All lsp keymaps starts with gr expept K.
                -- Default lsp keymaps. Setting the keymaps again, only to change the description.
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
                vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, bufopts('LSP Code Action'))
                vim.keymap.set({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action, bufopts('LSP Code Action'))
                vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts('LSP Rename'))
                vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts('LSP References'))
                -- Custom lsp keymaps.
                vim.keymap.set('n', 'grd', vim.lsp.buf.definition, bufopts('LSP Go to Definition'))
                vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, bufopts('LSP Go to Declaration'))
                vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, bufopts('LSP Go to Implementation'))
                vim.keymap.set('n', 'grf', function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts('LSP Formatting'))
                vim.keymap.set('n', 'grk', vim.lsp.buf.signature_help, bufopts('LSP Singature Help'))
                vim.keymap.set('n', 'grs', vim.lsp.buf.document_symbol, bufopts('LSP Document Symbols'))
                vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, bufopts('LSP Type Definition'))
                vim.keymap.set('n', 'grwa', vim.lsp.buf.add_workspace_folder, bufopts('LSP Add Workspace Folder'))
                vim.keymap.set('n', 'grwr', vim.lsp.buf.remove_workspace_folder, bufopts('LSP Remove Workspace Folder'))
                vim.keymap.set('n', 'grwl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts('LSP List Workspace Folder'))

                -- Get client
                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                -- ╭─────────────╮
                -- │ INLAY HINTS │
                -- ╰─────────────╯
                if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                else
                    vim.lsp.inlay_hint.enable(false)
                end

                -- ╭────────────╮
                -- │ NVIM-NAVIC │
                -- ╰────────────╯
                if client and client.server_capabilities and client.server_capabilities.documentSymbolProvider then
                    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
                    navic.attach(client, ev.buf)
                else
                    vim.o.winbar = ''
                end
            end,
        })

        -- ╭──────────────────────╮
        -- │ BORDER CONFIGURATION │
        -- ╰──────────────────────╯
        local border = {
            { '╭', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╮', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '╯', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╰', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '┌', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '┐', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '┘', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '└', 'FloatBorder' },
            { '│', 'FloatBorder' },
        }

        local handlers = {
            ['textDocument/hover'] = function(err, result, ctx, config)
                return vim.lsp.handlers.hover(
                    err,
                    result,
                    ctx,
                    vim.tbl_extend('force', config or {}, { border = border })
                )
            end,
            ['textDocument/signatureHelp'] = function(err, result, ctx, config)
                return vim.lsp.handlers.signature_help(
                    err,
                    result,
                    ctx,
                    vim.tbl_extend('force', config or {}, { border = border })
                )
            end,
        }

        -- ╭───────────────────╮
        -- │ DIAGNOSTIC CONFIG │
        -- ╰───────────────────╯
        vim.diagnostic.config({
            virtual_text = {
                prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
            },
            jump = {
                float = true,
            },
            float = { border = 'single' },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = ' ',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                    [vim.diagnostic.severity.INFO] = ' ',
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
                    [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
                    [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
                    [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
                },
            },
        })

        --  ╭──────────────────────────────────────────────────────────╮
        --  │                         SERVERS                          │
        --  ╰──────────────────────────────────────────────────────────╯

        -- ╭────────────╮
        -- │ LUA SERVER │
        -- ╰────────────╯
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, 'lua/?.lua')
        table.insert(runtime_path, 'lua/?/init.lua')
        vim.lsp.config.lua_ls = {
            capabilities = capabilities,
            handlers = handlers,
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    -- Make the server aware of Neovim runtime files
                    library = { vim.env.VIMRUNTIME },
                    -- Or vim.fn.expand('$VIMRUNTIME/lua'),
                    --    vim.api.nvim_get_runtime_file("", true),
                    -- })
                    workspace = {
                        checkThirdParty = false,
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                    telemetry = { enabled = false },
                })
            end,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('.', true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        }

        -- ╭────────────╮
        -- │ NIX SERVER │
        -- ╰────────────╯
        vim.lsp.config.nil_ls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                ['nil'] = {
                    formatting = {
                        command = { 'nixfmt' },
                    },
                },
            },
        }

        -- ╭─────────────╮
        -- │ PYTHON LS  │
        -- ╰─────────────╯
        vim.lsp.config.pyright = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = 'workspace',
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        }

        -- ╭─────────────╮
        -- │ PYTHON RUFF │
        -- ╰─────────────╯
        vim.lsp.config.ruff = {
            capabilities = capabilities,
            handlers = handlers,
            init_options = {
                settings = {
                    args = {},
                },
            },
        }

        -- ╭────────────╮
        -- │ JSON LS    │
        -- ╰────────────╯
        local schemastore_ok, schemastore = pcall(require, 'schemastore')
        vim.lsp.config.jsonls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                json = {
                    schemas = schemastore_ok and schemastore.json.schemas() or {},
                    validate = { enable = true },
                },
            },
        }

        -- ╭────────────╮
        -- │ TSSERVER   │
        -- ╰────────────╯
        vim.lsp.config.ts_ls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = false,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = false,
                    },
                },
            },
        }

        -- ╭─────────────╮
        -- │ BASH LS     │
        -- ╰─────────────╯
        vim.lsp.config.bashls = {
            capabilities = capabilities,
            handlers = handlers,
            filetypes = { 'sh', 'zsh' },
        }

        -- ╭─────────────╮
        -- │ TAILWIND   │
        -- ╰─────────────╯
        vim.lsp.config.tailwindcss = {
            capabilities = capabilities,
            handlers = handlers,
            filetypes = {
                'html',
                'css',
                'scss',
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'svelte',
                'vue',
                'rust',
                'go',
                'tmpl',
                'gotmpl',
            },
            init_options = {
                userLanguages = {
                    rust = 'html',
                    go = 'html',
                    tmpl = 'html',
                    ['gotmpl.html'] = 'html',
                },
            },
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            { 'clsx\\(([^)]*)\\)', '(?: clsx\\(|")([^"]|[^)(]+)(?:",\\s"|\\))' },
                        },
                    },
                },
            },
        }

        -- ╭─────────────╮
        -- │ LTEX SERVER │
        -- ╰─────────────╯
        vim.lsp.config.ltex = {
            capabilities = capabilities,
            handlers = handlers,
            filetypes = { 'bibtex', 'markdown', 'latex', 'tex' },
            settings = {
                ltex = {
                    language = 'en-US',
                },
            },
        }

        -- ╭───────────────╮
        -- │ TEXLAB SERVER │
        -- ╰───────────────╯
        vim.lsp.config.texlab = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                texlab = {
                    auxDirectory = '.',
                    bibtexFormatter = 'texlab',
                    build = {
                        args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                        executable = 'latexmk',
                        forwardSearchAfter = false,
                        onSave = false,
                    },
                    chktex = {
                        onEdit = false,
                        onOpenAndSave = false,
                    },
                    diagnosticsDelay = 300,
                    formatterLineLength = 100,
                    forwardSearch = {
                        args = {},
                    },
                    latexFormatter = 'latexindent',
                    latexindent = {
                        modifyLineBreaks = false,
                    },
                },
            },
        }

        -- ╭────────────╮
        -- │ GOLang LS  │
        -- ╰────────────╯
        vim.lsp.config.gopls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            },
        }

        -- ╭────────────╮
        -- │ RUST LS    │
        -- ╰────────────╯
        vim.lsp.config.rust_analyzer = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = 'clippy',
                    },
                    diagnostics = {
                        enable = true,
                    },
                },
            },
        }

        -- ╭────────────╮
        -- │ YAML LS    │
        -- ╰────────────╯
        vim.lsp.config.yamlls = {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                yaml = {
                    schemas = schemastore_ok and schemastore.yaml.schemas() or {},
                },
            },
        }

        -- ╭──────────────╮
        -- │ TYPST SERVER │
        -- ╰──────────────╯
        vim.lsp.config.tinymist = {
            capabilities = capabilities,
            handlers = handlers,
            single_file_support = true,
            root_dir = function()
                return vim.fn.getcwd()
            end,
            settings = {
                formatterMode = 'typstyle',
            },
        }
    end,
}
