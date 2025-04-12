return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { icon = "faut que je trouve un truc drole >" },
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

