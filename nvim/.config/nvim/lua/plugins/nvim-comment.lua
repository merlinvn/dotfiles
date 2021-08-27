require('nvim_comment').setup({
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "<leader>cc",
    -- Visual/Operator mapping left hand side
    operator_mapping = "<leader>c,"
})

-- Assumes this is being run in the context of the filetype...
-- vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
