-- cyberdream retro theme for wezterm adapté
return {
  -- -- Couleurs principales
  foreground = "#00ff00",         -- Texte vert vif “hacker”
  background = "#000000",         -- Noir CRT

  -- Curseur et sélection “rétro phosphore”
  cursor_bg = "#00ff00",
  cursor_fg = "#000000",
  cursor_border = "#00ff00",
  selection_bg = "#005500",       -- Vert foncé phosphore
  selection_fg = "#00ff00",       -- Texte vert sur sélection

  -- Couleurs ANSI (classiques, options rétro)
  ansi = {
    "#000000", -- noir pur
    "#ff0000", -- rouge
    "#00ff00", -- vert vif
    "#ffff00", -- jaune
    "#0080ff", -- bleu rétro
    "#ff00ff", -- magenta
    "#00ffff", -- cyan
    "#bfbfbf"  -- gris clair
  },
  brights = {
    "#222222", -- noir plus clair
    "#ff3333", -- rouge clair
    "#66ff66", -- vert très clair
    "#ffff66", -- jaune clair
    "#33bbff", -- bleu clair
    "#ff66ff", -- magenta clair
    "#66ffff", -- cyan clair
    "#ffffff"  -- blanc pur
  },

  -- Tab bar look rétro/foncé
  tab_bar = {
    background = "#000000",
    active_tab = {
      bg_color = "#000000",
      fg_color = "#00ff00",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#111111",
      fg_color = "#007700"
    }
  }
}

