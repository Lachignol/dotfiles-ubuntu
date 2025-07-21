return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "go", "c", "cpp" }, -- modifie selon tes besoins
      highlight = { enable = true },
      indent = { enable = true },
      -- optionnel : ajoute d’autres modules ici
    })
  end,
}

