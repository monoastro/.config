--lsp zero needs to be configured before the language servers
local lsp_zero = require('lsp-zero')
--docs: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({ ensure_installed = {'codelldb'} })
require('mason-lspconfig').setup({
	ensure_installed = {'rust_analyzer', 'lua_ls', 'clangd'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})
require('lspconfig').lua_ls.setup {
	settings =
	{
		Lua =
		{
			runtime =
			{
				version = 'LuaJIT',
			},
			diagnostics =
			{
				globals =
				{
					'vim',
					'require',
				},
			},
			workspace =
			{
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry =
			{
				enable = false,
			},
		},
	},
}
--remove those annoying signs that overlap with my beautiful line numbers
vim.diagnostic.config({ signs = false, })
-- :help lsp-zero-keybindings to learn the available actions
lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr}
	keymap('n', '<c-g>', function() vim.lsp.buf.definition() end, opts)
	lsp_zero.default_keymaps(opts)
end)


--[[
-- I strongly feel like this snippet completion bullshit seriously slows me down in the long term
-- Instead of this bullshit make something that props up documentation on a keyword from some defined source like cht.sh or cppreference
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
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		--{ name = 'buffer' },
		{ name = 'path' },
		--{ name = 'nvim_lua' },
		--{ name = 'luasnip' },
	}),
})
--]]
--[[
uninstalled lsp for now:
'tsserver', 
--local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
--]]

