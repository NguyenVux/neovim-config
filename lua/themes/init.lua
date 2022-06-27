local M = {
	themes= {
		NightFox = "nightfox",
		Seoul256 = "seoul256"
	}
}

M.SaveThemes = function(cmd)
	local path = vim.fn.stdpath('config')
	local file = io.open(path..'lua/themes/settings.lua','r')
	file:write('vim.cmd \''..cmd..'\'')
	file:close()
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
