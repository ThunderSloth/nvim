local reqs = {
        "options", 
        "keymaps",
        "lazy-config",
        "lualine-config",
        "nvim-tree-config",
}
for _, module in ipairs(reqs) do
        require(module)
end

--- General settings
vim.cmd('syntax enable')
vim.opt.relativenumber = true
vim.opt.spell = true
vim.opt.smartindent = true
vim.opt.expandtab = true

-- Python settings
vim.cmd('autocmd FileType python setlocal shiftwidth=4')
vim.cmd('autocmd FileType python setlocal softtabstop=4')
vim.cmd('autocmd FileType python setlocal tabstop=4')
vim.cmd('autocmd FileType python setlocal colorcolumn=88')

-- Java settings
vim.cmd('autocmd FileType java setlocal shiftwidth=2')
vim.cmd('autocmd FileType java setlocal softtabstop=2')
vim.cmd('autocmd FileType java setlocal tabstop=2')
vim.cmd('autocmd FileType java setlocal colorcolumn=100')

-- Display settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.cmd('hi CursorLine cterm=NONE')
vim.cmd('hi CursorColumn cterm=NONE')
vim.opt.fillchars = vim.opt.fillchars + {vert = ':'}
vim.cmd('colorscheme iceberg')

-- Skeletons
vim.cmd([[
augroup templates
  autocmd!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r $HOME/vimfiles/templates/skeleton.'..expand("<afile>:e")
  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END
]])
