return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		event = "InsertEnter",
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local function has_words_before()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			return {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			local function on_attach(_, bufnr)
				local keys = vim.keymap.set
				keys("i", "<c-k>", vim.lsp.buf.signature_help, {
					desc = "Signature help",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "<leader>a", vim.lsp.buf.code_action, {
					desc = "Code actions",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "<leader>r", vim.lsp.buf.rename, {
					desc = "Rename symbol",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "K", vim.lsp.buf.hover, {
					desc = "Documentation",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gD", vim.lsp.buf.declaration, {
					desc = "Goto declaration",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gd", vim.lsp.buf.definition, {
					desc = "Goto definition",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gt", vim.lsp.buf.type_definition, {
					desc = "Goto type definition",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gi", vim.lsp.buf.implementation, {
					desc = "Goto implementation",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gr", vim.lsp.buf.references, {
					desc = "Goto references",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "gl", vim.diagnostic.open_float, {
					desc = "Diagnostics",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "]d", vim.diagnostic.goto_next, {
					desc = "Next diagnostic",
					buffer = bufnr,
					silent = true,
				})
				keys("n", "[d", vim.diagnostic.goto_prev, {
					desc = "Previous diagnostic",
					buffer = bufnr,
					silent = true,
				})
			end
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local signs = { "Error", "Warn", "Hint", "Info" }
			for _, type in pairs(signs) do
				local hl = string.format("DiagnosticSign%s", type)
				vim.fn.sign_define(hl, { text = "●", texthl = hl, numhl = hl })
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			})
			vim.keymap.set("n", "<space>f", vim.lsp.buf.format, {
				desc = "Format file",
				silent = true,
			})
		end,
	},
}
