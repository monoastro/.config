-- Define the desktop wiki with custom index file location and folder for other files
local desktop_wiki = { 
	path = '~/Desktop/library',
	path_html = '~/Desktop/library/vimwiki_html'
	--syntax = 'markdown',  -- Specify the syntax for the wiki
	-- ext = '.md'  -- Set the file extension for the wiki files
}

-- Set up the vimwiki list
vim.g.vimwiki_list = { desktop_wiki }

-- Optionally, configure additional global options
-- vim.g.vimwiki_global_ext = 0  -- Disable global extensions (useful if you want to specify extensions per wiki)

-- Add more global configurations or override default options as needed

-- Example: Set custom key mappings for VimWiki
vim.api.nvim_set_keymap('n', '<leader>ww', '<Plug>VimwikiIndex', {})
vim.api.nvim_set_keymap('n', '<leader>wt', '<Plug>VimwikiTabIndex', {})
vim.api.nvim_set_keymap('n', '<leader>ws', '<Plug>VimwikiUISelect', {})
vim.api.nvim_set_keymap('n', '<leader>wi', '<Plug>VimwikiToggleListItem', {})

-- Example: Set custom options for VimWiki syntax highlighting
-- vim.g.vimwiki_folding = 'expr'  -- Use expression-based folding

