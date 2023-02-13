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
	use 'marko-cerovac/material.nvim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
		    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		    ts_update()
		end,
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	if packer_bootstrap then
		require('packer').sync()
	end
end)