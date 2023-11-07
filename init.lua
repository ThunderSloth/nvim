local reqs = {
        "options", 
        "keymaps",
        "lazy-config",
        "lualine-config",
        "nvim-tree-config",
        "skeletons",
}
for _, module in ipairs(reqs) do
        require(module)
end
