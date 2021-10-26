local cmd = vim.cmd
cmd("let g:nvcode_termcolors=256")

vim.cmd([[
        syntax on
        filetype on
        filetype plugin indent on
    ]])

cmd("let g:nvcode_termcolors=256")

cmd("colorscheme xresources")
local colors = {
  white = "#f4f4f7",
  darker_black = "#17191e",
  black = "#22262d", --  nvim bg
  black2 = "#2f303d",
  one_bg = "#383a47", -- real bg of vice
  one_bg2 = "#3c3f4c",
  one_bg3 = "#30343c",
  grey = "#555e70",
  grey_fg = "#8b9cbe",
  grey_fg2 = "#939EB4",
  light_grey = "#b2bfd9",
  red = "#ff3d81",
  baby_pink = "#ff28a9",
  pink = "#ff29a8",
  line = "#0b0c0f", -- for lines like vertsplit
  green = "#16A589",
  vibrant_green = "#00ffcc",
  nord_blue = "#0badff",
  blue = "#00caff",
  yellow = "#f0ffaa",
  sun = "#ff9933",
  purple = "#8265ff",
  dark_purple = "#6c71c4",
  teal = "#00fae9",
  orange = "#ffaa33",
  cyan = "#00eaff",
  statusline_bg = "#22262d",
  lightbg = "#30343c",
  lightbg2 = "#3c3f4c"
}

return colors
