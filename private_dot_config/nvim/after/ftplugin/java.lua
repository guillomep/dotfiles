-- Load dap
require("plugins.lazy.dap")

local jdtls = require("jdtls")
local lombok_path = vim.fs.joinpath(vim.fn.stdpath("data"), "lombok", "lombok.jar")
if vim.fn.filereadable(lombok_path) ~= 1 then
	vim.print("Download lombok")
	vim.fn.mkdir(vim.fs.dirname(lombok_path), "p")
	vim.net.request("https://projectlombok.org/downloads/lombok.jar", { outpath = lombok_path })
end

local java_debug_path_regex = vim.fs.joinpath(
	vim.fn.stdpath("data"),
	"mason",
	"share",
	"java-debug-adapter",
	"com.microsoft.java.debug.plugin.jar"
)

local bundles = { java_debug_path_regex }

local java_test_path_regex = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "share", "java-test", "*.jar")
local java_test_bundles = vim.split(vim.fn.glob(java_test_path_regex, 1), "\n")
local excluded = {
	"com.microsoft.java.test.runner-jar-with-dependencies.jar",
	"jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
	local fname = vim.fn.fnamemodify(java_test_jar, ":t")
	if not vim.tbl_contains(excluded, fname) then
		table.insert(bundles, java_test_jar)
	end
end

local config = {
	cmd = {
		"jdtls",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"--jvm-arg=-javaagent:" .. lombok_path,
	},
	capabilities = {
		workspace = {
			configuration = true,
		},
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
	test = true,
	settings = {
		java = {
			signatureHelp = {
				enabled = true,
				description = { enabled = true },
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			contentProvider = { preferred = "fernflower" },
			referenceCodeLens = { enabled = true },
			maven = { downloadSource = true },
			format = {
				enabled = true,
				onType = { enabled = true },
			},
			updateImportsOnPaste = { enabled = true },
			jdt = {
				ls = {
					protoBufSupport = { enabled = true },
				},
			},
		},
	},
	init_options = {
		bundles = bundles,
	},
}
jdtls.start_or_attach(config)

-- stylua: ignore start
vim.keymap.set("n", "<leader>tjf", function() require'jdtls'.test_class() end, { desc = "Test class" })
vim.keymap.set("n", "<leader>tjn", function() require'jdtls'.test_nearest_method() end, { desc = "Test function" })
-- stylua: ignore end
