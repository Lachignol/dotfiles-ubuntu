return {
  "folke/persistence.nvim",
  event = "VimEnter",  -- Chargé au démarrage
  config = function()
    require("persistence").setup({
      options = { "buffers", "curdir", "tabpages", "winsize" }
    })
  end
}

