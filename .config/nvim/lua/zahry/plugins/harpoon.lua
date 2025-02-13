
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
{'<leader>a', function() local harpoon = require 'harpoon' harpoon:list():add() end},
{'<C-e>', function() local harpoon = require 'harpoon' harpoon.ui:toggle_quick_menu(harpoon:list()) end},
{'<C-h>', function() local harpoon = require 'harpoon'  harpoon:list():select(1) end},
{'<C-j>', function() local harpoon = require 'harpoon' harpoon:list():select(2) end},
{'<C-k>', function() local harpoon = require 'harpoon' harpoon:list():select(3) end},
{'<C-l>', function() local harpoon = require 'harpoon' harpoon:list():select(4) end},
{'<C-S-P>', function() local harpoon = require 'harpoon' harpoon:list():prev() end},
{'<C-S-N>', function() local harpoon = require 'harpoon' harpoon:list():next() end},

    },

  }
