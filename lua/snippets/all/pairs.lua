local utils = require("snippets.all.utils")

local function pair(head, tail)
	return s({ trig = head, wordTrig = false, snippetType = "autosnippet" }, {
		t(head),
		d(1, utils.paste, {}),
		t(tail),
		i(2),
	})
end

local M = {
	s( -- autocomplete apostrophe but only when not following a word
		{ trig = "([^%a])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmt("{}'{}'", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, utils.paste, {}),
		})
	),
	s( -- autocomplete apostrophe but beggining a newline
		{ trig = "^'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmt("'{}'", {
			d(1, utils.paste, {}),
		})
	),
	s(
		{ trig = '(""")', wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmt('{} {} "', { f(function(_, snip)
			return snip.captures[1]
		end), i(1) })
	),
}

for _, v in ipairs({"()", "{}", "[]", '"', "`" }) do
	local head = string.sub(v, 1, 1)
	local tail = #v > 1 and string.sub(v, 2, 2) or head
	table.insert(M, pair(head, tail))
end

return M
