return {
	"goolord/alpha-nvim",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"███╗   ██╗██╗   ██╗██████╗  ██████╗ ██████╗ ██████╗ ",
			"████╗  ██║██║   ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗",
			"██╔██╗ ██║██║   ██║██████╔╝██║   ██║██████╔╝██████╔╝",
			"██║╚██╗██║╚██╗ ██╔╝██╔══██╗██║   ██║██╔══██╗██╔══██╗",
			"██║ ╚████║ ╚████╔╝ ██████╔╝╚██████╔╝██████╔╝██║  ██║",
			"╚═╝  ╚═══╝  ╚═══╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝",
		}

		dashboard.section.buttons.val = {
			dashboard.button("<space>ff", "  > New file", ":Telescope find_files<CR>"),
		}

		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
