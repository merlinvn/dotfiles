return {
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
}
