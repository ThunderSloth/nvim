local utils = require("snippets.tex.utils")

M = {
	s( -- pi
		{trig = "pi", snippetType = "autosnippet",},
		fmta(
			[[<> <>]],
			{
				d(1, utils.get_choices, {}, {user_args = {utils.defaults.pi}}),
				i(2),
			}
		)
	),
	s( -- theta
		{trig = "tht", snippetType = "autosnippet",},
		fmta(
			[[\theta <>]],
			{
				i(1),
			}
		)
	),
	s(
		{trig = "ee", snippetType = "autosnippet",},
		{	
			 t("e"),
			 d(1, utils.get_choices, {}, {user_args = {utils.defaults.pow}}),
			 i(2),
		}
	)
}

return M
