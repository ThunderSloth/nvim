--[[
	      \begin{figure}[h!]
		      \centering
		      \includegraphics[width=.5\textwidth]{../img/kmapF.png}
              \caption{K-Map of $F(G,S,H,D=\overline{G}H+GD+G \overline{S}  )$}
              \label{fig:kmap1}
	      \end{figure}
]]

local M = {
	s( -- insert img
		{ trig = "img%s(%S+)%s", snippetType = "autosnippet", regTrig = true },
		d(1, function(_, snip)
			local fname = snip.captures[1]
			local node = fmta(
				[[
\begin{figure}[h!]
	\centering
	\includegraphics[width=<>\textwidth]{<>}
	\caption{<>}
	\label{fig:<>}
\end{figure}
<>]],
				{
					i(1, "1"),
					i(2, fname),
					i(3, fname),
					i(4, fname),
					i(5),
				}
			)

			return sn(nil, node)
		end, {})
	),
}

return M
