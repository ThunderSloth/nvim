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
--   normal mode = "n",
--   insert mode = "i",
--   visual and select mode = "v",
--   visual mode = "x",
--   term mode = "t",
--   command mode = "c",

map("n", "<BS>", ":b#<CR>") -- alternate buffers
map("i", "<C-BS>", "<Esc>cvb") -- ctrl del to delete current word NOT WORKING
map("i", "ZZ", "<Esc>ZZ") -- save and quit in insert
map('n', 'H', '^') -- beginning of line
map('n', 'L', '$') -- end of line
map('n', '<esc>', '<esc>:noh<cr>') -- cancel search highlight
map('n', '<cr>', ':') -- easier command mode entry
map('n', 'U', '<C-r>') -- undo
map('n', '<leader>j', 'i<cr><esc>') -- break-line

-- Insert empty line without entering insert mode
map('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
map('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)

map('x', 'y', 'may`a') -- don't jump back when yanking
map('x', 'p', 'P') -- when pasting over things, don't yank 

map("n", "<leader>g", ":Git ") -- git fugitive
map("n", "<leader>p", ":Lazy<cr>") -- plugin manager
map("n", "<leader>t", ":NvimTreeToggle<cr>") -- file explorer
map("n", "<leader>x", "", {
    callback = func.run_fixer,
    desc = "run fixer",
    })
map("ni", "<F12>", "", {
    callback = func.run_code,
    desc = "run code",
    })

-- Center to focus
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "G", "Gzz")
map("n", "i", "zzi")
map("n", "I", "zzI")
map("n", "o", "zzo")
map("n", "O", "zzO")
map("n", "a", "zza")
map("n", "A", "zzA")
map("n", "s", "zzs")
map("n", "S", "zzS")
map("n", "c", "zzc")
map("n", "C", "zzC")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")


-- Telescope file finder
map("n", "<leader>ff", "", {callback = func.find_files, desc = "find files",})
--map("n", "<leader>sg", function() vim.cmd("Telescope live_grep") end)
--map("n", "<leader>sb", function() vim.cmd("Telescope buffers") end)
--map("n", "<leader>sh", function() vim.cmd("Telescope help_tags") end)


    -- Better window navigation
map("n", "<C-h>", "<C-w>h") -- left window
map("n", "<C-k>", "<C-w>k") -- up window
map("n", "<C-j>", "<C-w>j") -- down window
map("n", "<C-l>", "<C-w>l") -- right window

-- press jk at the same time to exit insert mode 
map("i", "jk", "<esc>") -- Insert mode -> jk -> Normal mode
map("i", "kj", "<esc>") -- Insert mode -> kj -> Normal mode

-- stay in indent mode
map("v", "<", "<gv") -- Right Indentation
map("v", ">", ">gv") -- Left Indentation

-- move text in visual mode
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo")
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo")
