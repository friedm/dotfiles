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

last_focused = {}
local function get_mru_window_in_space(space_id)
  for index in ipairs(last_focused) do
    id = last_focused[index].space
    if space_id == id then
      return last_focused[index].win
    end
  end
  return nil
end

function module.focus_in_space(space_id)
  spaces_tab = spaces.allWindowsForSpace(space_id)

  win = spaces_tab[next(spaces_tab)]
  win = get_mru_window_in_space(space_id) or win
  if win == nil then
    hs.window.desktop():focus()
  else
    win:focus()
  end
end

local function update_space_mru_window_cache() 
  current_space = spaces.activeSpace()
  for index in ipairs(last_focused) do
    if last_focused[index].space == current_space then
      table.remove(last_focused, index)
    end
  end
  table.insert(last_focused, 1, {space=spaces.activeSpace(), win=hs.window.focusedWindow()})
end

function module.move_to_adjacent_space(delta)
  update_space_mru_window_cache()

  new_space = module.get_adjacent_space(delta)
  spaces.changeToSpace(new_space)
  return new_space
end
 
function module.move_window_to_adjacent_space(window, delta)
  new_space = module.get_adjacent_space(delta)
  spaces.moveWindowToSpace(window, new_space)
  return new_space
end

return module
