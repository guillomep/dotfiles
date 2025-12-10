local keymap = vim.keymap.set

-- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- so that you can undo CTRL-U after inserting a line break.
keymap("i", "<C-U>", "<C-G>u<C-U>", { desc = "Break before deletes backward" })

-- Open or close nvim-tree
--keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { desc = "Toggle NvimTree", silent = true, noremap = true })

-- Reopen with sudo
keymap("c", "w!!", "%!sudo tee > /dev/null %", { desc = "Reopen with sudo" })

-- Repeat macro on space
keymap("n", "<Space>", "@q", { desc = "Repeat macro on space", remap = true })

-- AZERTY sucks
keymap("n", ";", ".", { desc = "Remap 'Repeat the last action', thanks AZERTY" })

-- Disable the devil
keymap("", "<Left>", "<nop>", { desc = "Don't use that key" })
keymap("", "<Right>", "<nop>", { desc = "Don't use that key" })
keymap("", "<Up>", "<nop>", { desc = "Don't use that key" })
keymap("", "<Down>", "<nop>", { desc = "Don't use that key" })
keymap("i", "<Left>", "<nop>", { desc = "Don't use that key" })
keymap("i", "<Right>", "<nop>", { desc = "Don't use that key" })
keymap("i", "<Up>", "<nop>", { desc = "Don't use that key" })
keymap("i", "<Down>", "<nop>", { desc = "Don't use that key" })

-- Disable search highlight without typing 'hfdskjh'
-- and re-enabled it when use a search function
keymap("n", "<C-F>", ":set hls!<cr>", { desc = "Toggle highlight", remap = true })
keymap("n", "/", ":set hls<cr>/", { desc = "Force highlight on search" })
keymap("n", "n", ":set hls<cr>n", { desc = "Force high on search" })
keymap("n", "*", ":set hls<cr>*", { desc = "Force high on search" })

-- Toggle line numbers
keymap("n", "<C-L>", ":set nu!<cr>:set rnu!<cr>", { desc = "Toggle line numbers" })

-- Open diagnostics
keymap("n", "<leader>xd", function() vim.diagnostic.open_float() end, { desc = "Show line diagnostics" })
