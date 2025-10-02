return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline",
			},
		})
	end,
}
