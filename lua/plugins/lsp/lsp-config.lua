--  ╭──────────────────────────────────────────────────────────╮
--  │                    LSP CONFIGURATION                     │
--  │  Server definitions split into lua/plugins/lsp/servers/   │
--  ╰──────────────────────────────────────────────────────────╯
return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'b0o/schemastore.nvim',
        'saghen/blink.cmp',
    },
    config = function()
        -- ╭─────────────────────────────────╮
        -- │ LSP BORDER FOR :LSPINFO COMMAND │
        -- ╰─────────────────────────────────╯
        require('lspconfig.ui.windows').default_options.border = 'single'

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
                vim.bo[ev.buf].completefunc = 'v:lua.vim.lsp.omnifunc'

                local bufopts = function(desc)
                    return { buffer = ev.buf, desc = desc }
                end

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
                vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, bufopts('LSP Code Action'))
                vim.keymap.set({ 'n', 'v' }, '<M-CR>', vim.lsp.buf.code_action, bufopts('LSP Code Action'))
                vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts('LSP Rename'))
                vim.keymap.set('n', 'grr', vim.lsp.buf.references, bufopts('LSP References'))
                vim.keymap.set('n', 'grd', vim.lsp.buf.definition, bufopts('LSP Go to Definition'))
                vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, bufopts('LSP Go to Declaration'))
                vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, bufopts('LSP Go to Implementation'))
                vim.keymap.set('n', 'grf', function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts('LSP Formatting'))
                vim.keymap.set('n', 'grk', vim.lsp.buf.signature_help, bufopts('LSP Signature Help'))
                vim.keymap.set('n', 'grs', vim.lsp.buf.document_symbol, bufopts('LSP Document Symbols'))
                vim.keymap.set('n', 'grt', vim.lsp.buf.type_definition, bufopts('LSP Type Definition'))
                vim.keymap.set('n', 'grwa', vim.lsp.buf.add_workspace_folder, bufopts('LSP Add Workspace Folder'))
                vim.keymap.set('n', 'grwr', vim.lsp.buf.remove_workspace_folder, bufopts('LSP Remove Workspace Folder'))
                vim.keymap.set('n', 'grwl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts('LSP List Workspace Folder'))

                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                -- Inlay hints (built-in, Neovim 0.10+)
                if client and client.server_capabilities and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                else
                    vim.lsp.inlay_hint.enable(false)
                end

                -- Winbar with navic
                if client and client.server_capabilities and client.server_capabilities.documentSymbolProvider then
                    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
                    require('nvim-navic').attach(client, ev.buf)
                else
                    vim.o.winbar = ''
                end
            end,
        })

        -- ╭───────────────────╮
        -- │ DIAGNOSTIC CONFIG │
        -- ╰───────────────────╯
        vim.diagnostic.config({
            virtual_text = { prefix = '' },
            jump = { float = true },
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
        --  │              IMPORT PER-SERVER CONFIGS                    │
        --  ╰──────────────────────────────────────────────────────────╯
        -- Each server file calls vim.lsp.config.<server> = { ... }
        -- at module load time, so requiring them registers the configs.
        require('plugins.lsp.servers.lua_ls')
        require('plugins.lsp.servers.nil_ls')
        require('plugins.lsp.servers.pyright')
        require('plugins.lsp.servers.ruff')
        require('plugins.lsp.servers.jsonls')
        require('plugins.lsp.servers.ts_ls')
        require('plugins.lsp.servers.bashls')
        require('plugins.lsp.servers.tailwindcss')
        require('plugins.lsp.servers.cssls')
        require('plugins.lsp.servers.html')
        require('plugins.lsp.servers.ltex')
        require('plugins.lsp.servers.texlab')
        require('plugins.lsp.servers.gopls')
        require('plugins.lsp.servers.rust_analyzer')
        require('plugins.lsp.servers.yamlls')
        require('plugins.lsp.servers.tinymist')

        -- ╭────────────────────╮
        -- │ ENABLE LSP SERVERS │
        -- ╰────────────────────╯
        vim.lsp.enable({
            'lua_ls',
            'nil_ls',
            'pyright',
            'ruff',
            'jsonls',
            'ts_ls',
            'bashls',
            'tailwindcss',
            'cssls',
            'html',
            'ltex',
            'texlab',
            'gopls',
            'rust_analyzer',
            'yamlls',
            'tinymist',
        })
    end,
}
