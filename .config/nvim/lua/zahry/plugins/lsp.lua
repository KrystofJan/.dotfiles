return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- List of LSP servers and their expected binary names.
    -- kotlin_language_server is configured separately below with Android classpath.
    local servers = {
      lua_ls = 'lua-language-server',
      pyright = 'pyright-langserver',
      rust_analyzer = 'rust-analyzer',
      ts_ls = 'typescript-language-server',
      gopls = 'gopls',
      html = 'html-languageserver',
      cssls = 'vscode-css-language-server',
      jsonls = 'vscode-json-language-server',
      bashls = 'bash-language-server',
      ols = 'ols',
      nixd = 'nixd',
      zls = 'zls',
      tailwindcss = 'tailwindcss-language-server',
      terraformls = 'terraform-ls',
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

    local missing_lsps = {}
    for lsp, bin in pairs(servers) do
      if vim.fn.executable(bin) == 1 then
        -- Configure the LSP with custom settings
        vim.lsp.config(lsp, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        -- Enable the LSP to auto-activate
        vim.lsp.enable(lsp)
      else
        table.insert(missing_lsps, lsp)
      end
    end

    if #missing_lsps > 0 then
      print('Skipping these LSPs due to not being able to find binary: ' .. table.concat(missing_lsps, ', '))
    end

    -- Kotlin: override the generic setup with Android SDK classpath so that
    -- android.* / androidx.* references resolve correctly.
    if vim.fn.executable('kotlin-language-server') == 1 then
      local android_sdk = vim.fn.getenv('ANDROID_SDK_ROOT')
      local extra_classpath = {}
      if android_sdk ~= nil and android_sdk ~= vim.NIL and android_sdk ~= '' then
        -- API 32 matches the project's compileSdk
        table.insert(extra_classpath, android_sdk .. '/platforms/android-32/android.jar')
      end
      vim.lsp.config('kotlin_language_server', {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          kotlin = {
            compiler = {
              jvm = {
                target = '1.8',
              },
            },
            externalSources = { useKlsScheme = true },
          },
        },
        init_options = {
          storagePath = vim.fn.stdpath('cache') .. '/kotlin-language-server',
          classpath = table.concat(extra_classpath, ':'),
        },
      })
      vim.lsp.enable('kotlin_language_server')
    end
  end,
}

