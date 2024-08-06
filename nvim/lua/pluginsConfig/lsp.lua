local lsp_zero = require('lsp-zero')
require('mason').setup({}) --docs: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver', 'rust_analyzer', 'lua_ls', 'clangd'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})
local cmp = require('cmp') --this one needs to be reusable
cmp.setup({
  window =
  {
    completion =
	{
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None',
    },
    documentation =
	{
      border = 'rounded',
    },
  },
  mapping =
  {
	['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
})

-- :help lsp-zero-keybindings to learn the available actions
lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr}
	keymap('n', '<c-g>', function() vim.lsp.buf.definition() end, opts)
	lsp_zero.default_keymaps(opts)
end)

--remove those annoying signs that overlap with my beautiful line numbers
vim.diagnostic.config({
	signs = false,
})
