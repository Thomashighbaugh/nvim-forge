--  ╭───────────────────────────────────────────────────────────────╮
--  │                                                               │
--  │                            Null LS                            │
--  │                                                               │
--  ╰───────────────────────────────────────────────────────────────╯

local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
nls.setup({
  sources = {
    nls.builtins.formatting.stylua.with({
      extra_args = {
        "--indent-width",
        "4",
        "--indent-type",
        "Spaces",
        "--column-width",
        "80",
        "--line-endings",
        "Unix",
        "--quote-style",
        "AutoPreferDouble",
      },
    }),
    --        nls.builtins.diagnostics.eslint_d,
    --        nls.builtins.code_actions.eslint_d,
    --        nls.builtins.code_actions.eslint_d,

    nls.builtins.formatting.prettierd.with({
      extra_args = { "--single-quote", "false" },
      filetypes = { "html", "json", "yaml", "markdown" },
    }),

    nls.builtins.completion.luasnip,
    nls.builtins.completion.tags,
    nls.builtins.formatting.rubyfmt,
    nls.builtins.formatting.rustfmt,
    nls.builtins.formatting.rustywind,
    nls.builtins.formatting.yamlfix,
    nls.builtins.diagnostics.actionlint,
    nls.builtins.diagnostics.statix,
    nls.builtins.diagnostics.trail_space,
    nls.builtins.diagnostics.deadnix,
    nls.builtins.diagnostics.statix,
    nls.builtins.diagnostics.todo_comments,
    nls.builtins.diagnostics.tsc,
    nls.builtins.diagnostics.zsh,
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.formatting.black,
    nls.builtins.formatting.cbfmt,
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.gofumpt,
    nls.builtins.formatting.latexindent.with({
      extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
    }),
    nls.builtins.code_actions.shellcheck,
    nls.builtins.code_actions.refactoring.with({
      filetypes = { "go", "javascript", "lua", "python", "typescript" },
    }),
    nls.builtins.code_actions.statix,
    nls.builtins.code_actions.ts_node_action,
    nls.builtins.formatting.alejandra,
    nls.builtins.formatting.fixjson,
    nls.builtins.formatting.markdownlint,
    nls.builtins.formatting.markdown_toc,
    nls.builtins.formatting.trim_newlines,
    nls.builtins.formatting.trim_whitespace,
    nls.builtins.code_actions.gitsigns,
    nls.builtins.formatting.shfmt,
  },
  on_attach = function(client, bufnr)
    local wk = require("which-key")
    local default_options = { silent = true }
    wk.register({
      m = {
        F = {
          "<cmd>lua require('plugins.lsp.utils').toggle_autoformat()<cr>",
          "Toggle format on save",
        },
      },
    }, { prefix = "<leader>", mode = "n", default_options })
    --   +---------------------------------------------------------------+
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
})
