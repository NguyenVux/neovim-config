local telescope = require('telescope')
local actions = require ("telescope.actions")
local action_layout = require("telescope.actions.layout")
telescope.setup({
	defaults = { 
	mappings = { 
		i = {
			["?"] = action_layout.toggle_preview,
			["<C-k>"] = actions.move_selection_previous,
      			["<C-j>"] = actions.move_selection_next,
		},
	},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		commands= {
			theme = 'dropdown',
			previewer = false,
		}
	}
})

require('telescope').load_extension('fzf')


vim.keymap.set('','<C-p>',
		require('telescope.builtin').find_files,
		{silent = true,desc= "Open telescope find files"}
)
vim.keymap.set('','<C-S-f>',
		require('telescope.builtin').live_grep,
		{silent = true,desc= "Open telescope find files"}
)

vim.keymap.set('','<C-S-p>',require'telescope.builtin'.commands,{desc='Open Command Pallete'})
