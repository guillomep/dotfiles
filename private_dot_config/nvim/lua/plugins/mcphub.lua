return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	keys = {
		{
			"<leader>aim",
			"<cmd>MCPHub<CR>",
			desc = "Open MCPHub",
		},
	},
	config = function()
		require("mcphub").setup()
	end,
}
