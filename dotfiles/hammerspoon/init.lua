local alert = require "hs.alert"
local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local super = {"option", "shift", "control"}
local hyper = {"option", "shift", "control", "command"}

local spaces = require "spaces"
require "hotkeys"

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

-- spaces
hotkey.bind(super, 'h', function()
  new_space = spaces.move_to_adjacent_space(-1)
  spaces.focus_in_space(new_space)
  tiling.retile()
end)
hotkey.bind(hyper, 'h', function()
  window = tonumber(hs.window.focusedWindow():id())
  spaces.move_window_to_adjacent_space(window, -1)
  tiling.retile()
  spaces.move_to_adjacent_space(-1)
  tiling.retile()
end)

hotkey.bind(super, 'l', function()
  new_space = spaces.move_to_adjacent_space(1)
  spaces.focus_in_space(new_space)
  tiling.retile()
end)
hotkey.bind(hyper, 'l', function()
  window = tonumber(hs.window.focusedWindow():id())
  spaces.move_window_to_adjacent_space(window, 1)
  tiling.retile()
  spaces.move_to_adjacent_space(1)
  tiling.retile()
end)

-- windows
hotkey.bind(hyper, "c", function() tiling.cycleLayout() end)
hotkey.bind(hyper, "j", function() tiling.cycleWindows(-1) end)
hotkey.bind(hyper, "k", function() tiling.cycleWindows(1) end)
hotkey.bind(super, "j", function() tiling.cycle(-1) end)
hotkey.bind(super, "k", function() tiling.cycle(1) end)
hotkey.bind(super, "f", function() tiling.goToLayout('fullscreen') end)

tiling.set('layouts', {
  'gp-vertical', 'fullscreen'
})
