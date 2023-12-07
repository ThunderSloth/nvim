local utils = require("snippets.tex.utils")

local M = {}

local trig = {"sin", "cos", "tan", "cot", "sec", "csc"}

for _, v in ipairs(trig) do
	local snip = s( 
		{trig = v, snippetType = "autosnippet",},
		fmta(
			([[\%s <>]]):format(v),
			{
				d(1, utils.get_thoices, {}, {user_args = {utils.defaults.pi}}),
				i(2),
			}
		)
	),
	table.insert(M, snip)
end

return M
