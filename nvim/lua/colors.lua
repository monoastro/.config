vim.cmd([[colorscheme moonfly]])

--set stuff's background to transparent so it takes on the terminal's transparent background
--foreground is obviously set to purple
--the cterm colors are just in case I use this config on an old laptop/terminal
vim.cmd [[ 
	highlight Normal guibg=NONE ctermbg=NONE
	highlight LineNr guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue
	highlight NormalFloat guibg=NONE ctermbg=NONE ctermfg=blue 
	highlight FloatBorder guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue
]]

--override with custom colors
--visual mode select : purple, window separator : purple
vim.cmd [[ 
	highlight Visual guibg=#673ab7 guifg=NONE ctermbg=blue ctermfg=NONE
	highlight WinSeparator guibg=NONE guifg=#a020f0 ctermbg=NONE ctermfg=blue
	highlight Pmenu guibg=NONE ctermbg=NONE
	highlight PmenuSel guibg=#673ab7  ctermbg=NONE
]]

--lsp diagnostics colors stuff
--apparently the warnings that's given by lsp are highlighted by vim's diagnostic; let's make it yellow for now
vim.cmd [[
	highlight DiagnosticSignWarn guifg=#ffff00 ctermfg=yellow
	highlight DiagnosticVirtualTextWarn guifg=#ffff00 ctermfg=yellow
	highlight DiagnosticFloatingWarn guifg=#ffff00 ctermfg=yellow
	highlight DiagnosticUnderlineWarn guifg=#ffff00 ctermfg=yellow
]]
--set pumblend=0




--vim.opt.termguicolors = false --I will miss this option
--[[
So here's the deal, if I set termguicolors to true(which it started doing by default), nvim takes gui mode instead of cterm mode and sets its own background
setting its own background is a problem because my terminal can become transparent on command and I want everthing inside neovim to take on the terminal's transparent (or not) background (in cterm mode, it took the terminal's background unless specified)

Also treesitter's default colorscheme doesn't highlight shit properly for me(everything is the same color for some reason, (how did it generate that dumbass colorscheme) so I'm using moonfly for the colorscheme which also has the background set

This leads us to setting these colors manually, maybe at some point I'll make my own complete colorscheme at which point i'll not have to install moonfly
--]]
