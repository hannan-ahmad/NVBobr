return {
	{
		"mason-org/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",

		config = function()
			local lsp = require("lspconfig")

			vim.diagnostic.config({ virtual_text = true })

			lsp.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}
