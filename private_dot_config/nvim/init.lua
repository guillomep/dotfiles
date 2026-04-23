-- Opt-in
require('vim._core.ui2').enable({})
vim.cmd('packadd nvim.difftool')
vim.cmd('packadd nvim.undotree')

require("config")
require("plugins")
