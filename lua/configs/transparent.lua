local transparent = require "transparent"

transparent.clear_prefix "NeoTree"
transparent.clear_prefix "BufferLine"
transparent.clear_prefix "lualine"

transparent.setup { -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
  },
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeNormalFloat",
    "NvimTreeEndOfBuffer",
  },
  exclude_groups = {}, -- table: groups you don't want to clear
}
