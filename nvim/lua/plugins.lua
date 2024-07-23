-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = 
{
	--essentials
	{ 
		"neoclide/coc.nvim",
		branch = "release",
	},
	"voldikss/vim-floaterm",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},
	"nvim-treesitter/playground",
	"nvim-lualine/lualine.nvim",

	--a must have for using multi-dimensional arrays
	{
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
	},

	--live server support for web development
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		--config = true --this is giving out an error when doing :PackerSync
	},

	--file navigation
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"theprimeagen/harpoon",  --creates a stack of files and allows switching between them fast  
	
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} },
	},

	--creates a git like control of undo stack with mulitple branches
	"mbbill/undotree",

	--LaTeX support for nvim
	"lervag/vimtex",

	--R support for neovim
	"jalvesaq/Nvim-R",

	--vimwiki; need I say much
	"vimwiki/vimwiki",

	--rust; need I say much
	"rust-lang/rust.vim",

	"christoomey/vim-tmux-navigator",

	--allows manipulation of stuff in git
	"tpope/vim-fugitive",

	"rktjmp/lush.nvim",

	"dstein64/vim-startuptime",

	
	--[[
	{
		"MeanderingProgrammer/markdown.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	--]]
	--let the moon fly
	"bluz71/vim-moonfly-colors",
	"github/copilot.vim",

	--List of things I'm currently not sold on

	--[[universal lsp handler; eh don't really need it
	{

		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "williamboman/mason.nvim" },

			-- Autocompletion
			--{ "hrsh7th/nvim-cmp" },
			--{ "hrsh7th/cmp-nvim-lsp" },
			--{ "hrsh7th/cmp-buffer" },
			--{ "hrsh7th/cmp-path" },
			--{ "saadparwaiz1/cmp_luasnip" },
			--{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			--{ "L3MON4D3/LuaSnip" },
			--{ "rafamadriz/friendly-snippets" },
		},
	}
	--]]

	--connect discord to nvim
	--[[	"andweeb/presence.nvim",
	--]]
}

local opts = {}

-- Setup lazy.nvim
require("lazy").setup({
	spec = plugins,
	install = { colorscheme = { "habamax" } },
  	checker = { enabled = true },
})
