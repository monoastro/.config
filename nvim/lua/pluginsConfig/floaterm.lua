--open terminal(s) in the window
keymap('n', '<s-t>', ':FloatermNew --height=0.35 --wintype=normal --name=capybara --position=bottom <cr>', opts)
keymap('n', '<leader>tl', ':FloatermNew! --width=0.5 --wintype=vsplit --name=capybara --position=left <cr>', opts)
keymap('n', '<leader>tr', ':FloatermNew! --width=0.49 --wintype=vsplit --name=capybara --position=right <cr>', opts)

--play video
keymap('n', '<leader>ty', ':FloatermNew! --height=0.1 --wintype=normal --name=video --position=bottom playURL && exit<cr>', opts)
--keymap('n', '<leader>ty',':!playURL' )

-- vim.fn.input("Enter video URL: ")
