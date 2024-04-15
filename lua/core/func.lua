vim.g.file_exists = function(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

vim.g.cap1 = function(str)
    return str:gsub("^%l", string.upper)
end

