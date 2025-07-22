local repo_utils = require('zahry.utils.repo')

-- Setup the repository utility with ui-test configuration
repo_utils.setup({
  repo_name = 'ui-test'
})

-- Function to set marks for ui-test files
local function set_ui_test_marks()
  if not repo_utils.is_in_repo() then
    return
  end

  local marks = {
    { file = repo_utils.get_repo_path() .. '/test/steps/when.ts',  mark = 'W' },
    { file = repo_utils.get_repo_path() .. '/test/steps/then.ts',  mark = 'T' },
    { file = repo_utils.get_repo_path() .. '/test/steps/given.ts', mark = 'G' },
  }

  for _, mark_info in ipairs(marks) do
    if vim.fn.filereadable(mark_info.file) == 1 then
      local lines = vim.fn.readfile(mark_info.file)
      local line_count = #lines
      local bufnr = vim.fn.bufnr(mark_info.file, true) -- true creates buffer if it doesn't exist
      vim.fn.setpos("'" .. mark_info.mark, { bufnr, line_count, 1, 0 })
    end
  end
end

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

vim.api.nvim_create_autocmd({ 'VimEnter', 'DirChanged' }, {
  callback = function()
    set_ui_test_marks()
    print('loaded marks')
  end,
})
