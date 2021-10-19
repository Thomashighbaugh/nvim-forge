local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "lspinstall")
if not (present1 or present2) then
    return
end

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = {noremap = true, silent = true}

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Mappings.

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspInstall + lspconfig stuff

local function setup_servers()
    lspinstall.setup()
    local servers = lspinstall.installed_servers()

    for _, lang in pairs(servers) do
        if lang ~= "lua" then
            lspconfig[lang].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = vim.loop.cwd
            }
        elseif lang == "lua" then
            lspconfig[lang].setup {
                root_dir = vim.loop.cwd,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {"vim"}
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            }
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- triggers FileType autocmd that starts the server
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            -- prefix = "",
            prefix = "",
            spacing = 0
        },
        signs = true,
        underline = true
    }
)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(
    function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end
)
if vim.fn.has("nvim-0.5.1") == 1 then
    vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
    vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
    vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
    vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
    vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
    vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
        require("lsputil.codeAction").code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers["textDocument/references"] = function(_, _, result)
        require("lsputil.locations").references_handler(nil, result, {bufnr = bufnr}, nil)
    end

    vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
        require("lsputil.locations").definition_handler(nil, result, {bufnr = bufnr, method = method}, nil)
    end

    vim.lsp.handlers["textDocument/declaration"] = function(_, method, result)
        require("lsputil.locations").declaration_handler(nil, result, {bufnr = bufnr, method = method}, nil)
    end

    vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method, result)
        require("lsputil.locations").typeDefinition_handler(nil, result, {bufnr = bufnr, method = method}, nil)
    end

    vim.lsp.handlers["textDocument/implementation"] = function(_, method, result)
        require("lsputil.locations").implementation_handler(nil, result, {bufnr = bufnr, method = method}, nil)
    end

    vim.lsp.handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
        require("lsputil.symbols").document_handler(nil, result, {bufnr = bufn}, nil)
    end

    vim.lsp.handlers["textDocument/symbol"] = function(_, _, result, _, bufn)
        require("lsputil.symbols").workspace_handler(nil, result, {bufnr = bufn}, nil)
    end
end
