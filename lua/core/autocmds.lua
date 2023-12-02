vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "*.*",
	callback = function()
		local path = vim.api.nvim_list_runtime_paths()[1] .. "/templates/"
		local base = "skeleton"
		local ext = vim.fn.expand("%:e")
		local fname = path .. base .. "." .. ext
		vim.cmd(("silent! execute '0r %s'"):format(fname))
		vim.cmd("%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge")
	end,
	desc = "Load From Templates",
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
	pattern = "term://*",
	command = "startinsert",
	desc = "Always enter terminal in insert-mode",
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	command = "mkview",
	desc = "Save view (folds), when closing file",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	command = "silent! loadview",
	desc = "Load view (folds), when opening file",
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
