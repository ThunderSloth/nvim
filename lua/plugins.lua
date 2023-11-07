return {
           { 
               "cocopon/iceberg.vim",
               lazy = false, -- make sure we load this during startup if it is your main colorscheme
               priority = 1000, -- make sure to load this before all the other start plugins
               config = function()
                   -- load the colorscheme here
                   vim.cmd([[colorscheme iceberg]])
               end,
           },        
           {
               "nvim-lualine/lualine.nvim",
               dependencies = {"nvim-tree/nvim-web-devicons"},
	   },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
--{
--"folke/which-key.nvim",
--event = "verylazy",
 --init = function()
 --vim.o.timeout = true
--vim.o.timeoutlen = 300
--end,
--opts = {
---- your configuration comes here
 ---- or leave it empty to use the default settings
 ---- refer to the configuration section below
--}
--},
           "ervandew/supertab", 
           "tpope/vim-fugitive",
        }
