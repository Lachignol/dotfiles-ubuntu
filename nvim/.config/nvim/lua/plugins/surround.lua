return {
  "kylechui/nvim-surround",
  version = "*", -- utilise la dernière version stable
  event = "VeryLazy", -- charge le plugin tardivement
  config = function()
    require("nvim-surround").setup({
      -- Configuration par défaut, tu peux personnaliser ici si tu veux
    })
  end,
  keys = {
    -- Autocommands pour les mappings surround par défaut (ys, cs, ds)
    { "ys", desc = "Surround: add surrounding" },
    { "cs", desc = "Surround: change surrounding" },
    { "ds", desc = "Surround: delete surrounding" },
  },
}

