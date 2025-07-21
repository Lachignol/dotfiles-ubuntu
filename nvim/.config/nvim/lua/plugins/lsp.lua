return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "VonHeikemen/lsp-zero.nvim", -- si tu l'utilises vraiment
  },
  config = function()
    require("config.lsp.servers")
    require("config.lsp.diagnostics")
  end,
}

