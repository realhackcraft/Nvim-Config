require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

o.cursorlineopt = "both" -- to enable cursorline!
o.colorcolumn = "80"

g.editorconfig = true
g.python_indent = {}

g.python_indent.open_paren = "shiftwidth() * 2"
g.python_indent.nested_paren = "shiftwidth()"
g.python_indent.continue = "shiftwidth() * 2"
g.python_indent.closed_paren_align_last_line = false
g.tabby_keybinding_accept = '<C-a>'

