-- Check out this for guide
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
return {
"mfussenegger/nvim-dap",
keys = "<leader>",
config = function()
  local dap = require "dap"
  local dapui = require "dapui"
  vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  require "plugins.dap.cpptools"
end,
dependencies = {
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup {
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
      }
    end,
  },
},
}
