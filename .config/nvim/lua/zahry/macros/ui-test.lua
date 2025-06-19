vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.ts',
  callback = function()
    vim.fn.setreg(
      'r',
      [[iawait retrySection(async () => {

}, {message: ''})ki]]
    )
  end,
})
