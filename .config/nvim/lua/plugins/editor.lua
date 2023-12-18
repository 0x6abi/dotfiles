return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = "VeryLazy",
		init = function()
			require('nvim-treesitter.query_predicates')
		end,
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
				added[lang] = true
				return true
				end, opts.ensure_installed)
			end
			require('nvim-treesitter.configs').setup(opts)
		end,
		opts = {
			ensure_installed = { 'c', 'bash', 'lua', 'java', 'rust', 'python' },
			highlight = {
				enable = true,
			}
		},
	},
	{
		'echasnovski/mini.basics',
		config = function(_, opts)
			require('mini.basics').setup(opts)
		end,
		opts = {
			options = {
				basic = true,
				extra_ui = false,
				win_borders = 'solid',
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
		}
	}
}
