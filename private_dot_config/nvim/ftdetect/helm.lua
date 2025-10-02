local function isHelm()
	local extension = vim.fn.expand("%:e")

	-- Helm
	local filepath = vim.fn.expand("%:p")

	local templates_pos = filepath:find("/templates/")
	if templates_pos ~= nil then
		local chart_root = string.sub(filepath, 0, templates_pos)
		if
			vim.fn.filereadable(chart_root .. "/Chart.yaml")
			and (extension == "yaml" or extension == "yml" or extension == "tpl" or extension == "txt")
		then
			return "helm"
		end
	end

	return nil
end

vim.filetype.add({
	extension = {
		-- Helmfile
		gotmpl = "helm",
	},
	filename = {
		["Chart.yaml"] = "helm",
		["values.yaml"] = "helm",
	},
	pattern = {
		[".*/templates/.*.yaml"] = isHelm,
		[".*/templates/.*.tpl"] = isHelm,
		["helmfile.*.yaml"] = isHelm,
	},
})
