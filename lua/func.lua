local funcs = {}

funcs.run_fixer = function()
    local filename = vim.fn.expand("%")
	local filetype = vim.bo.filetype
	local cmd = nil
    if filetype == "python" then
        cmd = "silent !black "..filename
    elseif filetype == "java" then
        cmd = "silent !java -jar ~/google-java-format-1.18.1-all-deps.jar -i "..filename
	end
    if cmd then
        vim.cmd("w")
        vim.cmd(cmd)
        vim.cmd("e")
        vim.cmd("redraw!")
	else
        print("No fixer defined for filetype: '"..filetype.."'")
	end
end

funcs.run_code = function()
    local filename = vim.fn.expand("%:p")
	local dir_path = vim.fn.expand("%:p:h") 
    local cls_name = vim.fn.expand("%:t:r")
	local filetype = vim.bo.filetype
	local cmd = nil
    if filetype == "python" then
        cmd = "term python3 "..filename
    elseif filetype == "java" then
        cmd = string.format("term javac %s && java -cp %s %s", filename, dir_path, cls_name)
	end
	if cmd then
  		vim.cmd("w")
		vim.cmd(cmd)
	else
		print("No interpreter or compiler defined for filetype: '"..filetype.."'")
	end
end

return funcs

