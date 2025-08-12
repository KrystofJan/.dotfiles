
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim', -- or whichever you prefer
  },
  config = function()
    vim.keymap.set('n', '<leader>md', function()
      print('toggling md')
      require('render-markdown').toggle()
    end, { desc = '[M]ark[D]own toggle' })
  end
}

