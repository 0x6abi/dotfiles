return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 1001,
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"haskell",
				"html",
				"java",
				"json",
				"lua",
				"make",
				"markdown",
				"rust",
				"xml",
			},
			highlight = { enable = true },
		},
	},
	{
		"echasnovski/mini.basics",
		event = "VeryLazy",
		opts = {
			options = {
				basic = true,
				extra_ui = false,
				win_borders = "solid",
			},
			mappings = {
				basic = true,
				option_toggle_prefix = [[\]],
				windows = true,
				move_with_alt = true,
			},
			autocommands = {
				basic = true,
				relnum_in_visual_mode = false,
			},
			silent = true,
		},
	},
	{
		"echasnovski/mini.comment",
		keys = { "gc", "gcc" },
		config = function()
			require("mini.comment").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		keys = { "gza", "gzd", "gzf", "gzF", "gzh", "gzr" },
		opts = {
			mappings = {
				add = 'gza',
				delete = 'gzd',
				find = 'gzf',
				find_left = 'gzF',
				highlight = 'gzj',
				replace = 'gzr',
			}
		}
	},
}
