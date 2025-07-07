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

local function open_terminal()
	vim.cmd.split()
	vim.cmd.terminal()
	vim.cmd.call("nvim_feedkeys('A', 'n', v:true)")
end

local function format()
	require("conform").format()
end

local map = vim.keymap.set

map("n", "<leader>rn", auto_run)
map("n", "<leader>n", ":tabnew<CR>")
map("n", "<tab>", ":tabnext<CR>")
map("n", "<S-tab>", ":tabprevious<CR>")
map("n", "<C-q>", ":q<CR>")
map("n", "<C-j>", open_terminal)

map("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")
map("n", "<leader>e", ":Neotree focus<CR>")

map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>th", ":Telescope colorscheme<CR>")
map("n", "<leader>fw", ":Telescope live_grep<CR>")
map("n", "<leader>ld", ":Telescope diagnostics<CR>")

map("n", "<leader>ft", format)
