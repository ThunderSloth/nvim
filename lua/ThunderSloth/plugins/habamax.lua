return {
  {
    "habamax/vim-habamax",
    lazy = true, 
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme habamax]])
    end,
  },
}
