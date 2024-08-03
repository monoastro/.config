local snipe = require("snipe")
snipe.setup()
vim.keymap.set("n", "gb", snipe.toggle_buffer_menu())
