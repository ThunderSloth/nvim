-- Skeletons
vim.cmd([[
augroup templates
  autocmd!
  " read in template files
  autocmd BufNewFile *.* silent! execute '0r ' .. $HOME .. '/.config/nvim/lua/templates/skeleton.' .. expand("<afile>:e")
  " parse special text in the templates after the read
  autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup END
]])

