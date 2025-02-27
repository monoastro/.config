--Cheat sheet
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Global Options 
--i'm lazy
keymap = vim.keymap.set
--options that i'd like to pass pretty much every single time
opts = {noremap = true, silent = true}

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--The Remaps
--for easier navigation of the panes 
keymap('n', '<c-k>', ':wincmd k<CR>', opts)
keymap('n', '<c-j>', ':wincmd j<CR>', opts)
keymap('n', '<c-h>', ':wincmd h<CR>', opts)
keymap('n', '<c-l>', ':wincmd l<CR>', opts)

--remove the highlight of search easily
keymap('n', '<leader>hl', ':nohlsearch<CR>', opts)

-- I'm using cmake and tmux for this now; so long partner I'll miss ya
--compilation and running of c/c++
--keymap('n', '<leader><leader>m', ':!make -B -j -pipe <cr>', opts)
--keymap('n', '<leader><leader>i', ':!make -B -j -pipe && ./bin/main <cr>', opts)
--keymap('n', '<leader><leader>x', ':!./bin/main<cr>', opts)

--this is tmux specific but tmux doesn't run its shell in the working directory by default
--so until i figure out how to, it's gon stay here
--keymap('n', '<leader>m', ':!tmux-compile-run<cr><cr>')

--resizing windows
keymap('n', '<c-Left>'  , ':vertical resize+3<cr>', opts)
keymap('n', '<c-Right>' , ':vertical resize-3<cr>', opts)
keymap('n', '<c-Up>'    , ':resize+3<cr>', opts)
keymap('n', '<c-Down>'  , ':resize-3<cr>', opts)

--lazy normal mode  
keymap('i', 'jk', '<ESC>')

--yank to the system clipboard
--Copy
keymap('v', '<leader>y'  , '"+y<cr>')
keymap('n', '<leader>y'  , '"+y<cr>')
keymap('n', '<leader>Y'  , '"+yg_<cr>')

--[[
--Paste --eh I can just use <c-s-v>
keymap('n', '<leader>p' , '"+p<cr>')
keymap('n', '<leader>P' , '"+P<cr>')
keymap('v', '<leader>p' , '"+p<cr>')
keymap('v', '<leader>P' , '"+P<cr>')
--]]

--instead of the above let's use this
keymap('x', '<leader>p', [["_dP]])

--move blocks of code
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

--make cursor stationary when doing J, doing up and down jumps
keymap("n", "J", "mzJ`z")
keymap('n', '<C-d>', "<C-d>zz")
keymap('n', '<C-u>', "<C-u>zz")

--navigate word by word
keymap('n', '<S-l>', 'w')
keymap('n', '<S-h>', 'b')

--keep search terms in the middle provided there's enough strings up and down
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

--replace all instances of the word the cursor is on
keymap('n', 'R', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap('v', 'R', [[y:%s/\V<C-r>=escape(@", '/\')<CR>/<C-r>=escape(@", '/\')<CR>/gI<Left><Left><Left>]])

--splitting the windows
keymap('n', '<leader>wv', ':vsplit<cr> :wincmd l<CR>', opts)
keymap('n', '<leader>wh', ':split<cr> :wincmd j<CR>', opts)

--[[
reformat
fn {
}
with
fn
{
}
--]]
keymap('n', '<leader>rf', [[ :%s/^\(\s*\).*\zs{\s*$/\r\1{/<cr>:nohlsearch<cr>]], opts)
-- keymap('n', "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
-- keymap('v', "<leader>/", "gc", { desc = "Toggle Comment", remap = true })
