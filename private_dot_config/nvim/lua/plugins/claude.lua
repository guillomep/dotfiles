return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	lazy = true,
	keys = {
		{ "<leader>ac", nil, desc = "Claude Code" },
		{ "<leader>acc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>acr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>acC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>acm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>acb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>acs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>acs",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{ "<leader>aca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>acd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		{ "<M-c>", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
	},
	opts = {
		terminal = {
			split_side = "left",
			split_width_percentage = 0.40,
			snacks_win_opts = {
				keys = {
					claude_hide = {
						"<M-c>",
						function(self)
							self:hide()
						end,
						mode = "t",
						desc = "Hide",
					},
				},
			},
		},
		git_repo_cwd = true,
	},
}
