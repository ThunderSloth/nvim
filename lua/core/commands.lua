vim.api.nvim_create_user_command("Fix", function()
	local filename = vim.fn.expand("%:p")
	local filetype = vim.bo.filetype
	local cmd = nil
	if filetype == "python" then
		cmd = "silent !black " .. filename
	elseif filetype == "cpp" then
		cmd = "silent !clang-format -i " .. filename
	elseif filetype == "java" then
		cmd = "silent !java -jar ~/google-java-format-1.18.1-all-deps.jar -i " .. filename
	elseif filetype == "lua" then
		cmd = "silent !stylua " .. filename
	elseif filetype == "tex" then
		cmd = "silent !latexindent -w " .. filename
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

-- Copy the Makefile to the working directory
local function copy_makefile(source, destination)
	local source_file = io.open(source, "r")
	local destination_file = io.open(destination, "w")

	if source_file and destination_file then
		local content = source_file:read("*a")
		content = content:gsub("%[:LUA_EVAL:%](.-)%[:END_EVAL:%]", function(expr)
			local f = load("return "..expr)
			return f and f() or expr
        end)
		destination_file:write(content)
		source_file:close()
		destination_file:close()
		return true
	else
		return false
	end
end

vim.api.nvim_create_user_command("Run", function()
	local filename = vim.fn.expand("%:p")
	local dir_path = vim.fn.expand("%:p:h")
	local proj = dir_path:match("[^/]*$")
	local root = vim.fn.expand("%:t:r")
	local filetype = vim.bo.filetype
	local lua_path = vim.o.runtimepath:match("([^,]+)") .. "/lua"

	local cmd = nil
	if filetype == "python" then
		if vim.g.python3 then
			cmd = "python3 " .. filename
		elseif vim.g.python then
			cmd = "python " .. filename
		end
	elseif filetype == "cpp" then
		if not vim.g.file_exists(dir_path.."/CMakeLists.txt") then
			local makefile_source = vim.fn.stdpath("config") .. "/templates/CMakeLists.txt"
			local makefile_destination = dir_path .. "/CMakeLists.txt"
			copy_makefile(makefile_source, makefile_destination)
			vim.fn.system("cmake .")
		end
		cmd = "make && ./main"
	elseif filetype == "java" then
		cmd = "javac *.java && java " .. root
	elseif filetype == "lua" then
		cmd = "lua " .. filename
	elseif filetype == "tex" then
		if not vim.g.file_exists(dir_path.."/Makefile") then
			local makefile_source = vim.fn.stdpath("config") .. "/templates/tex/Makefile"
			local makefile_destination = dir_path .. "/Makefile"
			copy_makefile(makefile_source, makefile_destination)
		end
		cmd = "make"
		--cmd = "latexmk -pdf " .. filename
	end
	if cmd then
		vim.cmd("w")
		cmd = ("sp | term cd %s && %s"):format(dir_path, cmd)
		vim.cmd(cmd)
	else
		print("No interpreter or compiler configured for filetype: '" .. filetype .. "'")
	end
end, { desc = "Run Code" })

vim.api.nvim_create_user_command("Skeleton", function(opts)
	local path = vim.api.nvim_list_runtime_paths()[1] .. "/templates/"
	local template = opts.fargs[1]
	local fname = path .. template
	vim.cmd([[1, $delete]])
	vim.cmd(("silent! execute '0r %s'"):format(fname))
	vim.cmd("%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge")
end, {
	nargs = 1,
	complete = function(ArgLead, CmdLine, CursorPos)
		local path = vim.api.nvim_list_runtime_paths()[1] .. "/templates/"
		local files = vim.fn.readdir(path)
		local result = {}
		if files then
			for _, file in ipairs(files) do
				if vim.fn.match(file, ArgLead) >= 0 then
					table.insert(result, file)
				end
			end
		end
		return result
	end,
	desc = "Load From Templates",
})
