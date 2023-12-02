M = {
	-- the colorscheme should be available when starting Neovim
	{
		"cocopon/iceberg.vim",
		name = "iceberg",
		lazy = true, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme iceberg]])
		end,
	},
	{
		"habamax/vim-habamax",
		name = "habamax",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme habamax]])
		end,
	},
}

for _, v in ipairs(M) do
	if v.name == vim.g.colorscheme then
		v.lazy = false
		break
	end
end

return M
