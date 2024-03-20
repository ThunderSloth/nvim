local M = {

	s( -- space
		{trig = "  ", snippetType = "autosnippet",},
		t([[\,]])
	),
	s( -- big space
		{trig = "qq", snippetType = "autosnippet",},
		t([[\quad ]])
	),
	s( -- ;
		{trig = ";", snippetType = "autosnippet",},
		t([[\,;\quad ]])
	),
	s( -- ->
		{trig = "->", snippetType = "autosnippet",},
		t([[\quad\Rightarrow\quad ]])
	),
	s( -- display style
		{trig = "\\ds", snippetType = "autosnippet",},
		t([[\displaystyle ]])
	),
}

return M

