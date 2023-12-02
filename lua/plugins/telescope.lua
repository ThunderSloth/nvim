return { 
    'nvim-telescope/telescope.nvim',
	tag = '0.1.4',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-web-devicons' },
	lazy = true,
	keys = {
		{"<leader>ff", 
		function() require('telescope.builtin').find_files() end,
		desc = "Find File"},	
		{"<leader>fo",
		function() require('telescope.builtin').oldfiles() end,
		desc = "Old Files"},	
		{"<leader>fg", 
		function() require('telescope.builtin').live_grep() end,
		desc = "Live Grep"},	
		{"<leader>fb", 
		function() require('telescope.builtin').buffers() end,
		desc = "Find Buffers"},	
		{"<leader>fh", 
		function() require('telescope.builtin').help_tags() end,
		desc = "Help Tags"},	
	},

	config = function()
		require('telescope').setup{
		defaults = {
			-- Default configuration for telescope goes here:
			-- config_key = value,
			mappings = {
				i = {
					-- map actions.which_key to <C-h> (default: <C-/>)
					-- actions.which_key shows the mappings for your picker,
					-- e.g. git_{create, delete, ...}_branch for the git_branches picker
					["<C-h>"] = "which_key",
					["ZZ"] = require('telescope.actions').close,
				},
				n = {
					["ZZ"] = require('telescope.actions').close,
				},
			},
		},
		pickers = {
			-- Default configuration for builtin pickers goes here:
			-- picker_name = {
			--   picker_config_key = value,
			--   ...
			-- }
			-- Now the picker_config_key will be applied every time you call this
			-- builtin picker
		},
		extensions = {
			-- Your extension configuration goes here:
			-- extension_name = {
			--   extension_config_key = value,
			-- }
			-- please take a look at the readme of the extension you want to configure
		}
		}
	end,
}
