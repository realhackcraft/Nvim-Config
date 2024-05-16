return {
  {
    -- Define your formatters
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
}
