-- Credits to original https://github.com/NTBBloodbath/doom-one.nvim
-- This is modified version of it

local M = {}

M.default = {
    bg = "#16181a",
    bgAlt = "#1e2124",
    bgHighlight = "#3c4048",
    fg = "#ffffff",
    grey = "#7b8496",
    blue = "#5ea1ff",
    green = "#5eff6c",
    cyan = "#5ef1ff",
    red = "#ff6e5e",
    yellow = "#f1ff5e",
    magenta = "#ff5ef1",
    pink = "#ff5ea0",
    orange = "#ffbd5e",
    purple = "#bd5eff",
}

-- Light theme
M.light = {
    bg = "#ffffff",
    bgAlt = "#eaeaea",
    bgHighlight = "#acacac",
    fg = "#16181a",
    grey = "#7b8496",
    blue = "#0057d1",
    green = "#008b0c",
    cyan = "#008c99",
    red = "#d11500",
    yellow = "#997b00",
    magenta = "#d100bf",
    pink = "#f40064",
    orange = "#d17c00",
    purple = "#a018ff",
}

M.base_30 = {
  white = M.default.fg,
  black = M.default.bg, -- usually your theme bg
  darker_black = "#000000", -- 6% darker than black
  black2 = "#000000", -- 6% lighter than black
  one_bg = M.default.bgAlt, -- 10% lighter than black
  one_bg2 = M.default.bgHighlight, -- 6% lighter than one_bg2
  one_bg3 = "#000000", -- 6% lighter than one_bg3
  grey = M.default.grey, -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#000000", -- 10% lighter than grey
  grey_fg2 = "#000000", -- 5% lighter than grey
  light_grey = "#000000",
  red = M.default.red,
  baby_pink = "",
  pink = M.default.pink,
  line = "#000000", -- 15% lighter than black
  green = M.default.green,
  vibrant_green = "#000000",
  nord_blue = "#000000",
  blue = M.default.blue,
  seablue = "#000000",
  yellow = M.default.yellow, -- 8% lighter than yellow
  sun = "#000000",
  purple = M.default.magenta,
  dark_purple = M.default.purple,
  teal = "#000000",
  orange = M.default.orange,
  cyan = M.default.cyan,
  statusline_bg = "#000000",
  lightbg = "#000000",
  pmenu_bg = "#000000",
  folder_bg = "#000000"
}
M.base_16 = {
  base00 = M.default.bg,
  base01 = M.default.bgAlt,
  base02 = M.default.bgHighlight,
  base03 = M.default.grey,
  base04 = M.default.fg,
  base05 = M.default.fg,
  base06 = M.default.fg,
  base07 = M.default.fg,
  base08 = M.default.fg,
  base09 = M.default.fg,
  base0A = "#ECBE7B",
  base0B = M.default.green,
  base0C = M.default.green,
  base0D = M.default.blue,
  base0E = M.default.orange,
  base0F = M.default.red,
}

M.polish_hl = {
  treesitter = {
    ["@variable.member"] = { fg = M.default.white },
    ["@markup.strong"] = { fg = M.default.pink, bold = true },
    ["@markup.italic"] = { fg = M.default.blue, italic = true },
    ["@punctuation.bracket"] = { fg = M.default.pink },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "doomchad")

return M
