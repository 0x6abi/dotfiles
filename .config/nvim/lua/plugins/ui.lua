return {
	{
		'echasnovski/mini.cursorword',
		event = "VeryLazy",
		config = function()
			require('mini.cursorword').setup()
		end,
	},
	{
		"echasnovski/mini.starter",
		config = function()
			require('mini.starter').setup()
		end,
	},
	{
		'echasnovski/mini.statusline',
		-- config = function()
		-- 	require('mini.statusline').setup()
		-- end,
		opts = {
			use_icons = false,
		}
	},
	{
		'echasnovski/mini.tabline',
		-- config = function()
		-- 	require('mini.tabline').setup()
		-- end,
		opts = {
			show_icons = false,
		}
	},
	{
		'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_'},
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
				untracked = { text = '+' },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			attach_to_untracked = true,
			current_line_blame = false,
		}
	}
}
