vim.g.file_exists = function(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

vim.g.cap1 = function(str)
    return str:gsub("^%l", string.upper)
end

vim.g.map = function(mode, lhs, rhs, desc, opts)
	local options = { noremap = true, silent = true }
	if desc ~= nil then
		options.desc = desc
		if opts ~= nil then
			options = vim.tbl_extend("force", options, opts)
		end
	end
	for char in mode:gmatch(".") do
		vim.keymap.set(char, lhs, rhs, options)
	end
end
