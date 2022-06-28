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
	use {
	    'numToStr/Comment.nvim'
	}
	use 'neovim/nvim-lspconfig'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use {'dstein64/vim-startuptime'}
	use "williamboman/nvim-lsp-installer"
	use 'rcarriga/nvim-notify'
end)
