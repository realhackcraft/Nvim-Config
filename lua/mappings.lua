require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


if vim.g.neovide then
  map('n', '<D-s>', ':w<CR>') -- Save
  map('v', '<D-c>', '"+y') -- Copy
  map('n', '<D-v>', '"+P') -- Paste normal mode
  map('v', '<D-v>', '"+P') -- Paste visual mode
  map('c', '<D-v>', '<C-R>+') -- Paste command mode
  map('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end


vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
