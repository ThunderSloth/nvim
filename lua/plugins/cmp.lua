return {

	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"kdheepak/cmp-latex-symbols",
		"nvim-lspconfig",
	},
	config = function()
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end

		local snip_status_ok, luasnip = pcall(require, "luasnip")
		if not snip_status_ok then
			return
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				["<C-k>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.choice_active() then
						luasnip.change_choice(-1)
					else
						require("snippets.tex.utils").update_list(2)
					end
				end, { "i", "s" }),
				["<C-j>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.choice_active() then
						luasnip.change_choice(1)
					else
						require("snippets.tex.utils").update_list(1)
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if cmp.visible() then
						local mode = vim.fn.mode()
						if mode == "i" then
							cmp.abort()
						elseif mode == "c" then
							cmp.close()
						end
					elseif luasnip.jumpable() then
						luasnip.jump(-1)
					else
						vim.cmd("norm B")
					end
				end, { "i", "s" }),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump(1)
					else
						vim.cmd("norm W")
					end
				end, { "i", "s" }),
				-- overloaded tab too annoying, especially for py
				--["<tab>"] = cmp.mapping(function(fallback)
					--if luasnip.expand_or_jumpable() then
						--luasnip.expand_or_jump(1)
					--else
						--fallback()
					--end
				--end, { "i", "s" }),
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-x>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
			},
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			sources = {
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "lspconfig" },
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
				{
					name = "latex_symbols",
					option = {
						strategy = 0, -- mixed
					},
				},
				-- more sources
			},
		})
	end,
}
