return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = {
        c = true,
        cpp = true,
        -- feature = true,
        -- cucumber = true,
        -- gherkin = true,
      }

      local ft = vim.bo[bufnr].filetype
      if disable_filetypes[ft] then
        return false -- Skip formatting for these filetypes
      end

      return {
        timeout_ms = 500,
        lsp_format = 'fallback', -- or "always" if you prefer
      }
    end,
    formatters = {
      odinfmt = {
        -- Change where to find the command if it isn't in your path.
        command = "odinfmt",
        args = { "-stdin" },
        stdin = true,
      },
      oxfmt = {
        command = "oxfmt",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
    },
    formatters_by_ft = {
      feature = { "gherkin-formatter" },
      go = { 'gofumpt', 'goimports' },
      javascript = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      json = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      jsonc = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      lua = { 'stylua' },
      nix = { 'alejandra' },
      odin = { "odinfmt" },
      rust = { 'rustfmt' },
      vue = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      xml = { "xmlformat" },
      zig = { "zigfmt" }
    },
  },
}
