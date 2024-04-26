
vim.g.mapleader = " "
vim.g.maplocalleader = ','

local map = vim.g.map
--[[
	Modes:
		normal = "n",
		insert = "i",
		visual/select = "v",
		visual = "x",
		term = "t",
		command = "c",
]]--

-- User/Plugin commands
map("n", "<leader>p", "<cmd>Lazy<CR>", "Plugin Manager")
map("n", "<leader>x", "<cmd>Fix<CR>", "Run Fixer")
map("ni", "<F12>", "<cmd>Run<CR>", "Run Code")
map("n", "<leader>r", function()
	local path = "~/.config/nvim/lua/snippets/"
	require("luasnip.loaders").reload_file(path)
end, "Reload Snippets")

-- Leader
map("n", "<leader>j", "i<cr><esc>", "Break Line")
map("n", "<leader>o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', "Empty Line Below")
map("n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', "Empty Line Above")

-- Misc Shortcuts
map("n", "<BS>", ":b#<CR>") -- alternate buffers
map("i", "ZZ", "<Esc>ZZ") -- save and quit in insert
map("n", "H", "^", "BOL") -- beginning of line
map("n", "L", "$", "EOL") -- end of line
map("n", "U", "<C-r>") -- undo

-- Modify Default
map("x", "y", "may`a") -- don't jump back when yanking
map("x", "p", "P") -- when pasting over things, don't yank
map("n", "<esc>", "<esc>:noh<cr>") -- cancel search highlight

-- Center to focus
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Better window navigation
map("n", "<C-h>", "<C-w>h") -- left window
map("n", "<C-k>", "<C-w>k") -- up window
map("n", "<C-j>", "<C-w>j") -- down window
map("n", "<C-l>", "<C-w>l") -- right window

-- Press 'jk' at the same time to exit insert mode
map("nivxtc", "jk", "<esc>") -- Insert mode -> jk -> Normal mode
map("nivxtc", "kj", "<esc>") -- Insert mode -> kj -> Normal mode

-- Stay in indent mode
map("v", "<", "<gv") -- Right Indentation
map("v", ">", ">gv") -- Left Indentation

-- Move text in visual mode
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo") -- "pull" text down
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo") -- "pull" text up
