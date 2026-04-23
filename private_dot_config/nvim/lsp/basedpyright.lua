return {
	before_init = function(_, config)
        if config.settings.python == nil then
            config.settings.python = {}
        end
		if vim.env.VIRTUAL_ENV then
			config.settings.python.pythonPath =
				vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python")
		end

		if vim.fn.isdirectory(vim.fs.joinpath(config.root_dir, ".venv")) then
			config.settings.python.pythonPath =
				vim.fs.joinpath(config.root_dir, ".venv", "bin", "python")
		end
	end,
    settings = {
      basedpyright = {
        analysis = {
          autoFormatStrings = true,
        }
      }
    }
}
