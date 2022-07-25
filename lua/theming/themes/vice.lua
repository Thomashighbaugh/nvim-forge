local N = {}

N.common = {
  ['base00'] = '#17191e',
  ['base01'] = '#22262E',
  ['base02'] = '#282b36',
  ['base03'] = '#323643',
  ['base04'] = '#555e70',
  ['base05'] = '#B2bfd9',
  ['base06'] = '#e9efff',
  ['base07'] = '#f4f4f7',
  ['base08'] = '#ff29a8',
  ['base09'] = '#85ffe0',
  ['base10'] = '#f0ffaa',
  ['base11'] = '#0badff',
  ['base12'] = '#8265ff',
  ['base13'] = '#00eaff',
  ['base14'] = '#00f6d9',
  ['base15'] = '#ff3d81'
}

N.shades = {
  ['shade00'] = '#5C677E',
  ['shade01'] = '#4F586C',
  ['shade02'] = '#474D53',
  ['shade03'] = '#424A5A ',
  ['shade04'] = '#353B49',
  ['shade05'] = '#292F35',
  ['shade06'] = '#2b2f3a',
  ['shade07'] = '#252831',
  ['shade08'] = '#1A1C23',
  ['shade09'] = '#1C2023',
  ['shade10'] = '#1f2229',
  ['shade11'] = '#111317',
  ['shade12'] = '#15171b'
}

N.rainbow = {
  ['cobalt'] = '#2FB1D4',
  ['pink'] = '#F88ED6',
  ['cyan'] = '#52f1ff',
  ['green'] = '#44ffdd',
  ['yellow'] = '#ffff73',
  ['orange'] = '#F7743D',
  ['purple'] = '#772dff'
}

N.modes =
  setmetatable(
  {
    ['n'] = '#2eedae',
    ['no'] = '#e91e63',
    ['v'] = '#8265ff',
    ['V'] = '#af9dfc',
    [''] = '#ffffaf',
    ['s'] = '#00eaff',
    ['S'] = '#00caff',
    [''] = '#8b9cbe',
    ['i'] = '#b2bfd9',
    ['ic'] = '#00ffcc',
    ['R'] = '#ffffaf',
    ['Rv'] = '#ffff00',
    ['c'] = '#6c31f4',
    ['cv'] = '#727f96',
    ['ce'] = '#727f96',
    ['r'] = '#2eedae',
    ['rm'] = '#44ffdd',
    ['r?'] = '#79f3cb',
    ['t'] = '#F88ED6'
  },
  {
    __index = function()
      return '#FABDED'
    end
  }
)

N.syntax = {
  ['color16'] = '#9AAFE6',
  ['color09'] = '#A39EC4',
  ['color00'] = '#C795AE',
  ['color03'] = '#8F8AAC',
  ['color02'] = '#9EC49F',
  ['color19'] = '#8AAC8B',
  ['color17'] = '#70B2A0',
  ['color20'] = '#7D9FC1',
  ['color13'] = '#E0987F',
  ['color01'] = '#CC707D',
  ['color05'] = '#AE9fCf',
  ['color12'] = '#B8D19F',
  ['color15'] = '#B1CA98',
  ['color04'] = '#AEC795',
  ['color06'] = '#C795AE',
  ['color08'] = '#C4C19E',
  ['color10'] = '#ACA98A',
  ['color11'] = '#C7AE95',
  ['color18'] = '#CBD0D5',
  ['color14'] = '#747C84',
  ['color07'] = '#C7CCD1'
}

return N

-- vim:ft=lua
