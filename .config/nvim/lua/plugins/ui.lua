return {
	{
		'echasnovski/mini.statusline',
		config = function()
			require('mini.statusline').setup()
		end,
		opts = {
			use_icons = false,
		},
	},
	{
		'echasnovski/mini.tabline',
		config = function()
			require('mini.tabline').setup()
		end,
		opts = {
			show_icons = false,
		}
	}
}
