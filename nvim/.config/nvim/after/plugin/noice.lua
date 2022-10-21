local status, noice = pcall(require, "noice")
if (not status) then return end
noice.setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    -- view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    view_search = "cmdline_popup_search", -- view for rendering the cmdline for search
    opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    icons = {
      ["/"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
      ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
      [":"] = { icon = "", hl_group = "NoiceCmdlineIcon", firstc = false },
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "split", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "nui", -- backend to use to show regular cmdline completions
  },
  lsp_progress = {
    enabled = true,
    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
    -- See the section on formatting for more details on how to customize.
    --- @type NoiceFormat|string
    format = "lsp_progress",
    --- @type NoiceFormat|string
    format_done = "lsp_progress_done",
    throttle = 1000 / 30, -- frequency to update lsp progress message
    view = "mini",
  },
  routes = {
    {
      view = "popup",
      filter = { event = "msg_show", min_height = 20 },
    },
  },
})
