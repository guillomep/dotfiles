require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>ai", group = "AI", mode = { "n", "v" } },
		{ "<leader>c", group = "code" },
		{ "<leader>d", group = "debug" },
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "git" },
		{ "<leader>s", group = "search" },
		{ "<leader>t", group = "test" },
		{ "<leader>x", group = "trouble", icon = { name = "trouble", cat = "filetype" } },
		{ "<leader>tj", group = "java", icon = { name = "java", cat = "filetype" } },
		{ "cj", group = "java", icon = { name = "java", cat = "filetype" } },
		{ "<up>", hidden = true },
		{ "<down>", hidden = true },
		{ "<left>", hidden = true },
		{ "<right>", hidden = true },
	},
	triggers = {
		{ "<auto>", mode = "nixsotc" },
		{ "a", mode = { "n", "v" } },
	},
})

-- stylua: ignore
vim.keymap.set({'n', 'i', 'v'}, "<leader>?", function() require('which-key').show() end, { desc = "Open which-key" })
