return {
	"akinsho/bufferline.nvim",

	config = function()
		require("bufferline").setup({
			options = {
				themable = false,

				indicator = {
					style = "underline",
				},

				always_show_bufferline = false,
				color_icons = true,
				auto_toggle_bufferline = true,
				separator_style = "slant",

				custom_filter = function(buf_number)
					-- Get buffer type
					local buf_type = vim.bo[buf_number].buftype
					-- Exclude terminal buffers
					return buf_type ~= "terminal"
				end,
			},
		})
	end,
}
