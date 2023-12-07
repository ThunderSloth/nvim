local utils = require("snippets.tex.utils")

local M = {}

local trig = {"sin", "cos", "tan", "cot", "sec", "csc"}

for _, v in ipairs(trig) do
	local snip = s(
		{trig = v, snippetType = "autosnippet",},
		{
			t(([[\%s]]):format(v)),
			d(1, utils.get_choices, {}, {user_args = {utils.defaults.trig}}),
			d(2, utils.smart_pairs, {}, {user_args = {{i(1, "x"), "(", ")"}}}),
			i(3),
		}
	)
	table.insert(M, snip)
end

return M
