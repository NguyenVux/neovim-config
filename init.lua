--config = 


function Setup_NVimTree()
	local	nvim_tree = require('nvim-tree')
	nvim_tree.setup{
		update_cwd = true,
		filesystem_watchers = {
		        enable = false,
        		interval = 100,
		}
	}
	--vim.api.nvim_set_keymap('','<C-b>',':NvimTreeToggle <CR>',{silent=true})
	vim.keymap.set('','<c-b>',
		function()
			nvim_tree.toggle(false,true)
		end,
		{silent = true,desc= "open nvim-tree"}
	)
end



function Setup_Theme()
	require('lualine').setup()
end


function NVim_config()
	vim.o.relativenumber=true
end

function lsp_config()
	end

function main()	
	require('Plugins')
	require('telescope_config')
	require('custom_commands')
	require('color_picker')
	require('configs')
	require('lsp')
	NVim_config()
	Setup_NVimTree()
	Setup_Theme()
	lsp_config()
	require('Comment').setup()
	

end

main()
