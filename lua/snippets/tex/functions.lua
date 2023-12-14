local utils = require("snippets.tex.utils")
local in_mathzone = utils.in_mathzone

local M = {}

local trig = { "sin", "cos", "tan", "cot", "sec", "csc" }

for _, v in ipairs(trig) do
	local snip = s({ trig = v, snippetType = "autosnippet" }, {
		t(([[\%s]]):format(v)),
		d(1, utils.get_choices, {}, { user_args = { utils.defaults.trig } }),
		d(2, utils.smart_pairs, {}, { user_args = { { { i(1, "x") }, "(", ")" } } }),
		i(3),
	}, { condition = in_mathzone })
	table.insert(M, snip)
end

table.insert(
	M,
	s( -- ln
		{ trig = "ln", snippetType = "autosnippet" },
		{
			t("\\ln"),
			c(1, {
				d(nil, utils.smart_pairs, {}, { user_args = { { { r(1, "func") }, "(", ")" } } }),
				d(nil, utils.smart_pairs, {}, { user_args = { { { r(1, "func") }, "|", "|" } } }),
			}),
			i(2),
		},
		{
			stored = {
				func = i(nil, "x"),
			},
		},
		{ condition = in_mathzone }
	)
)

return M

