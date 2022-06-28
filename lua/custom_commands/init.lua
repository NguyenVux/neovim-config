package.path = package.path .. ";../*;."
local M = {}

local CommandsMap = {}

M.RegisterCommand = function(command,callback)
	vim.api.nvim_create_user_command(command,callback,{})
	table.insert(CommandsMap,1,command)
end

vim.api.nvim_create_user_command("CommandPallete",
function() 
	require'command_pallete'.OpenCommandPallete(CommandsMap)
end,{})


return M

