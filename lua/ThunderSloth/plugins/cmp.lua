local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {

	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		"kdheepak/cmp-latex-symbols",
		"nvim-lspconfig",
	},
	config = function()
		require("cmp").setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				-- completion = require("cmp").config.window.bordered(),
				-- documentation = require("cmp").config.window.bordered(),
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-k>"] = require("cmp").mapping.select_prev_item(),
				["<C-j>"] = require("cmp").mapping.select_next_item(),
				["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
				["<C-f>"] = require("cmp").mapping.scroll_docs(4),
				["<C-Space>"] = require("cmp").mapping.complete(),
				["<C-e>"] = require("cmp").mapping {
					i = require("cmp").mapping.abort(),
					c = require("cmp").mapping.close(),
				},
				["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- that way you will only jump inside the snippet region
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					elseif has_words_before() then
						require("cmp").complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = require("cmp").mapping(function(fallback)
					if require("cmp").visible() then
						require("cmp").select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "lspconfig" },
				{ name = "calc" },
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

