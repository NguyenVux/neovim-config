function Setup_NVimTree()
	local	nvim_tree = require('nvim-tree')
	nvim_tree.setup{
		update_cwd = true,
		filesystem_watchers = {
		        enable = false,
        		interval = 100,
		}
	}
	vim.api.nvim_set_keymap('','<C-b>',':NvimTreeToggle <CR>',{silent=true})
end



function Setup_Theme()
	vim.cmd([[colorscheme nightfox]])
	require('lualine').setup()
end


function NVim_config()
	vim.o.relativenumber=true
end

function teleScope_config()
	local telescope = require('telescope')
	telescope.setup()

	require('telescope').load_extension('fzf')
	vim.api.nvim_set_keymap('','<C-p>',':Telescope find_files<CR>',{silent=true})
end

function main()	
	require('packer').startup(function()
	
		use 'wbthomason/packer.nvim'
		use 'kyazdani42/nvim-web-devicons'
		use 'romgrk/barbar.nvim'
		use 'kyazdani42/nvim-tree.lua'
		use "EdenEast/nightfox.nvim"
		use {
		  'nvim-telescope/telescope.nvim',
		  requires = { {'nvim-lua/plenary.nvim'} }
		}
		use 'shaunsingh/seoul256.nvim'
		use 'nvim-lualine/lualine.nvim'
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		use {
        		'nvim-treesitter/nvim-treesitter',
		        run = ':TSUpdate'
    }
	end)
	
	NVim_config()
	Setup_NVimTree()
	Setup_Theme()
	teleScope_config()

end

main()
