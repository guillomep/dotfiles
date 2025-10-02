return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"bash",
				"css",
				"diff",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"groovy",
				"hcl",
				"helm",
				"html",
				"java",
				"javadoc",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"properties",
				"python",
				"regex",
				"vim",
				"vimdoc",
				"yaml",
			},
			auto_install = true,
		})
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
}
