local function endless(args, parent, old_state, user_args)
	return sn(nil, {	
		t({"", "\t"}), c(1, { 
		i(nil),
		d(nil, endless, {}),
		})
	})
end

local M = {

	s( 
		{trig = "ga", snippetType = "autosnippet",},
		{
			t("\\begin{"), i(1, "gather*"), t({"}", ""}),
			t("\t"), c(2, { 
				i(nil),
				d(nil, endless, {}),
			}),
			t({"", "\\end{"}), f(function(args) 
				return args[1][1] 
			end, {1}), t({"}", ""}),	
		}
	)

}

return M
