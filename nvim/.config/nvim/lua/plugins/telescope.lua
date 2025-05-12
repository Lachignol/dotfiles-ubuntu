return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",
          "--glob", "!target/**",
          "--glob", "!**/*.o",
          "--glob", "!**/*.so",
          "--glob", "!**/*.bin",
          "--glob", "!**/*.exe",
          "--glob", "!**/*.dll",
          "--glob", "!**/*.class",
          "--glob", "!**/*.wasm",
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            prompt_position = "top",  -- Input en haut, résultats en dessous
          },
          vertical = {
            prompt_position = "top",
          },
        },
        sorting_strategy = "ascending", -- <-- C'est CETTE OPTION qui garantit que le premier résultat est en haut !
        preview = {
          hide_on_startup = false,
          file_sorter = require("telescope.sorters").get_fuzzy_file,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
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
          previewer = true,
        },
        live_grep = {
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

    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>g<leader>", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>b<leader>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>h<leader>", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
  },
}

