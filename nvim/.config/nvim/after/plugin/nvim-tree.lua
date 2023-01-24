require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})


vim.keymap.set("n", "<leader>ne", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Tree find file" })
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Tree toggle" })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Tree focus" })
