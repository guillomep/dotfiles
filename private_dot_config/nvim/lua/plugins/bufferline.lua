return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. n .. sym
				end
				return s
			end,
			groups = {
				options = {
					toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
				},
				items = {
					{
						name = "Tests", -- Mandatory
						priority = 2, -- determines where it will appear relative to other groups (Optional)
						icon = " ", -- Optional
						matcher = function(buf) -- Mandatory
							return buf.path:match("%_test") or buf.path:match("%_spec") or buf.path:match("%Test")
						end,
					},
					{
						name = "Docs",
						matcher = function(buf)
							return buf.path:match("%.md") or buf.path:match("%.txt")
						end,
					},
				},
			},
		},
	},
}
