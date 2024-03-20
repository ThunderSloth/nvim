local M = {}

table.insert(
	M,
	s( -- begin
		{ trig = "beg", snippetType = "autosnippet" },
			fmta([[
\begin{<><>}
    <>\\
\end{<><>} ]], 
			{
				c(1, {t"gather", t"align", t"enumerate", t"equation", i(nil)}), c(2, {t"*", t""}),
				i(3), 
				extras.rep(1), extras.rep(2)
			}	
		)
	)
)

return M

