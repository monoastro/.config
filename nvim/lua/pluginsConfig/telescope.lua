local builtin = require('telescope.builtin')
keymap('n', '<leader>pf', builtin.find_files, {})
keymap('n', '<leader>gf', builtin.git_files, {})
keymap('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

--some extra features
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
