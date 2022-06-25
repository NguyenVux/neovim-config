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
	local action_layout = require("telescope.actions.layout")
	telescope.setup({
		defaults = { 
		    mappings = { 
		      i = {
		        ["?"] = action_layout.toggle_preview,
		      },
		    },
		  },
		pickers = {
			find_files = {
			      theme = "dropdown",
			}	
		}
	})

	require('telescope').load_extension('fzf')
	vim.api.nvim_set_keymap('','<C-p>',':Telescope find_files<CR>',{silent=true})
end


function lsp_config()
	local lsp_config = require('lspconfig')
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	lsp_config.clangd.setup({
    		capabilities = capabilities
	})
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
	end)
	
	NVim_config()
	Setup_NVimTree()
	Setup_Theme()
	teleScope_config()
	lsp_config()
	require('Comment').setup()

end

main()
