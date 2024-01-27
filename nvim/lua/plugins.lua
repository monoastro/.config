local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
--essentials
	use 'wbthomason/packer.nvim'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'voldikss/vim-floaterm'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/playground'
	use 'nvim-lualine/lualine.nvim'

--a must have for using multi-dimensional arrays
	use({
		'Wansmer/treesj',
		requires = { 'nvim-treesitter' },
	})

	use {
		'barrett-ruth/live-server.nvim',
		build = 'yarn global add live-server',
		--config = true --this is giving out an error when doing :PackerSync
	}

--file navigation
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use("theprimeagen/harpoon")  --creates a stack of files and allows switching between them fast  
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'christoomey/vim-tmux-navigator'

--creates a git like control of undo stack with mulitple branches
	use("mbbill/undotree")

--LaTeX support for nvim
	use("lervag/vimtex")

--R support for neovim
	use("jalvesaq/Nvim-R")

--vimwiki; need I say much
	use("vimwiki/vimwiki")

--List of things I'm currently not sold on

--[[universal lsp handler; eh don't really need it
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'williamboman/mason.nvim' },

			-- Autocompletion
			--{ 'hrsh7th/nvim-cmp' },
			--{ 'hrsh7th/cmp-nvim-lsp' },
			--{ 'hrsh7th/cmp-buffer' },
			--{ 'hrsh7th/cmp-path' },
			--{ 'saadparwaiz1/cmp_luasnip' },
			--{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			--{ 'L3MON4D3/LuaSnip' },
			--{ 'rafamadriz/friendly-snippets' },
		}
	}
--]]

--allows manipulation of stuff in git
	--use("tpope/vim-fugitive")

	if packer_bootstrap then
		require('packer').sync()
	end
end)
