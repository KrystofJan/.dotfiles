-- lua/plugins/lsp.lua
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lspconfig = require 'lspconfig'

    -- List of LSP servers and their expected binary names
    local servers = {
      lua_ls = 'lua-language-server',
      pyright = 'pyright-langserver',
      rust_analyzer = 'rust-analyzer',
      tsserver = 'typescript-language-server',
      gopls = 'gopls',
      html = 'html-languageserver',
      cssls = 'vscode-css-language-server',
      jsonls = 'vscode-json-language-server',
    }

      local on_attach = function(client, bufnr)
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
        map('L', vim.lsp.buf.signature_help, 'Hover signature_help')
        map('<leader>L', vim.lsp.buf.signature_help, 'Hover signature_help')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    for lsp, bin in pairs(servers) do
      if vim.fn.executable(bin) == 1 then
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      else
        vim.notify('Skipping LSP: ' .. lsp .. ' (missing binary: ' .. bin .. ')', vim.log.levels.WARN)
      end
    end
  end,
}
