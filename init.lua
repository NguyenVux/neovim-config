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
	vim.keymap.set('','<C-b>',
		function()
			nvim_tree.toggle(false,true)
		end,
		{silent = true,desc= "Open Nvim-tree"}
	)
end



function Setup_Theme()
	require('lualine').setup()
end


function NVim_config()
	vim.o.relativenumber=true
end

function lsp_config()
	local lsp_config = require('lspconfig')
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	lsp_config.clangd.setup({
    		capabilities = capabilities
	})
end

function main()	
	require('Plugins')
	require('telescope_config')
	require('custom_commands')
	require('color_picker')
	require('configs')
	NVim_config()
	Setup_NVimTree()
	Setup_Theme()
	lsp_config()
	require('Comment').setup()
	vim.opt.shell = "pwsh.exe -NoLogo"
	vim.opt.shellcmdflag="-c"
	

end

main()