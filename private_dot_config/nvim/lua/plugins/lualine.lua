local function is_mcphub_loaded()
	-- Check if MCPHub is loaded
	if not vim.g.loaded_mcphub then
		return "󰐻 -"
	end

	local count = vim.g.mcphub_servers_count or 0
	local status = vim.g.mcphub_status or "stopped"
	local executing = vim.g.mcphub_executing

	-- Show "-" when stopped
	if status == "stopped" then
		return "󰐻 -"
	end

	-- Show spinner when executing, starting, or restarting
	if executing or status == "starting" or status == "restarting" then
		local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		local frame = math.floor(vim.loop.now() / 100) % #frames + 1
		return "󰐻 " .. frames[frame]
	end

	return "󰐻 " .. count
end

local function mcphub_color()
	if not vim.g.loaded_mcphub then
		return { fg = "#6c7086" } -- Gray for not loaded
	end

	local status = vim.g.mcphub_status or "stopped"
	if status == "ready" or status == "restarted" then
		return { fg = "#50fa7b" } -- Green for connected
	elseif status == "starting" or status == "restarting" then
		return { fg = "#ffb86c" } -- Orange for connecting
	else
		return { fg = "#ff5555" } -- Red for error/stopped
	end
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					{
						function()
							return is_mcphub_loaded()
						end,
						color = function()
							return mcphub_color()
						end,
					},
				},
				lualine_y = { "progress", "lsp_status" },
			},
			extensions = {
				-- TODO
				"lazy",
				"mason",
				"nvim-tree",
				"trouble",
			},
		})
	end,
}
