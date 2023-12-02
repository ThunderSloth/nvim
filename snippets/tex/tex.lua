
M = {
	s(
		{
			trig = "//",
			dscr = "\\frac",
			regTrig = false,
			priority = 100,
			snippetType = "autosnippet",
		},
		{ 
			t("\\frac{"), i(1),
			t("}{"), i(2),
			t("}"), i(3),
		}
	),
	s( -- integral
		{trig = "\\int", snippetType = "autosnippet",},
		fmta([[\int <> \,\mathrm{d} <>]], {i(1), i(2)})
	),
	s( -- derivative d/dx
		{trig = "\\ddx", snippetType = "autosnippet"},
		fmta([[\frac{\mathrm{d} <> }{\mathrm{d} <> }]], {i(1), i(2)})
	),
	s( -- display style
		{trig = "\\ds", snippetType = "autosnippet",},
		t([[\displaystyle ]])
	),
	s( -- size-adjusted parenthesis
		{trig = "\\(", snippetType = "autosnippet"},
		fmta([[\left( <> \right)]], i(1))
	),
	s(
		{
			trig = "#.",
			dscr = "New Item",
			regTrig = false,
			priority = 100,
			snippetType = "autosnippet",
		},
		{ 
			t("\\item\\( "), i(1), t(" \\)"),
			t{"", "\\begin{gather*}", "\t"}, 
			i(2), t{" \\\\", ""},
			t("\\end{gather*}"),
		}
	),
}

return M

