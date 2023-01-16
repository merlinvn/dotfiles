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


vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "Tree find file" })
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Tree focus" })
vim.keymap.set("n", "<C-t>", ":NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Tree toggle" })
