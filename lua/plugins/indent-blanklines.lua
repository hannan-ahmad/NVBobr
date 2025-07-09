return {
	"lukas-reineke/indent-blankline.nvim",

	lazy = true,

	config = function()
		require("ibl").setup({
			scope = { enabled = false },
		})
	end,
}
