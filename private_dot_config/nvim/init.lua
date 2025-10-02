-- Avoid conflict between netrw and nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy.nvim
require("config.lazy")
