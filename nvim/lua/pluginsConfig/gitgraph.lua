local gg = require('gitgraph')

keymap('n', '<leader>gg', function()
	gg.draw({}, { all = true, max_count = 5000 })
end, { desc = 'Opens the commits in graph form' })
