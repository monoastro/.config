require("nvim-treesitter.configs").setup({
	ensure_installed =
	{
		"cpp", "rust", "c", "lua", "vim", "javascript", "typescript", "html", "css", "json", "toml", "bash", "python", "markdown", "markdown_inline"
	},
	sync_install = false,
	auto_install = false,
	ignore_install = { "latex" },

	highlight =
	{
		enable = true,
	},
})
