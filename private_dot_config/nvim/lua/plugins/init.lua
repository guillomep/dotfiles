vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://codeberg.org/mfussenegger/nvim-dap" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://codeberg.org/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://gitlab.com/schrieveslaach/sonarlint.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/which-key.nvim" },
})

local here = ... .. "."
require(here .. "catppuccin")
require(here .. "bufferline")
require(here .. "lualine")
require(here .. "telescope")
require(here .. "autopairs")
require(here .. "conform")
require(here .. "lsp")
require(here .. "oil")
require(here .. "surround")
require(here .. "sonarlint")
require(here .. "treesitter")
require(here .. "which-key")
