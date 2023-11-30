vim.api.nvim_create_user_command(
	"Fix", 
	function()
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
	end,
	{ desc = "Run Fixer" }
)

vim.api.nvim_create_user_command(
	"Run",
	function()
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
		elseif filetype == "tex" then
			vim.cmd("w")
			vim.cmd("VimtexStop")
			vim.cmd("VimtexCompile")
			return
		end
		if cmd then
		vim.cmd("w")
			cmd = ("sp | term cd %s && %s"):format(dir_path, cmd)
			vim.cmd(cmd)
		else
			print("No interpreter or compiler configured for filetype: '" .. filetype .. "'")
		end
	end,
	{ desc = "Run Code" }
)

vim.api.nvim_create_user_command(
	"Skeleton", 
	function(opts) 
		local path = vim.api.nvim_list_runtime_paths()[1] .. "/templates/"
		local template = opts.fargs[1]
		local fname = path .. template
		vim.cmd([[1, $delete]])
		vim.cmd(("silent! execute '0r %s'"):format(fname))
		vim.cmd("%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge")
	end,
	{
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
	}
)


