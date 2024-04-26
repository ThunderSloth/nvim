local opt = vim.opt

--Display
opt.termguicolors = true -- True color support
opt.cursorline = true
opt.cursorcolumn = true
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.showmode = false -- Dont show mode since we have a statusline
opt.laststatus = 0 -- No status line for last window
opt.signcolumn = "yes" -- Always show signcolumn, otherwise text will shift
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.list = true -- Show some invisible characters
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 5 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.shortmess:append({ I = true, c = true }) -- https://neovim.io/doc/user/options.html#'shortmess'
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

--Behavior
opt.acd = true
opt.spell = true
opt.spelllang = { "en" }
opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.completeopt = "menu,longest"
opt.formatoptions = "jcroqlnt" -- https://neovim.io/doc/user/change.html#fo-table
opt.mouse = "a" -- Enable mouse mode
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- Remembers specified session options
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.timeoutlen = 500 -- Speed must be under 500ms in order for keys to work, increase if you are not able to.
opt.undofile = true -- Save undo history
opt.undolevels = 10000 -- Size of undo-buffer
opt.updatetime = 200 -- Milliseconds before crash-recovery save
opt.foldmethod = "indent"
opt.foldlevel = 1000
--Searching
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = "nosplit" -- Preview substitutions
opt.incsearch = true -- Preview search matches

--Indentation
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.autoindent = true -- Insert indents automatically
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
