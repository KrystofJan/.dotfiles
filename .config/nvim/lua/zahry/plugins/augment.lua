return {
  'augmentcode/augment.vim',
  config = function()
    vim.g.augment_workspace_folders = { '~/work/corellium/ui-test', '~/work/corellium/frontend', '~/.dotfiles' }
    vim.g.augment_disable_completions = true
    vim.keymap.set('n', '<leader>hn', '<cmd>:Augment chat-new<CR>')
    vim.keymap.set('n', '<leader>hn', '<cmd>:Augment chat-new<CR>')
    vim.keymap.set('n', '<leader>ht', '<cmd>:Augment chat-toggle<CR>')

    vim.keymap.set('v', '<leader>hn', '<cmd>:Augment chat-new<CR>')
    vim.keymap.set('v', '<leader>hn', '<cmd>:Augment chat-new<CR>')
    vim.keymap.set('v', '<leader>ht', '<cmd>:Augment chat-toggle<CR>')
  end,
}
