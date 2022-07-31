local N = {}

N.common = {
    ["base00"] = "#17191e",
    ["base01"] = "#22262E",
    ["base02"] = "#282b36",
    ["base03"] = "#323643",
    ["base04"] = "#555e70",
    ["base05"] = "#B2bfd9",
    ["base06"] = "#e9efff",
    ["base07"] = "#f4f4f7",
    ["base08"] = "#ff29a8",
    ["base09"] = "#85ffe0",
    ["base10"] = "#f0ffaa",
    ["base11"] = "#0badff",
    ["base12"] = "#8265ff",
    ["base13"] = "#00eaff",
    ["base14"] = "#00f6d9",
    ["base15"] = "#ff3d81"
}

N.shades = {
    ["shade00"] = "#5C677E",
    ["shade01"] = "#4F586C",
    ["shade02"] = "#474D53",
    ["shade03"] = "#424A5A ",
    ["shade04"] = "#353B49",
    ["shade05"] = "#292F35",
    ["shade06"] = "#2b2f3a",
    ["shade07"] = "#252831",
    ["shade08"] = "#1A1C23",
    ["shade09"] = "#1C2023",
    ["shade10"] = "#1f2229",
    ["shade11"] = "#111317",
    ["shade12"] = "#15171b"
}

N.rainbow = {
    ["cobalt"] = "#2FB1D4",
    ["pink"] = "#F88ED6",
    ["cyan"] = "#52f1ff",
    ["green"] = "#44ffdd",
    ["yellow"] = "#ffff73",
    ["orange"] = "#F7743D",
    ["purple"] = "#772dff"
}

N.modes =
    setmetatable(
    {
        ["n"] = "#2eedae",
        ["no"] = "#e91e63",
        ["v"] = "#8265ff",
        ["V"] = "#af9dfc",
        [""] = "#ffffaf",
        ["s"] = "#00eaff",
        ["S"] = "#00caff",
        [""] = "#8b9cbe",
        ["i"] = "#b2bfd9",
        ["ic"] = "#00ffcc",
        ["R"] = "#ffffaf",
        ["Rv"] = "#ffff00",
        ["c"] = "#6c31f4",
        ["cv"] = "#727f96",
        ["ce"] = "#727f96",
        ["r"] = "#2eedae",
        ["rm"] = "#44ffdd",
        ["r?"] = "#79f3cb",
        ["t"] = "#F88ED6"
    },
    {
        __index = function()
            return "#FABDED"
        end
    }
)

N.syntax = {
    ["color16"] = "#2FB1D4",
    ["color09"] = "#AF9DFC",
    ["color00"] = "#F88ED6",
    ["color03"] = "#555e70",
    ["color02"] = "#44ffdd",
    ["color19"] = "#79F3CB",
    ["color17"] = "#2eedae",
    ["color20"] = "#52F1FF",
    ["color13"] = "#fabded",
    ["color01"] = "#ff3d81",
    ["color05"] = "#00caff",
    ["color12"] = "#44ffdd",
    ["color15"] = "#00ffcc",
    ["color04"] = "#79F3CB",
    ["color06"] = "#FABDED",
    ["color08"] = "#ffffaf",
    ["color10"] = "#ffff00",
    ["color11"] = "#727f96",
    ["color18"] = "#e9efff",
    ["color14"] = "#8b9cbe",
    ["color07"] = "#f4f4f7"
}

return N

-- vim:ft=lua
