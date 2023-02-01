local wezterm = require 'wezterm'

-- マシン毎の振舞いを設定する
-- できればOS毎にしたいのだが...
local hostname = wezterm.hostname()
if hostname == 'tytppc18' then
  default_prog = {"pwsh"}
if hostname == 'DESKTOP-KOU6VUU' then
  default_prog = {"pwsh"}
elseif hostname == 'atled-desktop' then
  default_prog = {"zsh"}
else
  default_prog = {"zsh"}
end


return {
  default_prog = default_prog,
  font_size = 11,
  color_scheme = "Pop (base16)",
  -- color_scheme = "Numix Darkest (terminal.sexy)",
  window_background_opacity = .80,
  hide_tab_bar_if_only_one_tab = true,
  use_ime = true,
  -- ime_preedit_rendering = 'System', # IMEのレンダリングを誰がやるか
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 1,
    right = 1,
    top = 1,
    bottom = 1
  },
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  colors = {
    cursor_bg = '#52ad70',
  },
  keys = {
    {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
    },
    {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
    },
    {
      key = 'p',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ShowLauncherArgs {flags = 'FUZZY|COMMANDS'}
    },
    {
      key = '[',
      mods = 'CTRL',
      action = wezterm.action.SendKey {key = 'Escape'},
    }
  },
}
