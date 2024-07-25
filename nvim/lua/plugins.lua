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
	{ "folke/lazy.nvim", tag = "stable" },

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
	--live server support for web development
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		--config = true
	},
	--file navigation
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"theprimeagen/harpoon",  --creates a stack of files and allows switching between them fast  
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} },
	},
	--creates a git like control of undo stack with multiple branches
	"mbbill/undotree",
	--LaTeX support for nvim
	"lervag/vimtex",
	--R support for neovim
	"jalvesaq/Nvim-R",
	--vimwiki; the entire basis for my library system
	{
		"vimwiki/vimwiki", 
    	init = function() 
			vim.g.vimwiki_list = {
				{
					path = '~/Desktop/library',
					path_html = '~/Desktop/library/vimwiki_html/',
					syntax = 'markdown',
					ext = '.md',
				}
			}
			vim.g.vimwiki_global_ext = 0
			vim.opt.compatible = false -- Disable compatibility with vi
			vim.cmd [[ filetype plugin on ]] -- Enable file type detection, plugin, and indent
			vim.cmd [[ syntax on ]] -- Enable syntax highlighting
    	end,
    },

	--rust; need I say much
	"rust-lang/rust.vim",
	--copilot for nvim
	"github/copilot.vim",
	--goated to show what shit takes too much time
	"dstein64/vim-startuptime",
	"christoomey/vim-tmux-navigator",
	"rktjmp/lush.nvim",

	--colorschemes
	--let the moon fly
	"bluz71/vim-moonfly-colors",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	--[[
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	},
	--]]
	--List of things I'm currently not sold on/
	
	--a must have for using multi-dimensional arrays --unfortunately this takes too much startup time
	--[[
	{
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
	},
	--]]
	

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
	install = { colorscheme = { "moonfly" } },
  	checker = { enabled = true },
})
