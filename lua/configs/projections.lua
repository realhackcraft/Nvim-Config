require("projections").setup {
  workspaces = { -- Default workspaces to search for
    { "~/Documents/", { ".git" } }, -- Documents/dev is a workspace. patterns = { ".git" }
    { "~/repos", {} }, -- An empty pattern list indicates that all subdirectories are considered projects
    "~/dev", -- dev is a workspace. default patterns is used (specified below)
    "~",
    "~/.config/",
  },
  store_hooks = {
    pre = function()
      -- nvim-tree
      local nvim_tree_present, api = pcall(require, "nvim-tree.api")
      if nvim_tree_present then
        api.tree.close()
      end
    end,
  },
  -- patterns = { ".git", ".svn", ".hg" },      -- Default patterns to use if none were specified. These are NOT regexps.
}

-- Bind <leader>fp to Telescope projections
require("telescope").load_extension "projections"
vim.keymap.set("n", "<leader>fp", function()
  vim.cmd "Telescope projections"
end)

-- Autostore session on VimExit
local Session = require "projections.session"
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function()
    Session.store(vim.loop.cwd())
  end,
})

-- Switch to project if vim was started in a project dir
local switcher = require "projections.switcher"
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if vim.fn.argc() == 0 then
      switcher.switch(vim.loop.cwd())
    end
  end,
})
