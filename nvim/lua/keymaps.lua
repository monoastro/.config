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

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--options that i'd like to pass pretty much every single time
opts = {noremap = true, silent = true}

--The Remaps
--for easier navigation of the panes 
keymap('n', '<c-k>', ':wincmd k<CR>', opts)
keymap('n', '<c-j>', ':wincmd j<CR>', opts)
keymap('n', '<c-h>', ':wincmd h<CR>', opts)
keymap('n', '<c-l>', ':wincmd l<CR>', opts)

--remove the highlight of search easily
keymap('n', '<leader>hl', ':nohlsearch<CR>', opts)

--compilation and running of c/c++ 
keymap('n', '<leader><leader>m', ':!make -B -j -pipe <cr>', opts)
keymap('n', '<leader><leader>i', ':!make -B -j -pipe && ./bin/main <cr>', opts)
keymap('n', '<leader><leader>x', ':!./bin/main<cr>', opts)

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

--instead of the above, I can use the greatest remap ever
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

--replace { with <cr>{
keymap('n', '<leader>xp', [[:%s/\(\s*{\)/\r{/g<CR> :nohlsearch<CR>]])

--splitting the windows
keymap('n', '<leader>wv', ':vsplit<cr> :wincmd l<CR>')
keymap('n', '<leader>wh', ':split<cr> :wincmd j<CR>')

--keymap('n', '<leader>o', '<cmd>silent !tmux neww tmux-new-session<cr>', opts)
--eh adding this to tmux.conf is much better
