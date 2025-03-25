return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" }) -- Choisissez votre variante ici : latte, frappe, macchiato, mocha
      vim.cmd.colorscheme("catppuccin") --- voici la cmd pour defenir le theme par default
    end,
  },
  
  -- Gruvbox
  { "ellisonleao/gruvbox.nvim" },


  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
}
