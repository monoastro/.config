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

--total storage use: 144K config + 321M plugins(200M of which is Mason; mainly clangd)
local plugins =
{
	--Very essential
	{ "folke/lazy.nvim", tag = "stable" },
	--colorschemes
	"bluz71/vim-moonfly-colors", --let the moon fly
--	"rebelot/kanagawa.nvim",
	"voldikss/vim-floaterm",

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},
	--"nvim-treesitter/playground",

	"nvim-lualine/lualine.nvim",
	--live server support
	{
		"barrett-ruth/live-server.nvim",
		build = "yarn global add live-server",
		--config = true
	},
	--file navigation
	"echasnovski/mini.icons",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
		},
		opts = {}
	},
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} },
	},
	--creates a git like control of undo stack with multiple branches
	"mbbill/undotree",
	--LaTeX support for nvim
	"lervag/vimtex",
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
		name = 'render-markdown', -- only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
	},
	--experimental git graph
	{
		'isakbm/gitgraph.nvim',
		dependencies = { 'sindrets/diffview.nvim' },
	},
	--replacement for mouse
	"ggandor/leap.nvim",

	--universal lsp handler; Imma be honest, I feel like some of these slow me down more in the long term
	'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
	-- LSP Support
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	--auto closing brackets
	'windwp/nvim-autopairs',
	-- Autocompletion
	--'hrsh7th/nvim-cmp',
	--'hrsh7th/cmp-nvim-lsp',
	--"hrsh7th/cmp-path" ,
	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},
}

require("lazy").setup({
	spec = plugins,
	install = { colorscheme = { "moonfly" } },
  	checker = { enabled = true, notify = false },
})

--[[
-- Used to use; not anymore

--R support for neovim
"jalvesaq/Nvim-R",
--found a possibly better plugin
"theprimeagen/harpoon",  --creates a stack of files and allows switching between them fast 
--was time I moved on to proper lsp
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

--rust; need I say much; Rust and other language stuff is done in Mason
"rust-lang/rust.vim",

--replace with oil
--"nvim-tree/nvim-tree.lua",
--"nvim-tree/nvim-web-devicons", --replace this with mini everywhere

--I don't really get the hype
--"catppuccin/nvim",

--this is madness, imma just use gdb or create my own plugin around it
"mfussenegger/nvim-dap", --dap me up my boy
{
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		handlers = {}
	},
},
{
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} ,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end
},

{
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	opts =
	{
		-- add any opts here
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		{
			"grapp-dev/nui-components.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim"
			}
		},

	},
},



"hrsh7th/cmp-buffer" ,
"saadparwaiz1/cmp_luasnip" ,
"hrsh7th/cmp-nvim-lua" ,
 Snippets
'L3MON4D3/LuaSnip',
'rafamadriz/friendly-snippets',
--]]
