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
	--Very essential
	{ "folke/lazy.nvim", tag = "stable" },
	--colorschemes
	"bluz71/vim-moonfly-colors", --let the moon fly
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
	"leath-dub/snipe.nvim",
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
	--connect discord to nvim
	"andweeb/presence.nvim",
	--use vim navigation in tmux
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	--markdown support
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	},

	--universal lsp handler; Imma be honest, I don't have the complete picture on what each of these things accomplish
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	-- LSP Support
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	-- Autocompletion
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{"hrsh7th/cmp-buffer" },
	{"hrsh7th/cmp-path" },
	{"saadparwaiz1/cmp_luasnip" },
	{"hrsh7th/cmp-nvim-lua" },
	-- Snippets
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},

	-- Used to use; not anymore

	--[[
	--found a possibly better plugin
	"theprimeagen/harpoon",  --creates a stack of files and allows switching between them fast 
	{ 
		"neoclide/coc.nvim",
		branch = "release",
	},
	--create nvim themes
	"rktjmp/lush.nvim",
	'tpope/vim-obsession',
	--a must have for using multi-dimensional arrays --unfortunately this takes too much startup time
	{
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
	},
	--]]
}

require("lazy").setup({
	spec = plugins,
	install = { colorscheme = { "moonfly" } },
  	checker = { enabled = true },
})
