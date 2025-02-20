return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_selection = '<C-Space>',
        clear_suggestion = '<C-Backspace>',
        accept_word = '<C-Enter>',
      },
    }
  end,
}
