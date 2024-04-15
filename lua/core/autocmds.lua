vim.api.nvim_create_autocmd({ "BufNewFile" }, {
    pattern = "*.*",
    callback = function()
        local path = vim.api.nvim_list_runtime_paths()[1] .. "/templates/"
        local ext = vim.fn.expand("%:e")
		local root = vim.fn.expand("%:t:r")
        -- Check if the file name matches a specific pattern, if not use default template for extension
		local fname = path .. (vim.g.file_exists(path .. root .. '.' .. ext) and root or "skeleton") ..'.' .. ext
        vim.cmd(("silent! execute '0r %s'"):format(fname))
        vim.cmd("%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge")
        vim.cmd("%substitute#\\[:LUA_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=luaeval(submatch(1))#ge")
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
