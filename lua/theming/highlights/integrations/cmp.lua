local colors = require("utils.theming").get_active_theme()

return {
  ["CmpItemKindText"] = {
    guifg = colors.syntax.color16,
  },
  ["CmpItemKindMethod"] = {
    guifg = colors.syntax.color00,
  },
  ["CmpItemKindSnippet"] = {
    guifg = colors.syntax.color03,
  },
  ["CmpItemKindFunction"] = {
    guifg = colors.syntax.color01,
  },
  ["CmpItemKindConstructor"] = {
    guifg = colors.syntax.color06,
  },
  ["CmpItemKindField"] = {
    guifg = colors.syntax.color04,
  },
  ["CmpItemKindVariable"] = {
    guifg = colors.syntax.color02,
  },
  ["CmpItemKindClass"] = {
    guifg = colors.syntax.color01,
  },
  ["CmpItemKindInterface"] = {
    guifg = colors.syntax.color13,
  },
  ["CmpItemKindModule"] = {
    guifg = colors.syntax.color13,
  },
  ["CmpItemKindProperty"] = {
    guifg = colors.syntax.color20,
  },
  ["CmpItemKindUnit"] = {
    guifg = colors.syntax.color19,
  },
  ["CmpItemKindValue"] = {
    guifg = colors.syntax.color08,
  },
  ["CmpItemKindEnum"] = {
    guifg = colors.syntax.color06,
  },
  ["CmpItemKindKeyword"] = {
    guifg = colors.syntax.color15,
  },
  ["CmpItemKindColor"] = {
    guifg = colors.syntax.color17,
  },
  ["CmpItemKindFile"] = {
    guifg = colors.syntax.color10,
  },
  ["CmpItemKindReference"] = {
    guifg = colors.syntax.color10,
  },
  ["CmpItemKindFolder"] = {
    guifg = colors.syntax.color17,
  },
  ["CmpItemKindEnumMember"] = {
    guifg = colors.syntax.color20,
  },
  ["CmpItemKindConstant"] = {
    guifg = colors.syntax.color19,
  },
  ["CmpItemKindStruct"] = {
    guifg = colors.syntax.color00,
  },
  ["CmpItemKindEvent"] = {
    guifg = colors.syntax.color00,
  },
  ["CmpItemKindOperator"] = {
    guifg = colors.syntax.color0,
  },
  ["CmpItemKindTypeParameter"] = {
    guifg = colors.syntax.color05,
  },
  ["CmpItemMenu"] = {
    guifg = colors.syntax.color10,
  },
  ["CmpItemAbbr"] = {
    guifg = colors.syntax.color15,
  },
  ["CmpItemAbbrMatchFuzzy"] = {
    guifg = colors.syntax.color00,
  },
  ["CmpItemAbbrMatch"] = {
    guifg = colors.syntax.color06,
  },
  ["CmpItemAbbrMatchDeprecated"] = {
    guifg = colors.syntax.color08,
  },
}

-- vim:ft=lua
