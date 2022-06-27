






function GetBufferSwitcher(index)
	return function()
		require'bufferline.state'.goto_buffer(index)
	end
end


for count = 1,9,1 do
	local value = tostring(count)
	vim.keymap.set('','<C-'..value..'>',GetBufferSwitcher(count),{silent = true,desc= "open "..value.." buffer"})
end


vim.keymap.set('','<C-tab>',
function() 
	vim.cmd('bn')
end,{silent=true})
vim.keymap.set('','<C-S-tab>',
function() 
	vim.cmd('bp')
end,{silent=true})

require('bufferline').setup{
	animation = true,
	icons = 'both',
	closable = false,
	clickable = false
}

