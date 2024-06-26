table.unpack = table.unpack or unpack

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local markdown_oxide_capabilities = { table.unpack(require("nvchad.configs.lspconfig").capabilities) }
markdown_oxide_capabilities.workspace = {
  didChangeWatchedFiles = {
    dynamicRegistration = true,
  },
}

local lspconfig = require "lspconfig"

local MY_FQBN = "arduino:avr:leonardo"

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  ["markdown_oxide"] = function()
    lspconfig["markdown_oxide"].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = markdown_oxide_capabilities,
    }
  end,
  ["arduino_language_server"] = function() end,
  ["ltex"] = function()
    lspconfig["ltex"].setup {
      on_attach = function(client, bufnr)
        -- rest of your on_attach process.
        on_attach(client, bufnr)
        require("ltex_extra").setup {
          load_langs = { "en-CA" },
        }
      end,
      on_init = on_init,
      capabilities = capabilities,
      filetypes = {
        "bib",
        "gitcommit",
        "markdown",
        "org",
        "plaintex",
        "rst",
        "rnoweb",
        "tex",
        "pandoc",
        "quarto",
        "rmd",
        "context",
        "mail",
        "text",
      },
      settings = {
        ltex = {
          language = "en-CA",
        },
      },
    }
  end,
}

lspconfig.arduino_language_server.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "arduino-language-server",
    "-cli",
    "/opt/homebrew/bin/arduino-cli",
    "-cli-config",
    "$HOME/.arduino15/arduino-cli.yaml",
    "-fqbn",
    MY_FQBN,
  },
}

lspconfig["sourcekit"].setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
  },
  filetypes = {
    "swift",
  },
}

-- KEYBINDS
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
