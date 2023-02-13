---@diagnostic disable: undefined-global
local M = {}

---@class palette
---@field color1 string
---@field color2 string
---@field color3 string
---@field color4 string
---@field color5 string
---@field color6 string
---@field color7 string
---@field color8 string
---@field color9 string
---@field color10 string
---@field color11 string
---@field color12 string
---@field color13 string
---@field color14 string
---@field text string
---@field subtext1 string
---@field subtext0 string
---@field overlay2 string
---@field overlay1 string
---@field overlay0 string
---@field surface2 string
---@field surface1 string
---@field surface0 string
---@field base string
---@field mantle string
---@field crust string
---@field none "NONE"

---@type palette
local palette = nil

---Initialize the palette
---@return palette
local function init_palette()
    palette = {

      color1 = "#F44336",
      color2 = "#95dbc2",
      color3 = "#ffffaf",
      color4 = "#5b9bf8",
      color5 = "#664ed0",
      color6 = "#4DB6AC",
      color9 = "#E53935",
      color10 = "#87c7b0",
      color11 = "#ffff73",
      color12 = "#3c84f7",
      color13 = "#8265ff",
      color14 = "#009688",

      text = "#d1d1d1",
      subtext1 = "#a9a9a9",
      subtext0 = "#919191",
      overlay2 = "#717171",
      overlay1 = "#666666",
      overlay0 = "#555555",
      surface2 = "#282828",
      surface1 = "#222222",
      surface0 = "#1c1c1c",

      base = "#2c2c2c",
      mantle = "#1C1C1C",
      crust = "#0c0c0c"
    }

    palette = vim.tbl_extend("force", {none = "NONE"}, palette,
                             require("core.settings").palette_overwrite)


  return palette
end

---@param c string @The color in hexadecimal.
local function hexToRgb(c)
  c = string.lower(c)
  return {
    tonumber(c:sub(2, 3), 16),
    tonumber(c:sub(4, 5), 16),
    tonumber(c:sub(6, 7), 16)
  }
end

---Parse the `style` string into nvim_set_hl options
---@param style string @The style config
---@return table
local function parse_style(style)
  if not style or style == "NONE" then
    return {}
  end

  local result = {}
  for field in string.gmatch(style, "([^,]+)") do
    result[field] = true
  end

  return result
end

---Wrapper function for nvim_get_hl_by_name
---@param hl_group string @Highlight group name
---@return table
local function get_highlight(hl_group)
  local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
  if hl.link then
    return get_highlight(hl.link)
  end

  local result = parse_style(hl.style)
  result.fg = hl.foreground and string.format("#%06x", hl.foreground)
  result.bg = hl.background and string.format("#%06x", hl.background)
  result.sp = hl.special and string.format("#%06x", hl.special)
  for attr, val in pairs(hl) do
    if type(attr) == "string" and attr ~= "foreground" and attr ~= "background" and
        attr ~= "special" then
      result[attr] = val
    end
  end

  return result
end

---Blend foreground with background
---@param foreground string @The foreground color
---@param background string @The background color to blend with
---@param alpha number|string @Number between 0 and 1 for blending amount.
function M.blend(foreground, background, alpha)
  ---@diagnostic disable-next-line: cast-local-type
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2),
                       blendChannel(3))
end

---Get RGB highlight by highlight group
---@param hl_group string @Highlight group name
---@param use_bg boolean @Returns background or not
---@param fallback_hl? string @Fallback value if the hl group is not defined
---@return string
function M.hl_to_rgb(hl_group, use_bg, fallback_hl)
  local hex = fallback_hl or "#000000"
  local hlexists = pcall(vim.api.nvim_get_hl_by_name, hl_group, true)

  if hlexists then
    local result = get_highlight(hl_group)
    if use_bg then
      hex = result.bg and result.bg or "NONE"
    else
      hex = result.fg and result.fg or "NONE"
    end
  end

  return hex
end

---Extend a highlight group
---@param name string @Target highlight group name
---@param def table @Attributes to be extended
function M.extend_hl(name, def)
  local hlexists = pcall(vim.api.nvim_get_hl_by_name, name, true)
  if not hlexists then
    -- Do nothing if highlight group not found
    return
  end
  local current_def = get_highlight(name)
  local combined_def = vim.tbl_deep_extend("force", current_def, def)

  vim.api.nvim_set_hl(0, name, combined_def)
end

---Generate universal highlight groups
---@param overwrite palette? @The color to be overwritten | highest priority
---@return palette
function M.get_palette(overwrite)
  if not overwrite then
    return init_palette()
  else
    return vim.tbl_extend("force", init_palette(), overwrite)
  end
end

---Convert number (0/1) to boolean
---@param value number @The value to check
---@return boolean|nil @Returns nil if failed
function M.tobool(value)
  if value == 0 then
    return false
  elseif value == 1 then
    return true
  else
    vim.notify("Attempt to convert data of type '" .. type(value) ..
                   "' [other than 0 or 1] to boolean", vim.log.levels.ERROR,
               {title = "[utils] Runtime error"})
    return nil
  end
end

return M
