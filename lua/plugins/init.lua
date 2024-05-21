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
    "TabbyML/vim-tabby",
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
    event = "VeryLazy",
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
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "arduino_language_server",
          -- We need to install clangd for arduino_language_server to work
          "clangd",
        },
      }
    end,
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
      auto_install = true,
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    opts = {},
    event = "VeryLazy",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "nacro90/numb.nvim",
    config = function ()
      require("numb").setup()
    end,
    event = "VeryLazy"
  },
  {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "williamboman/mason.nvim",
          "nvimtools/none-ls.nvim",
        },
        config = function()
          require("configs.null-ls") -- require your null-ls config here (example below)
    end,
  },
  {
    "dstein64/vim-startuptime",
    event = "VeryLazy"
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require("render-markdown").setup{}
    end,
    event = "VeryLazy",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    event = "VeryLazy",
  }
}
