--hmm, a combination of oil for insert mode + nvim-tree for normal mode would be ideal, maybe create something like that
require("oil").setup({
	default_file_explorer = true,
	--delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options =
	{
		show_hidden = true,
		natural_order = true,
		--[[
		is_always_hidden = function(name, _)
			return name == ".." or name == ".git"
		end,
		--]]
	},
	float =
	{
		padding = 2,
		max_width = 90,
		max_height = 0,
	},
	win_options =
	{
		wrap = true,
		winblend = 0,
	},
	keymaps =
	{
		["<C-c>"] = false,
		["q"] = "actions.close",
	},
})


local oil = require("oil")

local function toggle_oil()
	if vim.bo.filetype == "oil" then
		vim.cmd("close")
	else
		oil.open_float()
		--vim.cmd("wincmd H")
		--vim.cmd("vertical resize 30")
	end
end


keymap("n", "<leader>e", toggle_oil , { desc = "Toggle oil.nvim" })
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


--[[
--I refuse to let this function go to waste
local oil_buf = nil
local function toggle_oil()
	if oil_buf and vim.api.nvim_buf_is_valid(oil_buf) then -- If the oil buffer exists and is valid, find and close its window
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == oil_buf then
				vim.api.nvim_win_close(win, true)
				oil_buf = nil
				return
			end
		end
	end

	-- otherwise, open oil and index the buffer
	oil.open_float()
	--vim.cmd("wincmd H")
	--vim.cmd("vertical resize 30")
	oil_buf = vim.api.nvim_get_current_buf()
end
--]]
