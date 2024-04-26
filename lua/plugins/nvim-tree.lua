return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
    keys = {
		{"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer",}
    },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require('nvim-tree').setup({view = {relativenumber = true}})
	end,
}
