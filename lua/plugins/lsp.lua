return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
      -- Plugin and UI to automatically install LSPs to stdpath
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "WhoIsSethDaniel/mason-tool-installer.nvim",
      -- Integrate blink w/ LSP
      "hrsh7th/cmp-nvim-lsp",

      -- Progress/Status update for LSP
      { "j-hui/fidget.nvim" },
    },
    config = function()
      local map_lsp_keybinds = require("keymaps").map_lsp_keybinds -- Has to load keymaps before pluginslsp

      -- Default LSP handlers with rounded borders
      local default_handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      local ts_ls_inlay_hints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      }

      -- on_attach: call your custom keymap binding function
      local on_attach = function(_client, buffer_number)
        map_lsp_keybinds(buffer_number)
      end

      -- LSP servers to install
      -- (see list: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers)
      local servers = {
        bashls = {},
        clangd = {},
        biome = {},
        cssls = {},
        eslint = {
          autostart = false,
          cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
          settings = { format = false },
        },
        html = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              telemetry = { enabled = false },
            },
          },
        },
        marksman = {},
        nil_ls = {},
        sqlls = {},
        tailwindcss = {
          filetypes = { "typescriptreact", "javascriptreact", "html", "svelte" },
        },
        ts_ls = {
          on_attach = function(client, buffer_number)
            require("twoslash-queries").attach(client, buffer_number)
            return on_attach(client, buffer_number)
          end,
          settings = {
            maxTsServerMemory = 12288,
            typescript = { inlayHints = ts_ls_inlay_hints },
            javascript = { inlayHints = ts_ls_inlay_hints },
          },
        },
        yamlls = {},
        svelte = {},
        rust_analyzer = {
          check = { command = "clippy", features = "all" },
        },
      }

      local formatters = {
        prettierd = {},
        stylua = {},
      }

      local manually_installed_servers = { "rust_analyzer" }
      local mason_tools_to_install = vim.tbl_keys(vim.tbl_deep_extend("force", {}, servers, formatters))
      local ensure_installed = vim.tbl_filter(function(name)
        return not vim.tbl_contains(manually_installed_servers, name)
      end, mason_tools_to_install)

      require("mason-tool-installer").setup({
        auto_update = true,
        run_on_start = true,
        start_delay = 3000,
        debounce_hours = 12,
        ensure_installed = ensure_installed,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- Iterate over our servers and set them up
      -- Setup each LSP server using vim.lsp.config for Neovim 0.11+
      for name, config in pairs(servers) do
        vim.lsp.config(name, {
          cmd = config.cmd,
          capabilities = capabilities,
          filetypes = config.filetypes,
          handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
          settings = config.settings,
          root_dir = config.root_dir,
        })

        -- Set up on_attach via LspAttach autocmd
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == name then
              on_attach(client, args.buf)
            end
          end,
        })

        -- Enable the server
        if config.autostart ~= false then
          vim.lsp.enable(name)
        end
      end

      -- Setup Mason for managing external LSP servers
      require("mason").setup({ ui = { border = "rounded" } })
      require("mason-lspconfig").setup()

      -- Configure borders for LspInfo UI and diagnostics
      require("lspconfig.ui.windows").default_options.border = "rounded"
      vim.diagnostic.config({ float = { border = "rounded" } })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = false,
      default_format_opts = {
        async = true,
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      format_after_save = {
        async = true,
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "prettierd", "prettier " },
        lua = { "stylua" },
      },
    },
  },
}
