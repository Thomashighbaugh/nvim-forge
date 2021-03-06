local colors = require("utils.theming").get_active_theme()

return {
  ["LspDiagnosticsSignError"] = {
    guifg = colors.syntax.color17,
  },
  ["LspDiagnosticsFloatingError"] = {
    guifg = colors.syntax.color17,
  },
  ["LspDiagnosticsVirtualTextError"] = {
    guifg = colors.syntax.color17,
  },
  ["LspDiagnosticsUnderlineError"] = {
    gui = "undercurl,bold",
    guisp = colors.syntax.color17,
  },
  ["LspDiagnosticsDefaultWarning"] = {
    guifg = colors.syntax.color08,
  },
  ["LspDiagnosticsDefaultError"] = {
    guifg = colors.syntax.color01,
  },
  ["LspDiagnosticsSignWarning"] = {
    guifg = colors.syntax.color08,
  },
  ["LspDiagnosticsFloatingWarning"] = {
    guifg = colors.syntax.color08,
    gui = "bold",
  },
  ["LspDiagnosticsVirtualTextWarning"] = {
    guifg = colors.syntax.color08,
    gui = "bold",
  },
  ["LspDiagnosticsUnderlineWarning"] = {
    gui = "undercurl",
    guisp = colors.syntax.color08,
  },
  ["LspDiagnosticsDefaultInformation"] = {
    guifg = colors.syntax.color13,
    gui = "italic",
  },
  ["LspDiagnosticsSignInformation"] = {
    guifg = colors.syntax.color13,
  },
  ["LspDiagnosticsFloatingInformation"] = {
    guifg = colors.syntax.color13,
  },
  ["LspDiagnosticsVirtualTextInformation"] = {
    guifg = colors.syntax.color13,
    gui = "italic",
  },
  ["LspDiagnosticsUnderlineInformation"] = {
    gui = "undercurl",
    guisp = colors.syntax.color13,
  },
  ["LspDiagnosticsDefaultHint"] = {
    guifg = colors.syntax.color09,
  },
  ["LspDiagnosticsSignHint"] = {
    guifg = colors.syntax.color09,
  },
  ["LspDiagnosticsFloatingHint"] = {
    guifg = colors.syntax.color09,
  },
  ["LspDiagnosticsVirtualTextHint"] = {
    guifg = colors.syntax.color09,
  },
  ["LspDiagnosticsUnderlineHint"] = {
    gui = "undercurl",
    guisp = colors.syntax.color09,
  },
  ["LspReferenceText"] = {
    guifg = colors.syntax.color12,
    guibg = colors.common.base01,
    gui = "bold",
  },
  ["LspReferenceRead"] = {
    guifg = colors.syntax.color16,
    guibg = colors.common.base01,
    gui = "bold",
  },
  ["LspReferenceWrite"] = {
    guifg = colors.syntax.color06,
    guibg = colors.common.base01,
    gui = "bold",
  },
  ["DiagnosticError"] = {
    link = "LspDiagnosticsDefaultError",
  },
  ["DiagnosticWarn"] = {
    link = "LspDiagnosticsDefaultWarning",
  },
  ["DiagnosticInfo"] = {
    link = "LspDiagnosticsDefaultInformation",
  },
  ["DiagnosticHint"] = {
    link = "LspDiagnosticsDefaultHint",
  },
  ["DiagnosticVirtualTextWarn"] = {
    link = "LspDiagnosticsVirtualTextWarning",
  },
  ["DiagnosticUnderlineWarn"] = {
    link = "LspDiagnosticsUnderlineWarning",
  },
  ["DiagnosticFloatingWarn"] = {
    link = "LspDiagnosticsFloatingWarning",
  },
  ["DiagnosticSignWarn"] = {
    link = "LspDiagnosticsSignWarning",
  },
  ["DiagnosticVirtualTextError"] = {
    link = "LspDiagnosticsVirtualTextError",
  },
  ["DiagnosticUnderlineError"] = {
    link = "LspDiagnosticsUnderlineError",
  },
  ["DiagnosticFloatingError"] = {
    link = "LspDiagnosticsFloatingError",
  },
  ["DiagnosticSignError"] = {
    link = "LspDiagnosticsSignError",
  },
  ["DiagnosticVirtualTextInfo"] = {
    link = "LspDiagnosticsVirtualTextInformation",
  },
  ["DiagnosticUnderlineInfo"] = {
    link = "LspDiagnosticsUnderlineInformation",
  },
  ["DiagnosticFloatingInfo"] = {
    link = "LspDiagnosticsFloatingInformation",
  },
  ["DiagnosticSignInfo"] = {
    link = "LspDiagnosticsSignInformation",
  },
  ["DiagnosticVirtualTextHint"] = {
    link = "LspDiagnosticsVirtualTextHint",
  },
  ["DiagnosticUnderlineHint"] = {
    link = "LspDiagnosticsUnderlineHint",
  },
  ["DiagnosticFloatingHint"] = {
    link = "LspDiagnosticsFloatingHint",
  },
}

-- vim:ft=lua
