return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 1, -- 1 = 100% de la largeur de l'éditeur (plein écran)[2][7][8]
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Activer Zen Mode" }, -- raccourci leader + z
    },
  }
}

