return {
  "akinsho/git-conflict.nvim",
  version = "*", -- Suivre les mises à jour par tag
  config = function()
    require('git-conflict').setup {
      default_mappings = true, -- Désactiver les mappages locaux au tampon créés par ce plugin
      default_commands = true, -- Désactiver les commandes créées par ce plugin
      disable_diagnostics = false, -- Désactive les diagnostics dans le tampon en cas de conflit
      list_opener = 'copen', -- Commande ou fonction pour ouvrir la liste des conflits
      highlights = { -- Les couleurs doivent avoir une couleur de fond, sinon la couleur par défaut sera utilisée
        incoming = 'DiffAdd', -- Couleur pour les changements entrants
        current = 'DiffText', -- Couleur pour les changements actuels
      },
    }
  end,
}

