return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
              },

              hint = { enable = true },
              diagnostics = {
                enable = true,
                globals = {
                  "vim",
                  "nnoremap",
                  "vnoremap",
                  "inoremap",
                  "tnoremap",
                  "use",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.api.nvim_get_runtime_file("", true),
                  ["$HOME/awesome-code-doc"] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                -- adjust these two values if your performance is not optimal
                maxPreload = 2000,
                preloadFileSize = 2000,
              },
              telemetry = { enable = false },

              completion = {
                callSnippet = "Replace",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      ---@type table<string, fun(client, buffer)>
      attach_handlers = {},
      capabilities = {
        textDocument = {
          foldingRange = { dynamicRegistration = false, lineFoldingOnly = true },
        },
      },
    },

    config = function(_, opts)
      local Util = require("util")
      -- special attach lsp
      Util.on_attach(function(client, buffer)
        require("config.lsp.navic").attach(client, buffer)
        require("config.lsp.keymaps").attach(client, buffer)
        require("config.lsp.gitsigns").attach(client, buffer)
      end)

      -- diagnostics
      vim.diagnostic.config(require("config.lsp.diagnostics")["on"])

      local servers = opts.servers
      local ext_capabilites = vim.lsp.protocol.make_client_capabilities()

      -- inlay hints
      local inlay_hint = vim.lsp.buf.inlayhints or vim.lsp.inlayhints
      if vim.fn.has("nvim-0.10.0") and inlay_hint then
        Util.on_attach(function(client, buffer)
          if client.supports_method("textDocument/inlayHint") then
            inlay_hint(buffer, true)
          end
        end)
      end

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        ext_capabilites,
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.attach_handlers[server] then
          local callback = function(client, buffer)
            if client.name == server then
              opts.attach_handlers[server](client, buffer)
            end
          end
          Util.on_attach(callback)
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local available = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          if not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        -- LSPs
        "bash-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "marksman",
        "typescript-language-server",
        "texlab",
        "ltex-ls",
        "lua-language-server",
        "pyright",
        "terraform-ls",
        "yaml-language-server",
        -- Formatter
        "black",
        "prettier",
        "prettierd",
        "stylua",
        "shfmt",
        -- Linter
        "shellcheck",
        "tflint",
        "yamllint",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "top", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      cycle_results = true, -- cycle item list when reaching beginning or end of list
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = { "o" }, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s", -- switch "diagnostics" severity filter level
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
        close_folds = { "zM", "zm" }, -- close all folds
        open_folds = { "zR", "zr" }, -- open all folds
        toggle_fold = { "zA", "za" }, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j", -- next item
        help = "?", -- help menu
      },
      multiline = true, -- render multi-line messages
      indent_lines = true, -- add an indent guide below the fold icons
      win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
  },
  -- formatters
  {
    "nvimtools/none-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    root_has_file = function(files)
      return function(utils)
        return utils.root_has_file(files)
      end
    end,
    opts = function(plugin)
      local root_has_file = plugin.root_has_file
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local completion = null_ls.builtins.completion
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      local stylua_root_files = { "stylua.toml", ".stylua.toml" }
      local modifier = {
        stylua_formatting = {
          condition = root_has_file(stylua_root_files),
        },
      }
      return {
        debug = false,
        -- You can then register sources by passing a sources list into your setup function:
        -- using `with()`, which modifies a subset of the source's default options
        sources = {
          formatting.stylua.with(modifier.stylua_formatting),
          formatting.markdownlint,
          formatting.beautysh.with({ extra_args = { "--indent-size", "2" } }),
          formatting.prettier.with({
            extra_args = { "--single-quote", "false" },
            filetypes = {
              "html",
              "tsx",
              "javascript",
              "typescript",
              "css",
              "scss",
              "less",
              "jsx",
              "json",
              "yaml",
            },
          }),
          --          diagnostics.markdownlint,
          formatting.markdown_toc, -- use `<!-- toc -->` before headers in your markdown file.`
          formatting.mdformat,
          completion.luasnip,
          completion.tags,
          formatting.rubyfmt,
          formatting.rustywind,
          formatting.yamlfix,
          diagnostics.actionlint,
          diagnostics.statix,
          diagnostics.trail_space,
          diagnostics.deadnix,
          diagnostics.statix,
          diagnostics.todo_comments,
          diagnostics.tsc,
          diagnostics.zsh,
          formatting.terraform_fmt,
          formatting.black,
          formatting.cbfmt,
          formatting.goimports,
          formatting.gofumpt,
          formatting.latexindent.with({
            extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
          }),
          code_actions.shellcheck,
          code_actions.refactoring.with({
            filetypes = { "go", "javascript", "lua", "python", "typescript" },
          }),
          formatting.alejandra,
          formatting.fixjson,
          formatting.markdownlint,
          formatting.markdown_toc,
          formatting.trim_newlines,
          formatting.trim_whitespace,
          code_actions.gitsigns,
          formatting.shfmt,
          formatting.leptosfmt,
          formatting.rustfmt.with({
            extra_args = function(params)
              local Path = require("plenary.path")
              local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

              if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                  local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                  if edition then
                    return { "--edition=" .. edition }
                  end
                end
              end
              -- default edition when we don't find `Cargo.toml` or the `edition` in it.
              return { "--edition=2021" }
            end,
          }),
        },
      }
    end,
    config = function(_, opts)
      local null_ls = require("null-ls")
      null_ls.setup(opts)
    end,
  },
}
