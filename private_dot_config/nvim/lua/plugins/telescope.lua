require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		dynamic_preview_title = true,
	},
})

-- stylua: ignore start
vim.keymap.set('n',  "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope find files" })
vim.keymap.set('n',  "<leader>fl", function() require("telescope.builtin").live_grep() end, { desc = "Telescope live grep" })
vim.keymap.set('n',  "<leader>fg", function() require("telescope.builtin").git_files() end, { desc = "Telescope git files" })
vim.keymap.set('n',  "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Telescope buffers" })
vim.keymap.set('n',  "<leader>fq", function() require("telescope.builtin").quickfix() end, { desc = "Telescope quickfix" })
-- stylua: ignore end
