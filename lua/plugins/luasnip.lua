return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets", "nvim-treesitter/nvim-treesitter", },
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		-- some shorthands...
		local s = ls.snippet
		local sn = ls.snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local l = require("luasnip.extras").lambda
		local r = require("luasnip.extras").rep
		local p = require("luasnip.extras").partial
		local m = require("luasnip.extras").match
		local n = require("luasnip.extras").nonempty
		local dl = require("luasnip.extras").dynamic_lambda
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta
		local types = require("luasnip.util.types")
		local conds = require("luasnip.extras.expand_conditions")

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

		ls.config.set_config({	
			keep_roots = true,
			link_roots = true,
			link_children = true,

			-- Update more often, :h events for more info.
			update_events = "TextChanged,TextChangedI",
			-- Snippets aren't automatically removed if their text is deleted.
			-- `delete_check_events` determines on which events (:h events) a check for
			-- deleted snippets is performed.
			-- This can be especially useful when `history` is enabled.
			delete_check_events = "TextChanged",
			history = true, --keep around last snippet local to jump back
			enable_autosnippets = true,
			ext_base_prio = 300,
			store_selection_keys="<leader>",
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "Comment" } },
					},
				},
			},
		})
		-- ChoiceNode-Popup: Currently not configured. Use these references to implement:
		-- https://github.com/pysan3/dotfiles/blob/main/nvim/lua/plugins/70-LuaSnip.lua
		-- https://github.com/L3MON4D3/LuaSnip/wiki/Misc#choicenode-popupluasnip
	end,
}
