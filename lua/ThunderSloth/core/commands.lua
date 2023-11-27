vim.api.nvim_create_user_command("Fix", function()
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
end, { desc = "Run Fixer" })

vim.api.nvim_create_user_command("Run", function()
	local filename = vim.fn.expand("%:p")
	local dir_path = vim.fn.expand("%:p:h")
	local cls_name = vim.fn.expand("%:t:r")
	local filetype = vim.bo.filetype
	local cmd = nil
	if filetype == "python" then
		if vim.g.python3 then
			cmd = "python3 " .. filename
		elseif vim.g.python then
			cmd = "python " .. filename
		end
	elseif filetype == "java" then
		cmd = "javac *.java && java " .. cls_name
	elseif filetype == "lua" then
		cmd = "lua " .. filename
	end
	if cmd then
		vim.cmd("w")
		cmd = ("sp | term cd %s && %s"):format(dir_path, cmd)
		print(cmd)
		--vim.cmd(cmd)
	else
		print("No interpreter or compiler configured for filetype: '" .. filetype .. "'")
	end
end, { desc = "Run Code" })

