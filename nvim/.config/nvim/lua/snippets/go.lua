local ls = require("luasnip")
local s = ls.s
local t = ls.text_node
local i = ls.insert_node

return {
  -- Canonique pour fonction main Go
  s("main", {
    t({"package main", "", "import (", '    "fmt"', ")", "", "func main() {", "    "}),
    i(1, '// code'),
    t({"", "}"})
  }),
}

