-- Function to toggle the Lazy.nvim window which currently doesn't work
function toggle_lazy()
  local bufname = 'Lazy'
  local win = vim.fn.win_findbuf(vim.fn.bufnr(bufname))

  if #win > 0 then
    vim.api.nvim_win_close(win[1], true)
  else
    vim.cmd [[ Lazy ]]
  end
end


keymap('n', '<leader>l', ':Lazy<cr>')
