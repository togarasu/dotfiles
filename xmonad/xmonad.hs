import XMonad
import XMonad.Layout
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops

import Data.Monoid ((<>))
-- import XMonad.Layout.BinarySpacePartition

wallPaperPath = "$HOME/Pictures/Wallpapers/9171828682516415407.jpg"

main :: IO()
main = do
  xmonad =<< xmobar (ewmh myConfig)


myTerminal = "wezterm"
myBorderWidth = 2
myModKey = mod1Mask
myStartupHook = do
  -- ibus-daemonの起動
  spawn "exec ibus-daemon -drx"
  -- 背景の設定
  -- TODO: 背景画像の設定だけ別のファイルからロードするようにする
  spawn $ "feh --bg-scale " <> wallPaperPath
  -- 背景の透過
  spawn "xcompmgr"
myLayout = tiled ||| Full 
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 4/7
    delta = 3/100

myManageHookFloat = composeAll
  [
    className =? "Minecraft" --> doFloat
  ]

myConfig = def {
            manageHook = manageHook def <+> myManageHookFloat 
        ,   startupHook = myStartupHook
        ,   terminal = myTerminal
        ,   focusedBorderColor = cBlue
        ,   normalBorderColor = cGrey
        ,   borderWidth = myBorderWidth
        ,   modMask = myModKey
        ,   layoutHook = myLayout
        } 
        -- `additionalKeys`
        -- [ 
        --     ((myModKey, xK_n), spawn "notable")
        -- ]
        `additionalKeysP`
        [
            ("M-<F1>",spawn "qutebrowser")
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
