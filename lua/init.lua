-- Colorscheme
vim.g.colorscheme = "iceberg"

-- System Dependent Settings
vim.g.is_win = vim.fn.has("win32") == 1
vim.g.silencer = vim.g.is_win and " > NUL 2>&1" or " > /dev/null 2>&1"
local dependencies = {"python3", "python"}
for _, dep in ipairs(dependencies) do
	vim.g[dep] = os.execute(dep.." --version"..vim.g.silencer) == 0
end

-- Options, Auto-Commands, Commands, Key-Maps 
require "core"

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

