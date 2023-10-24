return {
	'L3MON4D3/LuaSnip',
	opts = {
		enable_autosnippets = true,
	},
	config = function(plugin, opts)
		-- include astronvim defaults
		require('plugins.configs.luasnip')(plugin, opts)
		-- load custom snippets
		require('luasnip.loaders.from_lua').lazy_load({ paths = { './lua/user/snippets/' }})
	end,
}
