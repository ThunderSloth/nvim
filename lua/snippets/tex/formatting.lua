local M = {

	s( -- ,
		{trig = ",", snippetType = "autosnippet",},
		t([[\,\,, ]])
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

