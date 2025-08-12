local repo_utils = require('zahry.utils.repo')

-- Setup the repository utility with ui-test configuration
repo_utils.setup({
  repo_name = 'ui-test'
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.ts',
  callback = function()
    if not repo_utils.is_in_repo() then
      return
    end
    vim.fn.setreg(
      'r',
      [[iawait retrySection(async () => {

}, {message: ''})ki]]
    )
  end,
})
