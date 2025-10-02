return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	--stylua: ignore
	keys = {
		{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files", },
		{ "<leader>fl", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep", },
		{ "<leader>fg", function() require("telescope.builtin").git_files() end, desc = "Telescope git files", },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers", },
		{ "<leader>fq", function() require("telescope.builtin").quickfix() end, desc = "Telescope quickfix", },
	},
}
