local dapview = require("dap-view")
dapview.setup({
	winbar = { controls = { enabled = true } },
	virtual_text = { enabled = true },
})

local dap = require("dap")
dap.listeners.after.event_initialized["me.dap.keys"] = function()
	vim.keymap.set("n", "<down>", dap.step_over, { silent = true })
	vim.keymap.set("n", "<left>", dap.step_out, { silent = true })
	vim.keymap.set("n", "<right>", dap.step_into, { silent = true })
end
local reset_keys = function()
	pcall(vim.keymap.del, "n", "<down>")
	pcall(vim.keymap.del, "n", "<left>")
	pcall(vim.keymap.del, "n", "<right>")
end
dap.listeners.after.event_terminated["me.dap.keys"] = reset_keys
dap.listeners.after.disconnected["me.dap.keys"] = reset_keys

dap.listeners.after.event_initialized["me.dap.ui"] = dapview.open
dap.listeners.after.event_terminated["me.dap.ui"] = dapview.close
dap.listeners.after.disconnected["me.dap.ui"] = dapview.close

-- stylua: ignore start
vim.keymap.set("n", "<leader>da", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>de", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dd", function() require("dap").step_over() end, { desc = "Step over" })
vim.keymap.set("n", "<leader>df", function() require("dap").step_into() end, { desc = "Step into" })
vim.keymap.set("n", "<leader>dg", function() require("dap").step_out() end, { desc = "Step out" })
vim.keymap.set("n", "<leader>dr", function() require("dap").restart() end, { desc = "Restart" })
vim.keymap.set("n", "<leader>ds", function() require("dap").pause() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>du", function() require("dap-view").toggle() end, { desc = "Toggle debug ui" })
-- stylua: ignore end

dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}
