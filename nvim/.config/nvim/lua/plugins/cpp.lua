return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable mason automatically installing clangd
        clangd = {
          mason = false,
          cmd = {
            "/opt/homebrew/opt/llvm/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
