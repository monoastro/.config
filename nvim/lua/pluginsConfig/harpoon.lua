local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>ha", mark.add_file)
keymap("n", "<leader>ht", ui.toggle_quick_menu)


--navigate towards the previous mark
keymap('n', '<c-[>', function() ui.nav_prev() end)
-- navigates to next mark
keymap('n', '<c-]>', function() ui.nav_next() end)

