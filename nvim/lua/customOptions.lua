--numbering the lines, don't really prefer it but hey it makes it easier to jump to a line of code
vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.wrap = true

--no backups results in those pesky startup messages about swapfiles
vim.opt.swapfile = false
vim.opt.backup = false

--gives undo tree access to long running undos
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--remove the grey column bastard 
--vim.opt.signcolumn = no
--or replace it with the non existent number column so that even if some plugin likes to torture me by
--enabling the signcolumn it'll just be replaced by the non-existent number line
vim.opt.signcolumn = 'number'

--set the width made by tab to be 4 spaces worth and change the indentation amount to be the same 
vim.opt.tabstop=4
vim.opt.shiftwidth=4

--just a cool quality of life thing
vim.opt.incsearch = true

--never have less than 6 lines displayed when going up; meh don't really prefer it
--vim.opt.scrolloff = 6

--fast update time
vim.opt.updatetime = 50
