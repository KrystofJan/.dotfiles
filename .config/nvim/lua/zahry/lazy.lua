local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'zahry.plugins.colorschemes',
  require 'zahry.plugins.comments',
  require 'zahry.plugins.todo-comments',
  require 'zahry.plugins.lsp',
  require 'zahry.plugins.telescope',
  require 'zahry.plugins.lualine',
  require 'zahry.plugins.mini',
  require 'zahry.plugins.cmp',
  require 'zahry.plugins.gitsigns',
  require 'zahry.plugins.lazygit',
  require 'zahry.plugins.whichkey',
  require 'zahry.plugins.autopairs',
  require 'zahry.plugins.harpoon',
  require 'zahry.plugins.oil',
  require 'zahry.plugins.conform',
  require 'zahry.plugins.tree-sitter',
  require 'zahry.plugins.undotree',
  require 'zahry.plugins.vimtex',
  require 'zahry.plugins.debug',
  require 'zahry.plugins.augment',

  -- require 'zahry.plugins.supermaven',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns',
  -- { import = 'custom.plugins' },
}, {
  lockfile = vim.fn.stdpath 'data' .. '/lazy-lock.json',
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
