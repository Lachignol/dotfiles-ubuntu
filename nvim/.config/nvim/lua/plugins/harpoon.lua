return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,  -- Charger le plugin sans lazy loading (modifier selon besoin)
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")

      harpoon.setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
        settings = {
          save_on_toggle = true,
        },
      })

      local keymap = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Marquer un fichier avec Harpoon
      keymap("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
      -- Menu rapide Harpoon
      keymap("n", "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
      -- Navigation entre fichiers marqués
      keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", opts)
      keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", opts)

      -- Optionnel : raccourcis pour accéder directement à des fichiers marqués 1 à 5
      for i = 1, 5 do
        keymap("n", "<leader>" .. i, string.format("<cmd>lua require('harpoon.ui').nav_file(%d)<CR>", i), opts)
      end
    end,
  },
}

