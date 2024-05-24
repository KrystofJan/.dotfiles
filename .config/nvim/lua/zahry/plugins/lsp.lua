require('fidget').setup()
require('neodev').setup()
local lsp_config = require 'lspconfig'

local on_attach = function(_, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end
  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  map('K', vim.lsp.buf.hover, 'Hover Documentation')

  local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = bufnr,
    group = highlight_augroup,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    buffer = bufnr,
    group = highlight_augroup,
    callback = vim.lsp.buf.clear_references,
  })

  if vim.lsp.inlay_hint then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, '[T]oggle Inlay [H]ints')
  end
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp_config.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = { callSnippet = 'Replace' },
    },
  },
}
lsp_config.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    ['rust-analyzer'] = {},
  },
}
