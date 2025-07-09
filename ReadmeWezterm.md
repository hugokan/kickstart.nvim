local wezterm = require("wezterm")
local act = wezterm.action

return {
  -- Fuente y tamaño
  font = wezterm.font("Hack Nerd Font"),
  font_size = 16.0,

  -- Tema Catppuccin Mocha
  color_scheme = "Catppuccin Mocha",

  window_background_opacity = 0.95,
  text_background_opacity = 0.9,
  window_background_image = "/Users/hugokan/Downloads/cp12.jpg",
window_background_image_hsb = {
    brightness = 0.08,
    hue = 1.0,
    saturation = 1.0,
  },

  -- Padding (opcional, visual)
  window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  },

  -- Comportamiento de la terminal
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  -- Atajos personalizados
  keys = {
    -- Dividir panel horizontal
    {
      key = '"',
      mods = "CTRL|SHIFT",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    -- Dividir panel vertical
    {
      key = "Enter",
      mods = "CTRL|SHIFT",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    -- Cerrar panel
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = act.CloseCurrentPane({ confirm = true }),
    },

    -- Navegar entre paneles estilo Dvorak (htns)
    { key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "t", mods = "ALT", action = act.ActivatePaneDirection("Down") },
    { key = "n", mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "s", mods = "ALT", action = act.ActivatePaneDirection("Right") },

    -- Nueva pestaña
    { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("DefaultDomain") },
    -- Navegar entre pestañas
    { key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
  },
}
