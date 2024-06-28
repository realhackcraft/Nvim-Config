local cmp = require "cmp"

-- Get the current sources
local sources = cmp.get_config().sources

-- Add the new source
table.insert(sources, { name = "cmp_zotcite" })
-- Setup nvim-cmp with the updated sources
cmp.setup {
  sources = sources,
}
