local gg = require('gitgraph')

gg.setup({
	opts =
	{
		symbols = {
			merge_commit = 'M',
			commit = '*',
		},
		format = {
			timestamp = '%H:%M:%S %d-%m-%Y',
			fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
		},
	}
})

keymap('n', '<leader>gg', function()
	gg.draw({}, { all = true, max_count = 5000 })
end, { desc = 'Opens the commits in graph form' })
