local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 👉 Chargement du thème personnalisé (à côté de ce fichier)
config.colors = require("cyberdream")

-- 👉 Chargement du cursor par default
config.default_cursor_style = 'BlinkingBlock'


-- -- 👉 Effet scanlines (image PNG avec transparence)
-- config.window_background_opacity = 1
-- config.window_background_image_hsb = { brightness = 0.25, hue = 1.0, saturation = 1.0 }
-- config.macos_window_background_blur = 0 -- 📨 Mets 10+ si tu veux un effet flou derrière

-- 🎯 Activation du presse-papiers et autres options utiles
config.enable_wayland = true
config.enable_scroll_bar = true
config.force_reverse_video_cursor = true

-- 🎹 Raccourcis clavier personnalisés
config.keys = {
  {
    key = 'i',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnWindow,
  },
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'e',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'o',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'c',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'x',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.SendKey { key = 'h', mods = 'CTRL' },
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.SendKey { key = 'j', mods = 'CTRL' },
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.SendKey { key = 'k', mods = 'CTRL' },
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.SendKey { key = 'l', mods = 'CTRL' },
  },
  {
    key = 'h',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
}

-- 📐 Réglages visuels
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

config.warn_about_missing_glyphs = false
config.scrollback_lines = 10000

return config

