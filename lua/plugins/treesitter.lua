return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufEnter" },
    dependencies = {
      -- Additional text objects for treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      ---@diagnostic disable: missing-fields
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "gitcommit",
          "gitignore",
          "graphql",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "markdown",
          "prisma",
          "python",
          "scss",
          "sql",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- set to `false` to disable one of the mappings
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
  {
    -- Additional text objects for treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local tsc = require("treesitter-context")

      tsc.setup({
        enable = false,
        max_lines = 1,
        trim_scope = "inner",
      })
    end,
  },
}
