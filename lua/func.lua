local funcs = {}

funcs.run_fixer = function()
	local filename = vim.fn.expand("%:p")
	local filetype = vim.bo.filetype
	local cmd = nil
	if filetype == "python" then
		cmd = "silent !black " .. filename
	elseif filetype == "java" then
		cmd = "silent !java -jar ~/google-java-format-1.18.1-all-deps.jar -i " .. filename
	elseif filetype == "lua" then
		cmd = "silent !stylua " .. filename
	end
	if cmd then
		vim.cmd("w")
		vim.cmd(cmd)
		vim.cmd("e")
		vim.cmd("redraw!")
	else
		print("No fixer defined for filetype: '" .. filetype .. "'")
	end
end

funcs.run_code = function()
	local filename = vim.fn.expand("%:p")
	local dir_path = vim.fn.expand("%:p:h")
	local cls_name = vim.fn.expand("%:t:r")
	local filetype = vim.bo.filetype
	local cmd = nil
	if filetype == "python" then
		cmd = "sp | term python3 " .. filename
	elseif filetype == "java" then
		cmd = string.format("sp | term javac %s && java -cp %s %s", filename, dir_path, cls_name)
	elseif filetype == "lua" then
		cmd = "sp | term lua " .. filename
	end
	if cmd then
		vim.cmd("w")
		vim.cmd(cmd)
	else
		print("No interpreter or compiler defined for filetype: '" .. filetype .. "'")
	end
end

funcs.find_files = function()
	vim.cmd("Telescope find_files")
	--	local cwd = vim.fn.expand("%:p")
-- 	local top = string.match(cwd, "^([/\\]?[^/\\]*[/\\])")
--	if top then
--		require("telescope.builtin").find_files({
--			search_dirs = {}, -- Set the search directory based on the drive letter
--		})
--	end
end

return funcs
