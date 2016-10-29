local module = {}
local spaces = require "hs._asm.undocumented.spaces"

function module.get_spaces()
  t = spaces.layout()
  s = t[next(t)]
  space_ids = {}
  for index in ipairs(s) do
    table.insert(space_ids, s[index])
  end
  return space_ids
end

function module.get_adjacent_space(delta)
  current = spaces.activeSpace()

  space_ids = module.get_spaces()
  current_index = -1
  for index in ipairs(space_ids) do
    if space_ids[index] == current then
      current_index = index 
    end
  end
  current_index = current_index + delta
  if space_ids[current_index] == nil then
    if delta > 0 then
      current_index = 1
    else
      current_index = #space_ids
    end
  end
  return space_ids[current_index]
end

function module.focus_in_space(space_id)
  spaces_tab = spaces.allWindowsForSpace(space_id)
  spaces_tab[next(spaces_tab)]:focus()
end

function module.move_to_adjacent_space(delta)
  new_space = module.get_adjacent_space(delta)
  spaces.changeToSpace(new_space)
end
 
function module.move_window_to_adjacent_space(window, delta)
  --current_space = spaces.activeSpace()
  new_space = module.get_adjacent_space(delta)
  spaces.moveWindowToSpace(window, new_space)
  --module.focus_in_space(current_space)
end

return module
