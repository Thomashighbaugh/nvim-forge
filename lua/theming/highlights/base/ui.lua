local colors = require("utils.theming").get_active_theme()

return {
  ["MatchParen"] = {
    guifg = colors.common.base08,
    guibg = colors.shades.shade03,
    gui = "bold",
  },
  ["Normal"] = {
    guibg = colors.common.base00,
  },
  ["NormalFloat"] = {
    guifg = colors.common.base11,
    guibg = colors.shades.shade11,
  },
  ["cheatSeparator"] = {
    guifg = colors.common.base02,
  },
  ["FloatBorder"] = {
    guibg = colors.shades.shade11,
    guifg = colors.shades.shade11,
  },
  ["ColorColumn"] = {
    guibg = colors.common.base01,
  },
  ["Conceal"] = {
    guifg = colors.common.base01,
  },
  ["Directory"] = {
    guifg = colors.common.base07,
  },
  ["DiffAdd"] = {
    guifg = colors.common.base14,
    gui = "reverse",
  },
  ["DiffChange"] = {
    guifg = colors.common.base13,
    gui = "reverse",
  },
  ["DiffDelete"] = {
    guifg = colors.common.base11,
    gui = "reverse",
  },
  ["DiffText"] = {
    guifg = colors.common.base15,
    gui = "reverse",
  },
  ["EndOfBuffer"] = {
    guifg = colors.common.base01,
  },
  ["ErrorMsg"] = {
    guifg = colors.common.base11,
    gui = "undercurl",
  },
  ["Folded"] = {
    guifg = colors.common.base03,
  },
  ["FoldColumn"] = {
    guifg = colors.common.base07,
  },
  ["IncSearch"] = {
    guifg = colors.common.base13,
    guibg = colors.common.base02,
  },
  ["LineNr"] = {
    guifg = colors.shades.shade01,
    gui = "bold",
  },
  ["LineNrAbove"] = {
    guifg = colors.common.base13,
    gui = "bold",
  },
  ["LineNrBelow"] = {
    guifg = colors.common.base15,
    gui = "bold",
  },
  ["SignColumn"] = {
    link = "Normal",
  },
  ["VertSplit"] = {
    guifg = colors.shades.shade03,
  },
  ["WinSeparator"] = {
    guifg = colors.shades.shade03,
  },
  ["CursorLineNr"] = {
    guifg = colors.common.base08,
    gui = "bold",
  },
  ["CursorLine"] = {
    guibg = "NONE",
  },
  ["ModeMsg"] = {
    guifg = colors.common.base14,
    gui = "bold",
  },
  ["MsgArea"] = {
    guifg = colors.common.base09,
    gui = "bold",
  },
  ["MsgSeparator"] = {
    guifg = colors.common.base15,
    gui = "bold",
  },
  ["MoreMsg"] = {
    guifg = colors.common.base09,
  },
  ["NonText"] = {
    guifg = colors.shades.shade03,
  },
  ["PmenuSel"] = {
    guibg = colors.common.base14,
    guifg = colors.common.base02,
    gui = "bold",
  },
  ["PmenuSbar"] = {
    guibg = colors.shades.shade05,
    guifg = colors.shades.shade05,
  },
  ["PmenuThumb"] = {
    guibg = colors.common.base02,
    guifg = colors.common.base02,
  },
  ["Pmenu"] = {
    guibg = colors.shades.shade12,
    guifg = colors.common.base04,
  },
  ["Question"] = {
    guifg = colors.common.base14,
  },
  ["QuickFixLine"] = {
    guifg = colors.common.base04,
    gui = "reverse",
  },
  ["qfLineNr"] = {
    guifg = colors.common.base04,
    gui = "reverse",
  },
  ["Search"] = {
    guifg = colors.common.base10,
    guibg = colors.common.base06,
    gui = "reverse",
  },
  ["SpecialKey"] = {
    guifg = colors.common.base09,
  },
  ["SpellBad"] = {
    guifg = colors.common.base11,
    gui = "undercurl",
  },
  ["SpellCap"] = {
    guifg = colors.common.base07,
    gui = "undercurl",
  },
  ["SpellLocal"] = {
    guifg = colors.common.base08,
  },
  ["SpellRare"] = {
    guifg = colors.common.base09,
  },
  ["TabLineFill"] = {
    guifg = colors.common.base04,
  },
  ["TablineSel"] = {
    guifg = colors.common.base01,
    guibg = colors.common.base09,
  },
  ["Tabline"] = {
    guifg = colors.common.base04,
    guibg = colors.common.base01,
  },
  ["Title"] = {
    guifg = colors.common.base14,
    gui = "bold",
  },
  ["Visual"] = { guibg = colors.shades.shade05 },
  ["VisualNC"] = {
    guibg = colors.common.base11,
    guifg = colors.common.base13,
  },
  ["VisualNOS"] = {
    guibg = colors.shades.shade05,
    guifg = colors.common.base13,
  },
  ["WarningMsg"] = {
    guifg = colors.common.base15,
    gui = "underline",
  },
  ["WildMenu"] = {
    guifg = colors.common.base12,
    gui = "bold",
  },
  ["CursorColumn"] = {
    guibg = colors.common.base01,
  },
  ["ToolbarLine"] = {
    guifg = colors.common.base04,
    guibg = colors.common.base01,
  },
  ["ToolbarButton"] = {
    guifg = colors.common.base04,
    gui = "bold",
  },
  ["NormalMode"] = {
    guifg = colors.common.base04,
    gui = "reverse",
  },
  ["InsertMode"] = {
    guifg = colors.common.base14,
    gui = "reverse",
  },
  ["ReplacelMode"] = {
    guifg = colors.common.base11,
    gui = "reverse",
  },
  ["VisualMode"] = {
    guifg = colors.common.base09,
    gui = "reverse",
  },
  ["CommandMode"] = {
    guifg = colors.common.base04,
    gui = "reverse",
  },
  ["Warnings"] = {
    guifg = colors.common.base15,
  },
  ["healthError"] = {
    guifg = colors.common.base11,
  },
  ["healthSuccess"] = {
    guifg = colors.common.base14,
  },
  ["healthWarning"] = {
    guifg = colors.common.base15,
  },
}

-- vim:ft=lua
