return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  dependencies = {
    "saghen/blink.cmp"
  },
  config = function()
    vim.keymap.set('n', '<leader>md', function()
      print('toggling md')
      vim.cmd.Markview('Toggle')
    end, { desc = '[M]ark[D]own toggle' })
  end
};
