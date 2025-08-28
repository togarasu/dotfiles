import Data.Monoid ((<>))
import XMonad
import XMonad.Actions.CycleWS (nextWS, prevWS, shiftToNext, shiftToPrev)
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.Hacks
-- import XMonad.Actions.GridSelect
-- import XMonad.Layout.IfMax

myTerminal = "wezterm"
myBorderWidth = 2
myModKey = mod1Mask
myStartupHook = do
  -- ibus-daemonの起動
  spawn "exec ibus-daemon -drx"
  -- 背景の設定
  -- spawn $ "imv-x11 -s crop " <> wallPaperPath
  -- 背景の透過
  -- spawn "xcompmgr"

-- IfMaxでウィンドウ数に応じて利用するレイアウトを制御できる
-- myLayout = tiled ||| Full ||| IfMax 3 Full tiled
myLayout = tiled ||| noBorders Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 3/7
    delta = 3/100

myLogHook = updatePointer (0.1, 0.1) (0.05, 0.25)

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
        ,   ((myModKey, xK_bracketright), nextWS)
        ,   ((myModKey, xK_bracketleft), prevWS)
        ,   ((myModKey .|. shiftMask , xK_bracketright), shiftToNext)
        ,   ((myModKey .|. shiftMask , xK_bracketleft), shiftToPrev)
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
