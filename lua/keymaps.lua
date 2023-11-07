local func = require("func")

function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
	for char in mode:gmatch(".") do
		vim.keymap.set(char, lhs, rhs, options)
	end
end

vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

map("n", "<leader>g", ":Git ") -- git fugitive
map("n", "<leader>p", ":Lazy<cr>") -- plugin manager
map("n", "<leader>t", ":NvimTreeToggle<cr>") -- file explorer
map("n", "<leader>f", "", {
    callback = func.run_fixer,
    desc = "run fixer",
    })
map("ni", "<F12>", "", {
    callback = func.run_code,
    desc = "run code",
    })
    -- Better window navigation
map("n", "<C-h>", "<C-w>h") -- left window
map("n", "<C-k>", "<C-w>k") -- up window
map("n", "<C-j>", "<C-w>j") -- down window
map("n", "<C-l>", "<C-w>l") -- right window

-- press jk fast to exit insert mode 
map("i", "jk", "<esc>") -- Insert mode -> jk -> Normal mode
map("i", "kj", "<esc>") -- Insert mode -> kj -> Normal mode

-- stay in indent mode
map("v", "<", "<gv") -- Right Indentation
map("v", ">", ">gv") -- Left Indentation
