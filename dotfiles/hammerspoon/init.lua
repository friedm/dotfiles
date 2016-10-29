local spaces = require "hs._asm.undocumented.spaces"
local alert = require "hs.alert"
local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local super = {"option", "shift", "control"}
local hyper = {"option", "shift", "control", "command"}

-- config
hs.window.animationDuration = 0

-- reload
hotkey.bind(hyper, "r", function() 
  hs.reload()
  hs.notify.new({title="hammerspoon", informativeText="reloaded"}):send()
end)

-- launch
hotkey.bind(super, "return", function()
  hs.application.launchOrFocus("iTerm2")
end)
hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus("Firefox")
end)

function get_spaces()
  t = spaces.layout()
  s = t[next(t)]
  space_ids = {}
  for index in ipairs(s) do
    table.insert(space_ids, s[index])
  end
  return space_ids
end

function get_adjacent_space(delta)
  current = spaces.activeSpace()

  space_ids = get_spaces()
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

function focus_in_space(space_id)
  spaces_tab = spaces.allWindowsForSpace(space_id)
  spaces_tab[next(spaces_tab)]:focus()
end

function move_to_adjacent_space(delta)
  new_space = get_adjacent_space(delta)
  spaces.changeToSpace(new_space)
  focus_in_space(new_space)
  tiling.retile()
end
 
function move_window_to_adjacent_space(window, delta)
  current_space = spaces.activeSpace()
  new_space = get_adjacent_space(delta)
  spaces.moveWindowToSpace(window, new_space)
  focus_in_space(current_space)
  tiling.retile()
end

-- spaces
hotkey.bind(super, 'h', function()
  move_to_adjacent_space(-1)
end)
hotkey.bind(hyper, 'h', function()
  window = tonumber(hs.window.focusedWindow():id())
  move_window_to_adjacent_space(window, -1)
end)

hotkey.bind(super, 'l', function()
  move_to_adjacent_space(1)
end)
hotkey.bind(hyper, 'l', function()
  window = tonumber(hs.window.focusedWindow():id())
  move_window_to_adjacent_space(window, 1)
end)

-- windows
hotkey.bind(hyper, "c", function() tiling.cycleLayout() end)
hotkey.bind(hyper, "j", function() tiling.promote() end)
hotkey.bind(hyper, "k", function() tiling.promote() end)
hotkey.bind(super, "j", function() tiling.cycle(1) end)
hotkey.bind(super, "k", function() tiling.cycle(-1) end)
hotkey.bind(super, "f", function() tiling.goToLayout('fullscreen') end)

tiling.set('layouts', {
  'gp-vertical', 'fullscreen'
})

-- init
currentSpace = tostring(spaces.currentSpace())
