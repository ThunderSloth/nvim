local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local utils = require("snippets.all.utils")

local function set_defaults()
	local function reduce(numer, denom)
		for gcd = math.max(numer, denom), 2, -1 do
			if numer % gcd == 0 and denom % gcd == 0 then
				numer = math.floor(numer / gcd)
				denom = math.floor(denom / gcd)
			end
		end
		return numer, denom
	end

	local defaults = { pow = {}, root = {}, pi = {}, trig = {} }

	-- pow and root
	table.insert(defaults.trig, { "<>", "" })
	for j = 2, 9 do
		table.insert(defaults.pow, { "^{<>}", tostring(j) })
		table.insert(defaults.trig, { "^{<>}", tostring(j) })
		table.insert(defaults.root, { "<>", j ~= 2 and tostring(j) or "" })
	end
	table.insert(defaults.trig, { "^{<>}", "-1" })
	for j = -9, -1 do
		table.insert(defaults.pow, { "^{<>}", tostring(j) })
	end
	table.insert(defaults.pow, { "^{<>}", "x" })
	-- pi
	table.insert(defaults.pi, { "<>", "\\pi" })
	local denominator = 12
	for numerator = 1, 24 do
		if numerator % 2 == 0 or numerator % 3 == 0 then
			local numer, denom = reduce(numerator, denominator)
			if denom == 1 then
				table.insert(defaults.pi, { "<>", (numer == 1 and "" or tostring(numer)) .. "\\pi" })
			else
				table.insert(
					defaults.pi,
					{ "<>", ([[\frac{%s\pi}{%d}]]):format((numer == 1 and "" or tostring(numer)), denom) }
				)
			end
		end
	end

	return defaults
end


local M = {

	defaults = set_defaults(),

	smart_pairs = function(args, parent, old_state, user_args)
		local nodes, LHS, RHS = unpack(user_args)
		local use_LR = function(text)
			return text:match("frac") ~= nil or text:match("[_^]") ~= nil
		end
		return sn(1, {
			d(1, function(args) -- for some reason regular f nodes caused strange behavior when attempting to delete snippet
				local result = (use_LR(args[1][1]) and "\\left" or "") .. LHS
				return sn(nil, t(result))
			end, { 2 }, {}),
			d(2, utils.paste, {}, {user_args = {nodes}}),
			d(3, function(args)
				local result = (use_LR(args[1][1]) and "\\right" or "") .. RHS
				return sn(nil, t(result))
			end, { 2 }, {}),
		})
	end,

	get_choices = function(args, parent, old_state, user_args)
		local choices = {}
		require("cmp").close() -- don't want cmp selection when we are making choices
		for _, v in ipairs(user_args) do
			table.insert(choices, fmta(v[1], { i(1, v[2]) }))
		end
		return sn(nil, c(1, choices))
	end,
}

return M
