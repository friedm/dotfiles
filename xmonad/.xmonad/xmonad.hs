import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks (avoidStruts)
import System.IO
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M


myKeys =
  [ ("M-<Return>", spawn "rofi -show window")
  , ("M-S-<Return>", spawn "rofi -show run")
  , ("M-f", (sendMessage (Toggle "Full")))
  , ("M-t", spawn "urxvt -e bash -c 'tmux attach || tmux'")
  , ("M-S-t", spawn "urxvt")
  , ("M-S-l", spawn "xautolock -locknow")
  , ("M-<Space>", withFocused $ windows . W.sink)
  ]

myLayout = toggleLayouts 
        (noBorders (fullscreenFull Full))
        (Tall 1 (3/100) (1/2))

main = do xmonad $ ewmh $ fullscreenSupport $ defaultConfig {
    modMask = mod1Mask,
    terminal = "urxvt",
    focusFollowsMouse = False,
    borderWidth = 0,
    layoutHook = myLayout
    } `additionalKeysP` myKeys
