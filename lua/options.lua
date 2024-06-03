require "nvchad.options"

local o = vim.o
local g = vim.g
local wo = vim.wo

o.cursorlineopt = "both" -- to enable cursorline!
o.colorcolumn = "80"
o.termguicolors = true
o.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

g.editorconfig = true
g.python_indent = {}

g.tabby_keybinding_accept = "<C-a>"

g.python3_host_prog = "usr/"

wo.relativenumber = true

-- allow for font size adjustments
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<D-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<D-->", function()
  change_scale_factor(1 / 1.25)
end)

-- neovide config
if g.neovide then
  g.neovide_floating_shadow = false -- shadows look bad on telescope, cmp, etc.
  g.neovide_hide_mouse_when_typing = true
  g.neovide_input_macos_option_key_is_meta = "only_right"
  g.neovide_cursor_smooth_blink = true

  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_cursor_vfx_particle_density = 15.0
  g.neovide_cursor_vfx_particle_speed = 15.0
  g.neovide_cursor_vfx_particle_curl = 1.0

  -- g.neovide_transparency = 0.8 -- commented out becasue the lualine ending is broken
end
