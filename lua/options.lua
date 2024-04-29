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

local tabby = require "cmp_tabby.config"

tabby:setup {
  endpoint = "http://localhost",
  token = nil,
  device = "metal",
  model = "TabbyML/DeepseekCoder-1.3B",
  temperature = 0.75,
  max_lines = 1024,
  max_num_results = 10,
  priority = 5000,
  run_on_every_keystroke = true,
  ignored_file_types = { -- default is not to ignore
    -- uncomment to ignore in lua:
    -- 'lua',
  },
}
