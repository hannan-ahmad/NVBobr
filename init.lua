vim.g.mapleader = " "

require("preferences")
require("keymaps")
require("installing-lazy")

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
	nested = true,

	callback = function()
		vim.cmd.colorscheme(vim.g.SCHEME)
	end,
})

autocmd("ColorScheme", {
	callback = function(params)
		vim.g.SCHEME = params.match
	end,
})

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
