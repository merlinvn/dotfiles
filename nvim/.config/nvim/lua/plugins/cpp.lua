return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable mason automatically installing clangd
        clangd = {
          mason = false,
        },
      },
    },
  },
}
