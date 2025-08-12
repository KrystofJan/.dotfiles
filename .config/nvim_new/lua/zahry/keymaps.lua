vim.opt.hlsearch = true

local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>pv', vim.cmd.Ex, { desc = ':Ex shortcut' })

map('n', '<leader>x', ':.lua<CR>')
map('v', '<leader>x', ':lua<CR>')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<leader>cp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
  print('Copied: ' .. vim.fn.expand '%:p')
end, { desc = 'Copy file path to clipboard' })

map('n', '<leader>lr', function restartLsp()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ 
     bufnr = bufnr, 
   }) 
  for _, client in ipairs(clients) do
    if client and client.name then
      vim.lsp.enable(client.name, false)
      vim.lsp.enable(client.name, true)
      print(client.name .. ' was restarted')
    end
  end
end
 , { desc = 'Go to previous [D]iagnostic message' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

