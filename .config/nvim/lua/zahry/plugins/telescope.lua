require('telescope').setup {
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',

      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        --
        file_ignore_patterns = {
          'node_modules',
          'build',
          'dist',
          'yarn.lock',
        },
        vimgrep_arguments = {
          'rg',
          '--follow', -- Follow symbolic links
          '--hidden', -- Search for hidden files
          '--no-heading', -- Don't group matches by each file
          '--with-filename', -- Print the file path with the matched lines
          '--line-number', -- Show line numbers
          '--column', -- Show column numbers
          '--smart-case', -- Smart case search

          -- Exclude some patterns from search
          '--glob=!**/.git/*',
          '--glob=!**/.idea/*',
          '--glob=!**/.vscode/*',
          '--glob=!**/build/*',
          '--glob=!**/dist/*',
          '--glob=!**/yarn.lock',
          '--glob=!**/package-lock.json',
        },
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
