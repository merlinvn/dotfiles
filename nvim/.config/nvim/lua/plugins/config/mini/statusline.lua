local M = {}

M.config = function()
  local MiniStatusline = require("mini.statusline")

  local active_status = function()
    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
    -- local git = MiniStatusline.section_git({ trunc_width = 75 })
    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
    -- local filename = MiniStatusline.section_filename({ trunc_width = 140 })
    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
    local location = MiniStatusline.section_location({ trunc_width = 75 })

    local filename = function()
      if vim.bo.buftype == "terminal" then
        return "%t"
      else
        return vim.fn.pathshorten(vim.fn.expand("%:p:~:."), 3) .. "%m"
      end
    end

    -- local navigator = ""
    -- if
    --   package.loaded["nvim-navic"] and require("nvim-navic").is_available()
    -- then
    --   navigator = require("nvim-navic").get_location()
    -- end

    return MiniStatusline.combine_groups({
      { hl = mode_hl, strings = { mode } },
      { hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
      "%<", -- Mark general truncate point
      {
        hl = "MiniStatuslineFilename",
        strings = { filename() },
      },
      "%=", -- End left alignment
      { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
      { hl = mode_hl, strings = { location } },
    })
  end

  MiniStatusline.setup({
    -- Content of statusline as functions which return statusline string. See
    -- `:h statusline` and code of default contents (used instead of `nil`).
    content = {
      -- Content for active window
      active = active_status,
      -- Content for inactive window(s)
      inactive = nil,
    },
    -- Whether to use icons by default
    use_icons = true,
    -- Whether to set Vim's settings for statusline (make it always shown with
    -- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
    -- this to `false` and 'laststatus' to 3.
    set_vim_settings = true,
  })
end

return M
