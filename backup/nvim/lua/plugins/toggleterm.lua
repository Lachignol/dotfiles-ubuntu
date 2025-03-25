-- Exemple de configuration de lazy.nvim
return {
  "akinsho/toggleterm.nvim",
  version = "*", -- Assurez-vous d'utiliser la dernière version
  config = function()
    require("toggleterm").setup({
      size = 20, -- Taille du terminal
      open_mapping = [[<c-\>]], -- Raccourci pour ouvrir le terminal
      direction = "vertical", -- Direction du terminal (horizontal, vertical, float)
      shell = "/bin/zsh", -- Utiliser zsh comme shell
      close_on_exit = true, -- Fermer le terminal à la sortie
      start_in_insert = true, -- Commencer en mode insertion
      insert_mappings = true, -- Activer les mappages en mode insertion
      terminal_mappings = true, -- Activer les mappages pour le terminal
      highlights = {
        Normal = {
          guifg = "#ffffff", -- Couleur de texte
          guibg = "#1e1e1e", -- Couleur de fond
        },
        NormalFloat = {
          link = "Normal", -- Lien vers Normal pour les fenêtres flottantes
        },
      },
    })
  end,
}
