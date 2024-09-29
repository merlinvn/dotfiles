return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          mason = false,
        },
        gleam = {
          mason = false,
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
          -- Specify additional command arguments for clangd
          opts.cmd = {
            "clangd",
            "--clang-tidy", -- Enable clang-tidy
            "--all-scopes-completion", -- Enable completion in all scopes
            "--cross-file-rename",
            "--suggest-missing-includes", -- Suggest #include directives for missing headers
            "--header-insertion=iwyu", -- Use Include-What-You-Use style for header insertion
          }
        end,
      },
    },
  },
}
