return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		preset = "helix",
		spec = {
			{ "<leader>ai", group = "AI", mode = { "n", "v" } },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>s", group = "search" },
			{ "<leader>x", group = "trouble", icon = { name = "trouble", cat = "filetype" } },
			{ "<leader>cj", group = "java", icon = { name = "java", cat = "filetype" } },
			{ "cj", group = "java", icon = { name = "java", cat = "filetype" } },
			{ "<up>", hidden = true },
			{ "<down>", hidden = true },
			{ "<left>", hidden = true },
			{ "<right>", hidden = true },
		},
	},
}
