local reqs = {
        "lazy-config",
        "options", 
        "keymaps",
        "lualine-config",
        "nvim-tree-config",
        "telescope-config",
        "skeletons",
}
for _, module in ipairs(reqs) do
        require(module)
end

-- system dependent settings
local is_win = vim.fn.has("win32") == 1
local prefix = is_win and " > NUL 2>&1" or " > /dev/null 2>&1"

local programs = {"python3", "python"}
for _, prog in ipairs(programs) do
	vim.g[prog] = os.execute(prog.." --version"..prefix) == 0
end
