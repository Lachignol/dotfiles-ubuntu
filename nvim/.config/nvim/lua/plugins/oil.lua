return {
{
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- pour les icônes (optionnel)
  config = function()
    require("oil").setup({
      default_file_explorer = true,  -- Oil remplace netrw pour les dossiers
      view_options = {
        show_hidden = true,          -- afficher les fichiers cachés
      },
      -- Vous pouvez ajouter d'autres options ici (voir plus bas)
    })

    -- Exemple de mappages de touches pour ouvrir Oil
    vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "Open Oil file explorer" })
    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
  end,
  lazy = false, -- lazy loading déconseillé ici pour éviter les erreurs
}

}
