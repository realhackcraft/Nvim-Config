require("mason").setup()
require("mason-null-ls").setup({
    handlers = {},
})
require("null-ls").setup({
  sources = {
    -- Anything not supported by mason.
  }
})
