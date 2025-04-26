return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { icon = "Talk to me boss>" },
        search_down = { icon = "🔍" },
        search_up = { icon = "🔍" },
        filter = { icon = "$" },
        lua = { icon = "☾" },
      },
    },
    popupmenu = {
      enabled = true,
    },
    messages = {
      enabled = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}

