--return {
--  {
--    "williamboman/mason.nvim",
--    opts = function(_, opts)
--      table.insert(opts.ensure_installed, "black")
--    end,
--  },
--
--  {
--    "nvim-treesitter/nvim-treesitter",
--    opts = function(_, opts)
--      if type(opts.ensure_installed) == "table" then
--        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
--      end
--    end,
--  },
--
--  {
--    "neovim/nvim-lspconfig",
--    opts = {
--      servers = {
--        pyright = {
--          keys = {
--            { "<leader>lo", "<cmd>PyrightOrganizeImports<CR>", desc = "Organize Imports" },
--          },
--          -- disable hint of pyright
--          capabilities = (function()
--            local capabilities = vim.lsp.protocol.make_client_capabilities()
--            capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
--            return capabilities
--          end)(),
--          settings = {
--            python = {
--              analysis = {
--                indexing = true,
--                typeCheckingMode = "basic",
--                diagnosticMode = "openFilesOnly",
--                autoImportCompletions = true,
--                autoSearchPaths = true,
--                inlayHints = {
--                  variableTypes = true,
--                  functionReturnTypes = true,
--                },
--                useLibraryCodeForTypes = true,
--                diagnosticSeverityOverrides = {
--                  reportGeneralTypeIssues = "none",
--                  reportOptionalMemberAccess = "none",
--                  reportOptionalSubscript = "none",
--                  reportPrivateImportUsage = "none",
--                },
--              },
--            },
--          },
--        },
--      },
--      attach_handlers = {
--        pyright = function(client, _)
--          local sc = client.server_capabilities
--          sc.renameProvider = false -- rope is ok
--          sc.hoverProvider = false -- pylsp includes also docstrings
--          sc.signatureHelpProvider = false -- pyright typing of signature is weird
--          sc.definitionProvider = true -- pyright does not follow imports correctly
--          sc.referencesProvider = true -- pylsp does it
--          sc.completionProvider = {
--            resolveProvider = true,
--            triggerCharacters = { "." },
--          }
--        end,
--      },
--    },
--  },
--
--  {
--    "stevearc/conform.nvim",
--    opts = {
--      formatters_by_ft = {
--        ["python"] = { "black" },
--      },
--    },
--  },
--}
return {
  -- Add `pyright` to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, { "pyright", "black", "ruff-lsp", "ruff" })
      vim.list_extend(opts.ensure_installed, {
        "black",
        "ruff",
      })
    end,
  },

  -- Setup adapters as nvim-dap dependencies
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  -- Add `python` debugger to mason DAP to auto-install
  -- Not absolutely necessary to declare adapter in `ensure_installed`, since `mason-nvim-dap`
  -- has `automatic-install = true` in LazyVim by default and it automatically installs adapters
  -- that are are set up (via dap) but not yet installed. Might as well skip the lines below as
  -- a whole.

  -- Add which-key namespace for Python debugging
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>dP"] = { name = "+Python" },
      },
    },
  },

  -- Setup `neotest`
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  -- Add `server` and setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        -- pyright = {},
        pyright = {
          keys = {
            { "<leader>lo", "<cmd>PyrightOrganizeImports<CR>", desc = "Organize Imports" },
          },
        },
        ruff_lsp = {
          -- handlers = {
          --   ["textDocument/publishDiagnostics"] = function() end,
          -- },
        },
        jedi_language_server = {},
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        pyright = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "pyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Setup up format with new `conform.nvim`
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { { "black", "ruff" } },
      },
    },
  },

  -- Setup null-ls with `black`
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, {
        -- Order of formatters matters. They are used in order of appearance.
        nls.builtins.formatting.ruff,
        nls.builtins.formatting.black,

        nls.builtins.diagnostics.ruff,
      })
    end,
  },

  -- For selecting virtual envs
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    opts = {
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
