
M = {
	s( -- fraction
		{trig = "//", snippetType = "autosnippet",},
		fmta([[\frac{<>}{<>}]], {i(1), i(2)})
	),
	s( -- little fraction
		{trig = "\\/", snippetType = "autosnippet",},
		fmta([[^{<>}/_{<>}]], {i(1), i(2)})
	),
	s( -- integral
		{trig = "\\int", snippetType = "autosnippet",},
		fmta([[\int <> \,\mathrm{d} <>]], {i(1), i(2)})
	),
	s( -- root
		{trig = "\\sq", snippetType = "autosnippet",},
		fmta(
			[[\sqrt<><><>{<>} <>]],
			{
				f(function(args, parent, user_args)
					return args[1][1] ~= "" and "[" or ""
				end, {1}),
				i(1), 
				f(function(args, parent, user_args)
					return args[1][1] ~= "" and "]" or ""
				end, {1}),
				i(2), 
				i(3), 
			}
		), {
		stored = {
			-- key passed to restoreNodes.
			["user_text"] = i(1, "")
		}
	}),
 	s( -- pow
		{trig = '(%w)^', wordTrig = false, regTrig = true, snippetType="autosnippet"},
		fmta('<>^{<>} ',
			{ f( function(_, snip) return snip.captures[1] end ), i(1), }
		)
	),
	s( -- derivative d/dx
		{trig = "\\ddx", snippetType = "autosnippet"},
		fmta([[\frac{\mathrm{d} <> }{\mathrm{d} <> }]], {i(1), i(2)})
	),
	s( -- display style
		{trig = "\\ds", snippetType = "autosnippet",},
		t([[\displaystyle ]])
	),
	s( -- ;
		{trig = ";", snippetType = "autosnippet",},
		t([[\,;\quad ]])
	),
	s( -- ;
		{trig = "->", snippetType = "autosnippet",},
		t([[\quad\Rightarrow\quad ]])
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

