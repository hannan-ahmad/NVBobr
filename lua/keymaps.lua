local function auto_run()
	local file_name = vim.api.nvim_buf_get_name(0)
	local file_type = vim.bo.filetype

	if file_type == "c" then
		vim.cmd.split()
		vim.cmd.terminal("gcc " .. file_name .. "&& ./a.out")
		vim.cmd.call("nvim_feedkeys('A', 'n', v:true)")
	elseif file_type == "python" then
		vim.cmd.split()
		vim.cmd.terminal("python3.13 " .. file_name)
		vim.cmd.call("nvim_feedkeys('A', 'n', v:true)")
	elseif file_type == "sh" then
		vim.cmd.split()
		vim.cmd.terminal("bash " .. file_name)
		vim.cmd.call("nvim_feedkeys('A', 'n', v:true)")
	end
end

local function load_colorschemes()
	local colorschemes = {
		"catppuccin",
		"nord",
		"tokyonight",
		"ayu",
		"dracula",
		"rose-pine",
		"monokai-pro",
		"gruvbox",
		"github-theme",
		"onedarkpro",
		"kanagawa",
		"visual_studio_code",
		"night-owl",
	}

	for _, names in ipairs(colorschemes) do
		require(names).setup({})
	end

	vim.cmd(":Telescope colorscheme")
end

local function open_terminal()
	vim.cmd.split()
	vim.cmd.terminal()
	vim.cmd.call("nvim_feedkeys('A', 'n', v:true)")
end

local function toggle_ibl()
	require("ibl").setup()
end

local function format()
	require("conform").format()
end

local function focus_aerial()
	require("aerial").focus()
end

local map = vim.keymap.set

map("n", "<leader>rn", auto_run)
map("n", "<C-q>", ":q<CR>")
map("n", "<C-j>", open_terminal)

map("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")
map("n", "<leader>e", ":Neotree focus<CR>")

map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>th", load_colorschemes)
map("n", "<leader>fw", ":Telescope live_grep<CR>")
map("n", "<leader>ld", ":Telescope diagnostics<CR>")

map("n", "<leader>ft", format)
map("n", "<leader>l", toggle_ibl)

map("n", "<tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-tab>", ":BufferLineCyclePrev<CR>")
map("n", "<S-tab>", ":BufferLineCyclePrev<CR>")
map("n", "<leader>x", ":bdelete<CR>")
