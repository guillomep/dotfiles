local o = vim.opt

vim.g.mapleader = "ù"

-- allow backspacing over everything in insert mode
o.backspace = indent, eol, start

-- show the cursor position all the time
o.ruler = true

-- display incomplete commands
o.showcmd = true

-- do incremental searching
o.incsearch = true

-- In many terminal emulators the mouse works just fine, thus enable it.
if vim.fn.has("mouse") then
	mouse = a
end

-- Also switch on highlighting the last used search pattern.
o.hlsearch = true

-- General configuration
o.textwidth = 120
o.confirm = true
o.scrolloff = 9
o.smartcase = true
o.title = true

-- Only draw when necessary
o.lazyredraw = false
o.ttyfast = true

-- Line number
o.number = true
o.relativenumber = true

-- Completion on file
o.wildmenu = true
o.wildmode = "list:longest"
-- View match
o.showmatch = true

-- Completion
-- Ensures the menu appears even for a single match and uses the native popup window.
o.completeopt = "menu,menuone,noselect,popup,fuzzy,preview"
o.complete = ".,w,b,u,t,o"
o.autocomplete = true
o.autocompletedelay = 200
vim.keymap.set("i", "<Tab>", '(pumvisible() ? "<C-n>" : "<Tab>")', { silent = true, expr = true, remap = false })
vim.keymap.set("i", "<S-Tab>", '(pumvisible() ? "<C-p>" : "<Tab>")', { silent = true, expr = true, remap = false })

-- Show whitespaces (tab, non-breakable space, traling space)
o.list = true
vim.opt.listchars = { nbsp = "¤", tab = "▸ ", trail = "¤", extends = ">", precedes = "<" }

-- Indent
o.smartindent = true
o.tabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4

-- Backup
o.backup = false
o.directory = vim.fn.stdpath("state") .. "/swap/"
o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo/"

-- Disable clipboard mangling
vim.g.clipboard = ""

-- Folding
o.foldcolumn = "0"
o.foldenable = false
o.foldnestmax = 4
o.foldtext = ""
o.foldlevel = 99
o.foldlevelstart = 99

-- Diagnostics
vim.diagnostic.config({
	float = {
		source = "always",
		border = vim.o.winborder,
	},
})
