local M = {}

M.ui_opts = {
  expand_lines = true,

  icons = {
    expanded = "",
    collapsed = "",
    circular = "",
  },

  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },

  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.50 },
        { id = "console", size = 0.50 },
      },
      size = 0.25,
      position = "bottom",
    },
  },

  floating = {
    max_height = 0.9,
    max_width = 0.5,
    border = vim.g.border_chars,
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}

M.virtual_text_opts = {
  enabled = true,
  enabled_commands = false,
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  commented = false,
  show_stop_reason = true,
  virt_text_pos = "eol",
  all_frames = false,
}
return M
