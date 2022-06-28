package.path = package.path .. ";../*"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local drop_down_theme = require("telescope.themes").get_dropdown{}
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require('themes')


function ColorChange()
  local selected =  action_state.get_selected_entry()
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
  return cmd
end

function color_picker()
  local finder = finders.new_table {
    results = themes.GetThemesArray()
  }

  pickers.new(drop_down_theme, {
    prompt_title = "Select Themes",
    sorter = conf.generic_sorter(opts),
    finder = finder,
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local cmd = ColorChange()
        themes.SaveThemes(cmd)
      end)
      return true
    end
  }):find()
end





local Command = "SelectThemes"
require'custom_commands'.RegisterCommand(Command,color_picker)
