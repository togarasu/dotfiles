import Data.Monoid ((<>))
import XMonad
import XMonad.Actions.CycleWS (nextWS, prevWS, shiftToNext, shiftToPrev, emptyWS, moveTo, shiftTo, Direction1D(..), WSType(..))
import XMonad.Actions.SwapWorkspaces (swapTo)
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Layout
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.Hacks
-- import XMonad.Actions.GridSelect
-- import XMonad.Layout.IfMax

myTerminal = "alacritty"
myBorderWidth = 2
myModKey = mod1Mask
myStartupHook = do
  -- ibus-daemonの起動
  -- spawn "exec flatpak run org.fcitx.Fcitx5"
  spawn "flatpak run org.fcitx.Fcitx5 -d"
  -- 背景の設定
  spawn $ "feh --randomize --bg-scale " <> "/home/atled/Pictures/theHunter_CoW/"
  -- 背景の透過
  spawn "xcompmgr"

-- IfMaxでウィンドウ数に応じて利用するレイアウトを制御できる
-- myLayout = tiled ||| Full ||| IfMax 3 Full tiled
myLayout = tiled ||| noBorders Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

myLogHook =
  updatePointer (0.1, 0.1) (0.05, 0.25)
  -- <> fadeInactiveLogHook 0xf0f0f0f0
  <> fadeInactiveLogHook 0xdddddddd

myManageHookFloat = composeAll
  [
    className =? "Minecraft" --> doFloat
  ]

myConfig = def
        { handleEventHook = fixSteamFlicker
        , manageHook = manageHook def <+> myManageHookFloat
        , startupHook = myStartupHook
        , logHook = myLogHook
        , terminal = myTerminal
        , focusedBorderColor = cDarkGrey
        , normalBorderColor = cBlack
        , borderWidth = myBorderWidth
        , modMask = myModKey
        , layoutHook = myLayout
        } 
        `additionalKeys`
        [ 
            ((myModKey, xK_F1), spawn "nautilus")
        ,   ((myModKey, xK_F2), spawn "firefox")
        ,   ((myModKey, xK_s), spawn "screenShot")
        ,   ((myModKey, xK_p), spawn "rofi -show drun")
        ,   ((myModKey, xK_bracketright), moveTo Next (Not emptyWS))
        ,   ((myModKey, xK_bracketleft), moveTo Prev (Not emptyWS))
        ,   ((myModKey, xK_n), moveTo Next emptyWS)
        ,   ((myModKey .|. shiftMask, xK_n), shiftTo Next emptyWS)
        ,   ((myModKey .|. shiftMask , xK_bracketright), shiftToNext)
        ,   ((myModKey .|. shiftMask , xK_bracketleft), shiftToPrev)
        ,   ((myModKey .|. controlMask, xK_bracketright), swapTo Next)
        ,   ((myModKey .|. controlMask, xK_bracketleft), swapTo Prev)
        ]

bgColor   = "#363434"
cBlue     = "#4287f5"
cRed      = "#f54272"
cGreen    = "#42f599"
cYellow   = "#f5d142"
cPink     = "#f542bf"
cOrange   = "#f58a42"
cGrey     = "#c2c2c2"
cDarkGrey = "#787576"
cBlack    = "#000000"

main :: IO()
main = do
  xmonad =<< xmobar (ewmh myConfig)
