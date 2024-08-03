--vim.opt.termguicolors = false --I will miss this option
vim.cmd([[colorscheme moonfly]])
--set stuff's background to transparent so it takes on the terminal's transparent background
--the cterm colors are just in case I use this config on an old laptop/terminal
vim.cmd [[ highlight Normal guibg=NONE ctermbg=NONE ]]
vim.cmd [[ highlight LineNr guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue]]
vim.cmd [[ highlight NormalFloat guibg=NONE ctermbg=NONE ctermfg=blue ]]
vim.cmd [[ highlight FloatBorder guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue]]
--override with custom colors
vim.cmd [[ highlight Visual guibg=#673ab7 guifg=NONE ctermbg=blue ctermfg=NONE ]] --visual mode select : purple
vim.cmd [[ highlight WinSeparator guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue ]] --window separator : purple
vim.cmd [[ highlight Pmenu guibg=NONE ctermbg=NONE ]]
vim.cmd [[ highlight PmenuSel guibg=#673ab7  ctermbg=NONE]]
--apparently the warnings that's given by lsp are highlighted by vim's diagnostic
vim.cmd [[
	highlight DiagnosticSignWarn guifg=#00ff00 ctermfg=Green
	highlight DiagnosticVirtualTextWarn guifg=#00ff00 ctermfg=Green
	highlight DiagnosticFloatingWarn guifg=#00ff00 ctermfg=Green
	highlight DiagnosticUnderlineWarn guisp=#00ff00 gui=undercurl
]]

--set pumblend=0

--[[
So here's the deal, if I set termguicolors to true(which it started doing by default), nvim takes gui mode instead of cterm mode and sets its own background
setting its own background is a problem because my terminal can become transparent on command and I want everthing inside neovim to take on the terminal's transparent (or not) background (in cterm mode, it took the terminal's background unless specified)

Also treesitter's default colorscheme doesn't highlight shit properly for me(everything is the same color for some reason, (how did it generate that dumbass colorscheme) so I'm using moonfly for the colorscheme which also has the background set

This leads us to setting these colors manually, maybe at some point I'll make my own complete colorscheme at which point i'll not have to install moonfly
--]]
