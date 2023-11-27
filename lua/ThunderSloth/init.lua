-- Colorscheme
vim.g.colorscheme = "habamax"

-- System Dependent Settings
vim.g.is_win = vim.fn.has("win32") == 1
vim.g.silencer = vim.g.is_win and " > NUL 2>&1" or " > /dev/null 2>&1"
local dependencies = {"python3", "python"}
for _, dep in ipairs(dependencies) do
	vim.g[dep] = os.execute(dep.." --version"..vim.g.silencer) == 0
end

-- Options, Auto-Commands, Commands, Key-Maps 
require "ThunderSloth.core"

-- Plugins
require "ThunderSloth.lazy"

