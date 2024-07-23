--for terminal emulator independence
-- Define highlight groups

vim.cmd('highlight clear')

if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'custom_colors'

vim.api.nvim_set_hl(0, 'Normal', { fg = '#00ff00', bg = "none" })  -- Green text, black background
vim.api.nvim_set_hl(0, 'Comment', { fg = '#00ff00', bg = '#000000', italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'Statement', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'Type', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'Special', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'Underlined', { fg = '#00ff00', bg = '#000000', underline = true })
vim.api.nvim_set_hl(0, 'Error', { fg = '#ff0000', bg = '#000000', bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = '#000000', bg = '#00ff00', bold = true })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Line number and cursor line
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#00ff00', bg = '#000000' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#333333' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#00ff00', bg = '#333333' })

-- Search highlighting
vim.api.nvim_set_hl(0, 'Search', { fg = '#000000', bg = '#00ff00' })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#000000', bg = '#00ff00' })
