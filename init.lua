vim.g.mapleader = " "

require("preferences")
require("keymaps")
require("installing-lazy")

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
	nested = true,

	callback = function()
		vim.cmd.colorscheme(vim.g.SCHEME)
		require("neo-tree").setup()

		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		})
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

autocmd("FileType", {
	callback = function()
		require("lualine").setup()

		local file_name = vim.bo.filetype

		if file_name == "markdown" then
			require("render-markdown").setup()
		end
	end,
})
