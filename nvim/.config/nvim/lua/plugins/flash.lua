return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash (forward)" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump({ direction = "left" }) end, desc = "Flash (backward)" },
  },
}

