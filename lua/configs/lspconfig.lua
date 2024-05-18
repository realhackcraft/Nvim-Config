local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local markdown_oxide_capabilities = require("nvchad.configs.lspconfig").capabilities
markdown_oxide_capabilities.workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true,
    },
}

local MY_FQBN = "arduino:avr:leonardo"

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }

  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["markdown_oxide"] = function ()
    require("lspconfig")["markdown_oxide"].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = markdown_oxide_capabilities,
    }
  end,
  ["arduino_language_server"] = function ()
    require("lspconfig")["arduino_language_server"].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      cmd = {
        "arduino-language-server",
        "-cli-config", "$HOME/.arduino15/arduino-cli.yaml",
        "-fqbn",
        MY_FQBN
      }
    }
  end
}


-- KEYBINDS
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
