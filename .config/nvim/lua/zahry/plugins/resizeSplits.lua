-- TODO: Turn this into a plugin -> maybe make it a little more readable

local resize_mode = false
local resize_amount = 5

-- Define resize functions
local function resize_left()
  vim.cmd('vertical resize -' .. resize_amount)
end
local function resize_right()
  vim.cmd('vertical resize +' .. resize_amount)
end
local function resize_up()
  vim.cmd('resize +' .. resize_amount)
end
local function resize_down()
  vim.cmd('resize -' .. resize_amount)
end
local function exit_resize_mode()
  resize_mode = false
  vim.cmd 'Hardtime enable'
  print 'Exited Resize Mode'
end

-- Activate resize mode
vim.keymap.set('n', '<leader>r', function()
  resize_mode = true
  vim.cmd 'Hardtime disable'
  print 'Entered Resize Mode (h/l/j/k to resize, q to quit)'
end)

-- Global key listener in normal mode
vim.on_key(function(char)
  if not resize_mode then
    return
  end
  if vim.fn.mode() ~= 'n' then
    return
  end

  if char == 'h' then
    resize_left()
  elseif char == 'l' then
    resize_right()
  elseif char == 'k' then
    resize_up()
  elseif char == 'j' then
    resize_down()
  elseif char == 'q' or char == '<Esc>' then
    exit_resize_mode()
  end
end, vim.api.nvim_create_namespace 'ResizeMode')
