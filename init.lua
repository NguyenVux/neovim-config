local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
	 	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	 	vim.cmd [[packadd packer.nvim]]
	 	return true
	end
	return false
      end
      
local packer_bootstrap = ensure_packer()

local packer = require('packer')


packer.init {
	display = {
		open_fn = function ()
			return require("packer.util").float { border = "rounded" } 
		end,
	},
}

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
		 	'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
		 	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		 	ts_update()
		end,
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { 
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', 
				run='cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
			}
			
		}
	}

	use 'Raimondi/delimitMate'
	use 'Mofiqul/vscode.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {'akinsho/bufferline.nvim' , requires = 'nvim-tree/nvim-web-devicons'}
	use "lukas-reineke/indent-blankline.nvim"
	use {
		'lewis6991/gitsigns.nvim',
	}
	use 'neovim/nvim-lspconfig'
	use { "sitiom/nvim-numbertoggle" }
	use {"akinsho/toggleterm.nvim"}
	use 'ggandor/lightspeed.nvim'
	use {'hrsh7th/nvim-cmp', 
		requires = {
			"quangnguyen30192/cmp-nvim-ultisnips",
			"amarakon/nvim-cmp-buffer-lines",
			'hrsh7th/cmp-path',
			'SirVer/ultisnips',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline"
		}
	}
	if packer_bootstrap then
		require('packer').sync()
	end
end)
