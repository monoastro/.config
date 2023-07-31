local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader><leader>a", mark.add_file)
vim.keymap.set("n", "<leader><leader>h", ui.toggle_quick_menu)


--navigate towards the previous mark
keymap('n', '<c-[>', function() ui.nav_prev() end)
-- navigates to next mark
keymap('n', '<c-]>', function() ui.nav_next() end)

