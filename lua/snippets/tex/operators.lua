local utils = require("snippets.tex.utils")
local in_mathzone = utils.in_mathzone

M = {
	s( -- parenthesis
		{ trig = "(", snippetType = "autosnippet", priority = 2000 },
		{ d(1, utils.smart_pairs, {}, { user_args = { { { i(1, "") }, "(", ")" } } }) }
	),
	s( -- fraction
		{ trig = "//", snippetType = "autosnippet" },
		fmta([[\frac{<>}{<>} <>]], { i(1), i(2), i(3) }),
		{ condition = in_mathzone }
	),
	s( -- mult
		{ trig = "(.)[*]", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta([[<>\cdot <>]], { f(function(_, snip)
			return snip.captures[1]
		end), i(1) }),
		{ condition = in_mathzone }
	),
	s( -- root
		{ trig = "sq", snippetType = "autosnippet" },
		fmta([[\sqrt<><><>{<>} <>]], {
			extras.nonempty(1, "[", ""),
			d(1, utils.get_choices, {}, { user_args = { utils.defaults.root } }),
			extras.nonempty(1, "]", ""),
			i(2),
			i(3),
		}),
		{ condition = in_mathzone }
	),
	s( -- pow
		{ trig = "([^^])^", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		{
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, utils.get_choices, {}, { user_args = { utils.defaults.pow } }),
			i(2),
		},
		{ condition = in_mathzone }
	),
	s( -- derivative d/dx
		{ trig = "ddx", snippetType = "autosnippet" },
		fmta([[\frac{\mathrm{d}<> <> }{\mathrm{d} <><> }]], {
			c(1, { t(""), t("^2"), t("^3") }),
			i(2),
			i(3, "x"),
			f(function(args)
				return args[1][1]
			end, { 1 }),
		}),
		{ condition = in_mathzone }
	),
	s( -- integral
		{ trig = "int", snippetType = "autosnippet" },
		fmta([[\int<> \;\mathrm{d} <>]], {
			c(1, {
				sn(nil, { t(" "), i(1, "f(x)") }),
				sn(
					nil,
					fmta([[_{<>}^{<>} <>]], {
						i(1, "a"),
						i(2, "b"),
						i(3, "f(x)"),
					})
				),
			}),
			i(2, "x"),
		}),
		{ condition = in_mathzone }
	),
	s( -- abs and bounds
		{ trig = "|", snippetType = "autosnippet" },
		fmta([[<> <>]], {
			c(1, {
				d(1, utils.smart_pairs, {}, { user_args = { { { i(1, "x") }, "|", "|" } } }),
				fmta([[\Big|_{<>}^{<>}]], { i(1, "a"), i(2, "b") }),
			}),
			i(2),
		}),
		{ condition = in_mathzone }
	),
	s( -- not
		{ trig = "ov", snippetType = "autosnippet" },
		fmta([[\overline{<>} <>]], { i(1), i(2) }),
		{ condition = in_mathzone }
	),
}

return M
