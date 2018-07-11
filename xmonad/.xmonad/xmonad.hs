import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.ResizableTile ( ResizableTall(..), MirrorResize(MirrorShrink, MirrorExpand) )
import XMonad.Layout.MultiToggle ( single, mkToggle, Toggle(..) )
import XMonad.Layout.MultiToggle.Instances ( StdTransformers(..) )
import XMonad.Hooks.ManageDocks (avoidStruts)
import System.IO
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M


myKeys =
  [ ("M-<Return>", spawn "rofi -show window")
  , ("M-S-<Return>", spawn "rofi -show run")
  , ("M-b", spawn "urxvt -e /bin/bash")
  , ("M-t", spawn "urxvt -e /bin/bash -c 'tmux attach || tmux'")
  , ("M-S-t", spawn "urxvt -e /bin/zsh")
  , ("M-S-l", spawn "xautolock -locknow")
  , ("M-S-<Space>", withFocused $ windows . W.sink)
  , ("M-z", sendMessage $ XMonad.Layout.MultiToggle.Toggle FULL)
  , ("M-<Up>", (sendMessage MirrorExpand))
  , ("M-<Left>", (sendMessage MirrorExpand))
  , ("M-<Down>", (sendMessage MirrorShrink))
  , ("M-<Right>", (sendMessage MirrorShrink))
  ]

myLayout = mkToggle (single FULL) (tall ||| Mirror tall)
  where tall = ResizableTall 1 (3/100) (1/2) []

main = do xmonad $ ewmh $ fullscreenSupport $ defaultConfig {
    modMask = mod1Mask,
    terminal = "urxvt",
    focusFollowsMouse = False,
    borderWidth = 0,
    layoutHook = myLayout
    } `additionalKeysP` myKeys
