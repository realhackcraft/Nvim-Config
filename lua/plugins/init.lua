return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fmt",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = require "conform",
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require "configs.transparent"
    end,
  },
  {
    "TabbyML/vim-tabby",
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'arduino_language_server',
          -- We need to install clangd for arduino_language_server to work
          'clangd'
        }
      })
    end
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "javascript",
        "html",
        "css",
        "python",
        "bash",
      },
    },
  },
}
