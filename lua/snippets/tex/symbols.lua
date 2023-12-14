local utils = require("snippets.tex.utils")
local in_mathzone = utils.in_mathzone

M = {
	s( -- pi
		{ trig = "pi", snippetType = "autosnippet" },
		fmta([[<> <>]], {
			d(1, utils.get_choices, {}, { user_args = { utils.defaults.pi } }),
			i(2),
		}),
		{ condition = in_mathzone }
	),
	s( -- theta
		{ trig = "tht", snippetType = "autosnippet" },
		fmta([[\theta <>]], {
			i(1),
		}),
		{ condition = in_mathzone }
	),
	s( -- euler's
		{ trig = "ee", snippetType = "autosnippet" },
		{
			t("e"),
			d(1, utils.get_choices, {}, { user_args = { utils.defaults.pow } }),
			i(2),
		},
		{ condition = in_mathzone }
	),
}

return M
