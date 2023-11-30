
return {
	"lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = 'skim'
		vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
		vim.g.vimtex_compiler_method = 'latexmk'
	end,
}
