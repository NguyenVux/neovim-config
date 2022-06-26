package.path = package.path .. ";../*"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local drop_down_theme = require("telescope.themes").get_dropdown{}
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


function runCommand()
  local selected =  action_state.get_selected_entry()
  local cmd = selected[1]
  vim.cmd(cmd)
end


function OpenCommandPallete(commands)
  local themes = require('themes')

  local finder = finders.new_table {
    results = commands
  }

  local opts = {
    prompt_title = "Commands",
    sorter = conf.generic_sorter({}),
    finder = finder,
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        runCommand()
      end)
      return true
    end
  }

  pickers.new(drop_down_theme,opts):find()
end


return {
  OpenCommandPallete = OpenCommandPallete
}