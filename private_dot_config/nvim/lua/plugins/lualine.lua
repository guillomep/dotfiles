require("lualine").setup({
	sections = {
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress", "lsp_status" },
	},
	extensions = {
		"mason",
		"trouble",
	},
})
