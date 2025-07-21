local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local t = ls.text_node


return {
  -- .hpp avec pragma once
  s("classhpp", fmt([[
#pragma once

#include <string>
#include <iostream>

class {} {{
public:
    {}();
    {}(const {}& other);
    {}& operator=(const {}& other);
    ~{}();

    std::string toString() const;

private:
    {};
}};

std::ostream& operator<<(std::ostream& os, const {}& obj);
]], {
    i(1, "NomClasse"),   -- {}
    rep(1),              -- {}
    rep(1), rep(1),      -- {}, {}
    rep(1), rep(1),      -- {}, {}
    rep(1),              -- {}
    i(2, "// membres privés"), -- {}
    rep(1)               -- {}
  })),

  -- .cpp identique au message précédent (aucune {} en trop)
  s("classcpp", fmt([[
#include "{}.hpp"

// Constructeur par défaut
{}::{}() {{
    // TODO
}}

// Constructeur de copie
{}::{}(const {}& other) {{
    // TODO
}}

// Opérateur d'affectation de copie
{}& {}::operator=(const {}& other) {{
    if (this != &other) {{
        // TODO: assign fields
    }}
    return *this;
}}

// Destructeur
{}::~{}() {{
    // TODO
}}

std::string {}::toString() const {{
    return "{{ {} }}";
}}

std::ostream& operator<<(std::ostream& os, const {}& obj) {{
    return os << obj.toString();
}}
]], {
    i(1, "NomClasse"),
    rep(1), rep(1),
    rep(1), rep(1), rep(1),
    rep(1), rep(1), rep(1),
    rep(1), rep(1),
    rep(1), i(2, "description à afficher"),
    rep(1)
  })),

  s("hello", {
    t("Hello, world!")
  }),
}

