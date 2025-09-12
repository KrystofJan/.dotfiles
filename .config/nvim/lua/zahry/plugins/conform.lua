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
        feature = true,
        cucumber = true,
        gherkin = true,
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
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      vue = { 'prettierd', 'prettier', stop_after_first = true },
      nix = { 'alejandra' },
      rust = { 'rustfmt' },
      go = { 'gofmt', 'goimports' },
      odin = { "odinfmt" },
      zig = { "zigfmt" },
    },
  },
}
