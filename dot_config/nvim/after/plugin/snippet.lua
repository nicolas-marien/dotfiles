require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
ls.add_snippets("typescript", {
	s("prr", {
		-- Simple static text.
		t("private readonly "),
		i(1),
	}),
})
