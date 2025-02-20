-- require('fidget').setup()
-- require('neodev').setup()
-- local lsp_config = require 'lspconfig'
--
-- local on_attach = function(_, bufnr)
--   local map = function(keys, func, desc)
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
--   end
--   map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--   map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--   map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--   map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--   map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--   map('K', vim.lsp.buf.hover, 'Hover Documentation')
--   map('L', vim.lsp.buf.signature_help, 'Hover signature_help')
--   vim.keymap.set('i', '<C-l>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'LSP: Hover signature_help' })
--
--   local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--     buffer = bufnr,
--     group = highlight_augroup,
--     callback = vim.lsp.buf.document_highlight,
--   })
--
--   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--     buffer = bufnr,
--     group = highlight_augroup,
--     callback = vim.lsp.buf.clear_references,
--   })
--
--   if vim.lsp.inlay_hint then
--     map('<leader>th', function()
--       vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
--     end, '[T]oggle Inlay [H]ints')
--   end
--   map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
-- end
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- lsp_config.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
--   settings = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--       completion = { callSnippet = 'Replace' },
--     },
--   },
-- }
--
-- lsp_config.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }
--
-- lsp_config.nil_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
-- }
--
-- lsp_config.ts_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
-- }
--

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- [[LSP Config]]
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('L', vim.lsp.buf.signature_help, 'Hover signature_help')
        map('<leader>L', vim.lsp.buf.signature_help, 'Hover signature_help')
        vim.keymap.set('i', '<C-l>', vim.lsp.buf.signature_help, { buffer = event.buf, desc = 'LSP: Hover signature_help' })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        --    See `:help CursorHold` for information about when this is executed
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end

        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event.buf }
      end,
    })

    -- [[ LSP servers ]]
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local servers = {
      clangd = {},
      gopls = {},
      -- csharp_ls = {},
      pyright = {},
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = 'module',
              },
              prefix = 'self',
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },

      -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
      -- tsserver = {},
      ts_ls = {},
      --
      volar = {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      },
      -- vuels = {},

      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    --  other tools, you can run
    --    :Mason
    --  You can press `g?` for help in this menu.
    require('mason').setup()

    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
