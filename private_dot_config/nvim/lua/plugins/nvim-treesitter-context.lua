return {
	"nvim-treesitter/nvim-treesitter-context",
	lazy = false,
	config = function()
		require("treesitter-context").setup({
			max_lines = 3,
		})
	end,
}
