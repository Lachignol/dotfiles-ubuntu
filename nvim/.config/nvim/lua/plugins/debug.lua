return {
  -- Plugin pour le débogage (DAP)
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Crée une belle interface utilisateur pour le débogueur
    'rcarriga/nvim-dap-ui',

    -- Dépendance requise pour nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installe les adaptateurs de débogage automatiquement
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Débogueurs supplémentaires, ajoute tes propres débogueurs ici
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Démarrer ou reprendre le débogage
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',  -- Démarrer ou continuer le débogage
    },
    -- Passer dans la fonction (step into)
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',  -- Passer dans la fonction
    },
    -- Passer à l’instruction suivante (step over)
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',  -- Passer à l’instruction suivante
    },
    -- Sortir de la fonction (step out)
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',  -- Sortir de la fonction
    },
    -- Basculer un point d’arrêt
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',  -- Ajouter ou supprimer un point d'arrêt
    },
    -- Définir un point d’arrêt avec une condition
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',  -- Définir un point d’arrêt avec condition
    },
    -- Basculer l'affichage de la dernière session de débogage
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: See last session result.',  -- Voir le résultat de la dernière session de débogage
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Configurer Mason pour les débogueurs
    require('mason-nvim-dap').setup {
      automatic_installation = true,  -- Installation automatique des débogueurs

      handlers = {},  -- Tu peux configurer des gestionnaires ici si nécessaire

      ensure_installed = {
        -- Assurer que le débogueur Delve pour Go est installé
        'delve',
      },
    }

    -- Configurer l'interface utilisateur de DAP
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Configurer les écouteurs pour l'ouverture et la fermeture de l'interface DAP UI
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Installer la configuration spécifique à Go
    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,  -- Sur Windows, 'delve' doit être exécuté détaché pour éviter les plantages
      },
    }
  end,
}

