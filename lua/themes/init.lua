local M = {
	themes= {
		NightFox = "nightfox",
		Seoul256 = "seoul256"
	}
}
vim.api.notify = require'notify'
M.SaveThemes = function(cmd)
	local path = vim.fn.stdpath('config')
	local file,err = io.open(path..'\\lua\\themes\\settings.lua','w')
	if file==nil then
		vim.api.notify(err,'error')
	else
		file:write('vim.cmd \''..cmd..'\'')
		file:close()
		vim.api.notify("Save settings successfully")
	end
end

M.GetThemesArray = function()
	local arr = {}

	for key,value in pairs(M.themes) do
		table.insert(arr,value)
	end
	return arr
end

local status, lfs = pcall(require, "themes.settings")
if(not status) then
	vim.cmd('colorscheme seoul256')
end
return M
