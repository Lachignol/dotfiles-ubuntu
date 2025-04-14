local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- Activation du presse-papiers
config.enable_wayland = true

-- Ajouter une barre de défilement
config.enable_scroll_bar = true

-- Affichage du curseur de la souris dans le terminal
config.force_reverse_video_cursor = true

-- Raccourcis clavier personnalisés
config.keys = {
  -- Ouvrir un nouveau terminal
  {
    key = 'i',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnWindow,
  },
  -- Ouvrir un nouveau onglet 
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  
  -- Diviser la fenêtre verticalement
  {
    key = 'e',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  
  -- Diviser la fenêtre horizontalement
  {
    key = 'o',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  
  -- Copier (ergonomique)
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  
  -- Coller (ergonomique)
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  
  -- Fermer le panneau actuel
  {
    key = 'x',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Pour que neovim fonctione

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
  
  -- Naviguer entre les panneaux
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

return config

