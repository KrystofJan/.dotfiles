return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'gherkin', -- Only this one needed for .feature support
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true

    -- ✅ Register Gherkin parser from binhtran432k repo
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.gherkin = {
      install_info = {
        url = 'https://github.com/binhtran432k/tree-sitter-gherkin', -- <== new repo
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'feature',
    }

    require('nvim-treesitter.configs').setup(opts)
  end,
}
