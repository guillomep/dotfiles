return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			example = "compact_files",
		},
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		toggle = { enabled = true },
		words = { enabled = true },
	},
    -- stylua: ignore
	keys = {
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
		{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History", },
		-- find
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects", },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
		-- git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line", },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)", },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File", },
		-- search
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History", },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands", },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", },
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
		{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
		-- Other
		{ "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },
		{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
		{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
		{ "<C-t>", function() Snacks.terminal() end, desc = "Toggle Terminal", },
	},
	init = function()
		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
	end,
}
