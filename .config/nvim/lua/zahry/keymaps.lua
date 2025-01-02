-- [[ Basic Keymaps ]]
-- AUTOCOMPLETE BRACKETS AND QUOTES
--  See `:help vim.keymap.set()`
-- local brackets = {
--   ['{'] = '}',
--   ['('] = ')',
--   ['['] = ']',
-- }
--
-- -- Loop through each bracket pair
-- for open, close in pairs(brackets) do
--   -- Autocomplete brackets
--   vim.keymap.set('i', open, open .. close .. '<Left>', { desc = 'Autocomplete brackets and quotes' })
--
--   -- Handle closing bracket
--   vim.keymap.set('i', open .. close, open .. ' ' .. close, { desc = 'Handle autocompleted brackets' })
--
--   -- Handle opening bracket followed by Enter
--   vim.keymap.set('i', open .. '<CR>', open .. '<CR>' .. close .. '<ESC>ko', { desc = 'Autocomplete brackets and quotes with Enter' })
-- end
--
-- vim.keymap.set('i', '"', '""<Left>', { desc = 'Autocomplete brackets and quotes' })

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = ':Ex shortcut' })

vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
