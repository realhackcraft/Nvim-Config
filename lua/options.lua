require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

o.cursorlineopt = "both" -- to enable cursorline!
o.colorcolumn = "80"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- vim.o.guifont = "ADLaM Display Regular"

g.editorconfig = true
g.python_indent = {}

g.python_indent.open_paren = "shiftwidth() * 2"
g.python_indent.nested_paren = "shiftwidth()"
g.python_indent.continue = "shiftwidth() * 2"
g.python_indent.closed_paren_align_last_line = false
g.tabby_keybinding_accept = '<C-a>'

if g.neovide then
  g.neovide_hide_mouse_when_typing = true
  g.neovide_fullscreen = true
  g.neovide_input_macos_option_key_is_meta = 'only_right'
  g.neovide_cursor_smooth_blink = true
end
