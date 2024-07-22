require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = {
      insert = {
        a = { fg = '#926ee4', bg = 'none' }, --purple
        b = { fg = '#926ee4', bg = 'none' },
        c = { fg = '#926ee4', bg = 'none' },
      },
      normal = {
        a = { fg = '#00ff00', bg = 'none' }, --green
        b = { fg = '#00ff00', bg = 'none' },
        c = { fg = '#00ff00', bg = 'none' },
      },
      visual = {
        a = { fg = '#0000ff', bg = 'none' }, --blue
        b = { fg = '#0000ff', bg = 'none' },
        c = { fg = '#0000ff', bg = 'none' },
      },
      command = {
        a = { fg = '#926ee4', bg = 'none' }, 
        b = { fg = '#926ee4', bg = 'none' },
        c = { fg = '#926ee4', bg = 'none' },
      },
      replace = {
        a = { fg = '#ff0000', bg = 'none' },
        b = { fg = '#ff0000', bg = 'none' },
        c = { fg = '#ff0000', bg = 'none' },
      },
      inactive = {
        a = { fg = '#808080', bg = 'none' },
        b = { fg = '#808080', bg = 'none' },
        c = { fg = '#808080', bg = 'none' },
      },
    },
  },
  sections = {
    lualine_a = { { 'filename', path = 1 } }
  }
}

