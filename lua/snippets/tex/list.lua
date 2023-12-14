-- function for the dynamicNode.
local lst = function(args, snip)
	if not snip.rows then
		snip.rows = 1
	end
	local nodes = {}
	-- keep track of which insert-index we're at.
	for index = 1, snip.rows do
		-- use restoreNode to not lose content when updating.
		table.insert(nodes, t("\t"))
		table.insert(nodes, r(index, "row"..tostring(index), i(1)))
		table.insert(nodes, t({ "\\\\", "" }))
	end
	return sn(1, nodes)
end

local M = {
	s({ trig = "gat" }, {
		t({ "\\begin{gather*}", "" }),
		d(1, lst, {}, {
			user_args = {
				-- Pass the functions used to manually update the dynamicNode as user args.
				-- The n-th of these functions will be called by dynamic_node_external_update(n).
				-- These functions are pretty simple, there's probably some cool stuff one could do
				-- with `ui.input`
				function(snip)
					snip.rows = snip.rows + 1
				end,
				-- don't drop below one.
				function(snip)
					snip.rows = math.max(snip.rows - 1, 1)
				end,
			},
		}),
		t({ "\\end{gather*}" }),
	}),
}

return M

