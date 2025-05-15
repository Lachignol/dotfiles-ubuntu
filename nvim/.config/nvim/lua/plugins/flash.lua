return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    -- Flash classique (avant)
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash (forward)" },
    -- Flash classique (arrière)
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump({ direction = "left" }) end, desc = "Flash (backward)" },
    -- Remote Flash (avant)
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash (forward)" },
    -- Remote Flash (arrière)
    { "R", mode = "o", function() require("flash").remote({ direction = "left" }) end, desc = "Remote Flash (backward)" },
  },
}

