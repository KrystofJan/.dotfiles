require('oil').setup {
  view_options = {
    show_hidden = true,
  },
}
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = ':Ex shortcut' })
