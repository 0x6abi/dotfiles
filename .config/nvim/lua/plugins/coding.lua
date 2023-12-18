return {
	{
		'echasnovski/mini.completion',
		config = function()
			require('mini.completion').setup()
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'folke/neodev.nvim',
		}
	}
}
