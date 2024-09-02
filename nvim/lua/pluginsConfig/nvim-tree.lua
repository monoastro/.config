vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup(
{
	sort =
	{
		sorter = "case_sensitive",
	},
	view =
	{
		width = 30,
		relativenumber = true,
	},
	renderer =
	{
		group_empty = true,
	},
	filters =
	{
		dotfiles = true,
	},
	git =
	{
		enable = true,
		ignore = false,
		timeout = 500,
	},
})
keymap('n', '<leader>e', ':NvimTreeToggle<CR>')
