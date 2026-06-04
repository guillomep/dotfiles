-- Mason
require("mason").setup()
-- vim.cmd("MasonUpdate")
vim.keymap.set({ "n", "i", "v" }, "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Mason tool installer
require("mason-tool-installer").setup({
	ensure_installed = {
		-- Helm
		"helm-ls",
		"trivy",
		-- HTML
		"html-lsp",
		-- Java
		"jdtls",
		"java-debug-adapter",
		"java-test",
		-- Lua
		"lua-language-server",
		"luacheck",
		"stylua",
		-- Markdown
		"mdformat",
		-- Python
		"basedpyright",
		--"pyright",
		-- Sonar
		"sonarlint-language-server",
		-- Terraform
		"terraform-ls",
		"terraform",
		"tflint",
	},
	auto_update = true,
})

-- LSP
vim.lsp.config("*", {
	inlay_hints = {
		enabled = true,
	},
	codelens = {
		enabled = true,
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

require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local client = vim.lsp.get_client_by_id(client_id)
		if client and client:supports_method("textDocument/completion") then
			-- Enable native LSP completion for this client + buffer
			vim.lsp.completion.enable(true, client_id, args.buf, {
				autotrigger = true, -- auto-show menu as you type (recommended)
			})
		end
		if client and client:supports_method("textDocument/onTypeFormatting") then
			vim.lsp.on_type_formatting.enable(true, { client_id = client_id })
		end
	end,
})

vim.lsp.inlay_hint.enable()
vim.lsp.codelens.enable()

-- stylua: ignore start
vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help({ close_events = { "CursorMoved", "BufHidden" } }) end, { desc = "Signature help" })
vim.keymap.set("n", "grd", function() vim.lsp.buf.definition() end, { desc = "vim.lsp.buf.definition()" })
vim.keymap.set("n", "grc", function() vim.lsp.buf.declaration() end, { desc = "vim.lsp.buf.declaration()" })
-- stylua: ignore end
