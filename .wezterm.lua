local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- colors
config.color_scheme = 'Tokyo Night'
config.colors = {
    scrollbar_thumb = "#ffffff",
}
--test
-- padding
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}

-- scrollbar
config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.min_scroll_bar_height = "5cell"

-- font
config.font_size = 9.5
config.line_height = 1.1
config.font = wezterm.font {
  family = 'Hack'
}
config.inactive_pane_hsb = {
  saturation = 0.75,
  brightness = 0.5,
}
config.freetype_load_target = "HorizontalLcd"

-- keys
-- config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '=',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.ResetFontSize,
  },
  {
    key = 'Enter',
    mods = 'LEADER',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    mods = "LEADER",
    key = "n",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "LEADER",
    key = "/",
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  {
    mods = "LEADER",
    key = "c",
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    mods = "LEADER",
    key = "[",
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    mods = "LEADER",
    key = "]",
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = "v",
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = 'h',
    mods = 'SHIFT|ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'SHIFT|ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'SHIFT|ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'SHIFT|ALT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = wezterm.action.AdjustPaneSize { "Down", 5 }
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncher
  },
}

for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = wezterm.action.ActivateTab(i),
    })
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

return config
