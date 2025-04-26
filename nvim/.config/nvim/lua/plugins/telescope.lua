return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
      defaults = {
        -- Arguments de la recherche avec `ripgrep` (rg)
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",  -- Inclut les fichiers cachés
          "--glob", "!target/**",  -- Exclut le dossier 'target'
          "--glob", "!**/*.o",     -- Exclut les fichiers '.o'
          "--glob", "!**/*.so",    -- Exclut les fichiers '.so'
          "--glob", "!**/*.bin",   -- Exclut les fichiers '.bin'
          "--glob", "!**/*.exe",   -- Exclut les fichiers '.exe'
          "--glob", "!**/*.dll",   -- Exclut les fichiers '.dll'
          "--glob", "!**/*.class", -- Exclut les fichiers '.class'
          "--glob", "!**/*.wasm",  -- Exclut les fichiers '.wasm'
        },
        -- Configuration générale des pickers (recherches)
        layout_config = {
          preview_width = 0.6,  -- Largeur de l'aperçu dans la fenêtre (60%)
        },
        preview = {
          hide_on_startup = false,  -- Ne pas masquer l'aperçu au démarrage
          file_sorter = require("telescope.sorters").get_fuzzy_file, -- Trier les fichiers
        },
      },
      pickers = {
        -- Configuration de la recherche de fichiers
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore",
            "--glob", "!target/**",
            "--glob", "!**/*.o",
            "--glob", "!**/*.so",
            "--glob", "!**/*.bin",
            "--glob", "!**/*.exe",
            "--glob", "!**/*.dll",
            "--glob", "!**/*.class",
            "--glob", "!**/*.wasm",
          },
          -- Activer la prévisualisation pour la recherche de fichiers
          previewer = true,
        },
        -- Configuration de la recherche en temps réel (live grep)
        live_grep = {
          -- Activer la prévisualisation pour live grep
          previewer = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Charger l'extension fzf pour améliorer les performances de recherche
    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
}

