local ls = require("luasnip")
local s = ls.s
local t = ls.text_node
local i = ls.insert_node

return {
  s("main", {
    t({"int main(int argc, char *argv[]) {", "    "}),
    i(1, "// code"),
    t({"", "    return 0;", "}"})
  }),
}

