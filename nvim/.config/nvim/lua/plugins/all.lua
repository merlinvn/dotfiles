return {
  -- Theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "gruvbox",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(c)
        c.border = c.blue5
      end,
    },
  },
  {
    "mason.nvim",
    opts = {
      ui = { border = "double" },
    },
  },
  {
    "noice.nvim",
    opts = {
      presets = { lsp_doc_border = true },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {
          "prettier",
        },
        ocaml = {
          "ocamlformat",
        },
        cpp = {
          "clang_format", -- Add clang-format for C++ files
        },
        c = {
          "clang_format", -- Add clang-format for C files
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>vn",
        function()
          require("fzf-lua").git_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>vd",
        function()
          -- check if the folder exists, it could be .dotfiles or dotfiles
          local dotfiles = vim.fn.isdirectory(vim.fn.expand("$HOME/.dotfiles")) == 1 and "$HOME/.dotfiles"
            or "$HOME/.dotfiles"
          require("fzf-lua").git_files({ cwd = dotfiles })
        end,
        desc = "Find Dotfiles",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      require("lspconfig.ui.windows").default_options.border = "double"
      -- Merge servers
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        ocamllsp = {
          mason = false,
        },
        gleam = {
          mason = false,
        },
      })
      -- Merge setup
      opts.setup = vim.tbl_deep_extend("force", opts.setup or {}, {
        clangd = function(_, clangd_opts)
          clangd_opts.mason = false
          clangd_opts.cmd = {
            "/opt/homebrew/opt/llvm/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          }
        end,
        rust_analyzer = function()
          return true
        end,
      })
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        -- Terminal configuration
        win = {
          position = "float",
          backdrop = 60,
          height = 0.8,
          width = 0.8,
          zindex = 50,
          border = "rounded",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        ["<leader>v"] = { group = "vim" },
        ["<leader>d"] = { group = "delete/debug" },
        -- ["<leader>h"] = { name = "+harpoon" },
      },
      win = { border = "rounded" },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       -- disable mason automatically installing clangd
  --       clangd = {
  --         mason = false,
  --         cmd = {
  --           -- "/opt/homebrew/opt/llvm/bin/clangd",
  --           "clangd",
  --           "--background-index",
  --           "--clang-tidy",
  --           "--header-insertion=iwyu",
  --           "--completion-style=detailed",
  --           "--function-arg-placeholders",
  --           "--fallback-style=llvm",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<localleader>", '<cmd>lua require("which-key").show("\\\\")<cr>', ft = "grug-far" },
    },
  },
}
