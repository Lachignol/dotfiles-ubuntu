return {
  "akinsho/git-conflict.nvim", -- Plugin pour gérer les conflits Git dans Neovim
  version = "*", -- Suivre les mises à jour par tag
  config = function()
    require('git-conflict').setup {
      default_mappings = true, -- Activer les mappages par défaut pour gérer les conflits
      default_commands = true, -- Activer les commandes par défaut pour gérer les conflits
      disable_diagnostics = false, -- Conserver les diagnostics dans les buffers de conflit
      list_opener = 'copen', -- Utiliser la commande 'copen' pour ouvrir la liste des conflits
      highlights = { -- Définit les couleurs utilisées pour afficher les conflits
        incoming = 'DiffAdd', -- Couleur pour les changements entrants (par exemple, ajoutés par une autre branche)
        current = 'DiffText', -- Couleur pour les changements actuels (les changements dans votre branche)
      },
    }

    -- Commandes par défaut ajoutées explicitement
    vim.api.nvim_set_keymap('n', 'co', ':GitConflictChooseOurs<CR>', { noremap = true, silent = true })  -- Choisir les changements de la branche actuelle
    vim.api.nvim_set_keymap('n', 'ct', ':GitConflictChooseTheirs<CR>', { noremap = true, silent = true })  -- Choisir les changements de la branche entrante
    vim.api.nvim_set_keymap('n', 'cb', ':GitConflictChooseBoth<CR>', { noremap = true, silent = true })  -- Choisir les deux changements
    vim.api.nvim_set_keymap('n', 'c0', ':GitConflictChooseNone<CR>', { noremap = true, silent = true })  -- Choisir aucun des changements
    vim.api.nvim_set_keymap('n', ']x', ':GitConflictNextConflict<CR>', { noremap = true, silent = true })  -- Conflit suivant
    vim.api.nvim_set_keymap('n', '[x', ':GitConflictPrevConflict<CR>', { noremap = true, silent = true })  -- Conflit précédent
    vim.api.nvim_set_keymap('n', '<leader>gc', ':GitConflictListQf<CR>', { noremap = true, silent = true })  -- Liste des conflits dans Quickfix
  end,
}

