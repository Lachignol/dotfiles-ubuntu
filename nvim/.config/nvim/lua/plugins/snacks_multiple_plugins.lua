return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false, -- Snacks doit être chargé tôt pour fonctionner correctement
    opts = {
      -- Gère les très gros fichiers pour éviter les ralentissements
      bigfile = { enabled = true },

      -- Dashboard d’accueil personnalisable et rapide (raccourcis, projets récents, etc.)
      dashboard = { enabled = false },

      -- Explorateur de fichiers intégré (picker déguisé)
      explorer = { enabled = false },

      -- Affiche des guides et scopes d’indentation visuels
      indent = { enabled = false },

      -- Améliore l’UI pour les entrées utilisateur (vim.ui.input)
      input = { enabled = true },

      -- Affiche de jolies notifications (remplace vim.notify)
      notifier = { enabled = true, timeout = 3000 },

      -- Sélecteur/picker universel pour fichiers, buffers, etc.
      picker = { enabled = false },

      -- Ouvre les fichiers très rapidement au démarrage (avant le chargement complet des plugins)
      quickfile = { enabled = true },

      -- Détection de scope et objets de texte (avec treesitter ou indentation)
      scope = { enabled = true },

      -- Défilement fluide dans les buffers (smooth scrolling)
      scroll = { enabled = true },

      -- Affiche une colonne de statut personnalisée (numéros de ligne, sign, etc.)
      statuscolumn = { enabled = true },

      -- Affiche automatiquement les références LSP et permet de naviguer rapidement entre elles
      words = { enabled = true },

       -- Visualiseur d'images (Kitty)
      image        = { enabled = true  },

      -- Snacks supplémentaires, désactivés par défaut :
      animate      = { enabled = false }, -- Animations et easing
      bufdelete    = { enabled = false }, -- Suppression de buffers sans fermer la fenêtre
      debug        = { enabled = false }, -- Outils de debugging
      dim          = { enabled = false }, -- Met en avant la zone active
      git          = { enabled = false }, -- Fonctions Git
      gitbrowse    = { enabled = false }, -- Ouvre fichiers/branches sur GitHub/GitLab
      layout       = { enabled = false }, -- Gestion avancée des layouts
      lazygit      = { enabled = false }, -- Intégration LazyGit
      profiler     = { enabled = false }, -- Profileur Lua
      rename       = { enabled = false }, -- Renommage de fichiers
      scratch      = { enabled = false }, -- Buffers temporaires persistants
      terminal     = { enabled = false }, -- Terminaux flottants/splits
      toggle       = { enabled = false }, -- Gestion des toggles
      util         = { enabled = false }, -- Fonctions utilitaires
      win          = { enabled = false }, -- Gestion des fenêtres flottantes/splits
      zen          = { enabled = false }, -- Mode Zen (sans distraction)
    },

    -- Raccourcis recommandés pour accéder rapidement aux fonctionnalités Snacks
    keys = {
      -- Toggle l'explorateur Snacks (ouvre/ferme avec <leader>e)
     --{
     --   "<leader>e",
     --   function()
     --     -- Toggle Snacks Explorer : ferme si déjà ouvert, sinon ouvre
     --     if vim.bo.filetype == "snacks_explorer" then
     --       vim.cmd("close")
     --     else
     --       Snacks.explorer()
     --     end
     --   end,
     --   desc = "Toggle Snacks Explorer",
     -- },

      -- -- Ouvre le picker intelligent (fichiers, projets, etc.)
      -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      --
      -- -- Liste les buffers ouverts
      -- { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
      --
      -- -- Recherche texte dans le projet (grep)
      -- { "<leader>g", function() Snacks.picker.grep() end, desc = "Grep" },

      -- Historique des commandes
      { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },

      -- Historique des notifications
      { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
      --
      -- -- Ouvre LazyGit dans une fenêtre flottante
      -- { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },

      -- Ferme toutes les notifications
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

      -- Navigue vers la référence LSP suivante/précédente
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
  }
}

