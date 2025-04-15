return {
  'akinsho/toggleterm.nvim',
  version = '*', -- Assurez-vous d'utiliser la dernière version
  config = function()
    -- Configuration par défaut du plugin
    require('toggleterm').setup {
      size = 20, -- Taille du terminal
      open_mapping = [[<c-/>]], -- Raccourci pour ouvrir le terminal en mode flottant
      direction = 'float', -- Direction par défaut du terminal (float)
      shell = '/bin/zsh', -- Utiliser zsh comme shell
      close_on_exit = true, -- Fermer le terminal à la sortie
      start_in_insert = true, -- Commencer en mode insertion
      insert_mappings = true, -- Activer les mappages en mode insertion
      terminal_mappings = true, -- Activer les mappages pour le terminal
      highlights = {
        Normal = {
          guifg = '#ffffff', -- Couleur de texte
          guibg = '#1e1e1e', -- Couleur de fond
        },
        NormalFloat = {
          link = 'Normal', -- Lien vers Normal pour les fenêtres flottantes
        },
      },
    }

    -- Définir les mappages pour ouvrir le terminal en mode flottant ou vertical
    vim.api.nvim_set_keymap('n', '<c-/>', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })  -- Ouvrir en bas avec Ctrl+/
    vim.api.nvim_set_keymap('n', '<c-\\>', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })  -- Ouvrir sur la droite avec Ctrl+\
  end,
}

