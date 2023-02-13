vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


local config = {
	auto_reload_on_write = true,
	sync_root_with_cwd = true,
	view = {
		hide_root_folder = true
	},
	git = {
		enable = true,
		ignore = false,
	},
}
require("nvim-tree").setup(config)
local api = require("nvim-tree.api")


vim.keymap.set("n","<C-b>",api.tree.toggle)