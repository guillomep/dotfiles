return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{
			"mason-org/mason.nvim",
			-- opts must be set, otherwise it will not load
			opts = {},
			build = ":MasonUpdate",
			keys = {
				{
					"<leader>cm",
					"<cmd>Mason<cr>",
					desc = "Mason",
				},
			},
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					-- Helm
					"helm_ls",
					"trivy",
					-- Java
					"jdtls",
					"java-debug-adapter",
					"java-test",
					-- Lua
					"lua-language-server",
					"luacheck",
					"stylua",
					-- Python
					"pyright",
					-- Terraform
					"terraform-ls",
					"tflint",
				},
				auto_update = true,
			},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				vim.lsp.config("*", {
					inlay_hints = {
						enabled = true,
					},
					codelens = {
						enabled = false,
					},
					capabilities = {
						workspace = {
							fileOperations = {
								didRename = true,
								willRename = true,
							},
						},
					},
				})
			end,
			-- stylua: ignore
			keys = {
				{ "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
				{ "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
				{ "gr", vim.lsp.buf.references, desc = "References", nowait = true },
				{ "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
				{ "gy", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
				{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
				{ "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
				{ "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
				{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
				{ "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
				{ "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
				{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode ={"n"} },
				{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
			},
		},
		{
			"mfussenegger/nvim-jdtls",
			ft = "java",
			-- stylua: ignore
			keys = {
				{ "<leader>cjtc", "<Cmd>lua require('jdtls').test_class()<CR>", desc = "Test class", mode = { "n" } },
				{ "<leader>cjtm", "<Cmd>lua require('jdtls').test_nearest_method()<CR>", desc = "Test method", mode = { "n" } },
				{ "cjrv", "<Cmd>lua require('jdtls').extract_variable()<CR>", desc = "Extract variable", mode = { "n" } },
				{ "cjrc", "<Cmd>lua require('jdtls').extract_constant()<CR>", desc = "Extract constant", mode = { "n" } },
				{ "cjrm", "<Cmd>lua require('jdtls').extract_variable()<CR>", desc = "Extract method", mode = { "n" } },
			},
		},
	},
}
