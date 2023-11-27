vim.api.nvim_create_autocmd({"BufNewFile"}, {
	pattern = "*.*",
	callback = function()
		local path = vim.api.nvim_list_runtime_paths()[1].."/templates/"
		local base = "skeleton"
		local ext = vim.fn.expand("%:e")
		local fname = path .. base .. "." .. ext
		vim.cmd(("silent! execute '0r %s'"):format(fname))
		vim.cmd("%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge")
	end,
	desc = "Load From Templates"
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter"},
	{pattern = "term://*", command = "startinsert" }) -- Always enter term in insert-mode

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})
