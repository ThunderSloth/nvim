return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim", config = true },
		},
		config = function()
			-- Setup language servers.
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.texlab.setup({})
			lspconfig.clangd.setup({ cmd = { "clangd-mp-11" } })
			---- Global mappings.
			---- See `:help vim.diagnostic.*` for documentation on any of the below functions
			--vim.keymap.set('n', '<space>dd', vim.diagnostic.open_float)
			--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			--vim.keymap.set('n', '<space>dl', vim.diagnostic.setloclist)
			--
			---- Use LspAttach autocommand to only map the following keys
			---- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.g.map
					---- Enable completion triggered by <c-x><c-o>
					--vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
					--
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions

					local map = vim.g.map

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions

					local opts = { buffer = ev.buf }

					map("n", "gD", vim.lsp.buf.declaration, "Go to declaration of symbol under cursor", opts)
					map("n", "gd", vim.lsp.buf.definition, "Go to definition of symbol under cursor", opts)
					map("n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help for function call under cursor", opts)
					map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add current workspace folder to workspace", opts)
					map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove current workspace folder from workspace", opts)
					map("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "List all workspace folders in current workspace", opts)
					map("n", "<space>D", vim.lsp.buf.type_definition, "Go to type definition of symbol under cursor", opts)
					map("n", "<space>rn", vim.lsp.buf.rename, "Rename symbol under cursor", opts)
					map("nv", "<space>ca", vim.lsp.buf.code_action, "Get code actions for symbol under cursor", opts)
					map("n", "gr", vim.lsp.buf.references, "Get references to symbol under cursor", opts)
					map("n", "<space>m", function()
						vim.lsp.buf.format { async = true }
					end, "Format current buffer", opts)
				end,
			})
		end,
	},
}
