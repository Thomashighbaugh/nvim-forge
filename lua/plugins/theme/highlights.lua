local colors = require("plugins.theme.colors")
local highlight = require("utils").highlight
local M = {}

function M.init()
  -- diagnostic virtual text highlights
  highlight("DiagnosticVirtualTextError", "None", colors.red)
  highlight("DiagnosticVirtualTextWarn", "None", colors.sun)
  highlight("DiagnosticVirtualTextInfo", "None", colors.nord_blue)
  highlight("DiagnosticVirtualTextHint", "None", colors.light_grey)

  -- diagnostics highlight
  highlight("DiagnosticError", "None", colors.red)
  highlight("DiagnosticWarn", "None", colors.sun)
  highlight("DiagnosticInfo", "None", colors.nord_blue)
  highlight("DiagnosticHint", "None", colors.light_grey)

  highlight("Error", "None", colors.red)
  highlight("ErrorMsg", "None", colors.red)
  highlight("WarningMsg", "None", colors.sun)

  -- legacy diagnostics highlight
  highlight("LspDiagnosticsError", "None", colors.red)
  highlight("LspDiagnosticsWarn", "None", colors.sun)
  highlight("LspDiagnosticsInfo", "None", colors.nord_blue)
  highlight("LspDiagnosticsHint", "None", colors.light_grey)

  -- signature highlight color
  highlight("LspSignatureActiveParameter", "None", colors.orange)

  -- currently not working?
  highlight("TelescopeSelectionCaret", "None", colors.grey_fg)

  -- autocomplete highlights
  highlight("CmpItemAbbrDeprecated", "None", colors.sun)

  vim.cmd([[
    highlight clear NormalFloat
    highlight link NormalFloat Normal
  ]])
end

return M
