local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    file_sorter = require "telescope.sorters".get_fuzzy_sorter,
    prompt_prefix = " > ",
    color_devicons = true,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}},
    mappings = { i = { ["<C-q>"] = actions.send_to_qflist } },
    set_env = { ["COLORTERM"] = "truecolor" }
    -- file_ignore_patterns = { "ext/.*" } -- comment this line for non C++ project
  },
  pickers = {
    find_files = {
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
        }
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("fzy_native")
local M = {}

local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local dotfiles_path = "$HOME/dotfiles/"

if vim.fn.has("win32") == 1 then
  dotfiles_path = "~/.config"
end

M.edit_dotfiles = function()
  require("telescope.builtin").find_files(
    {
      prompt_title = "< My dotfiles >",
      cwd = dotfiles_path,
      find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
    }
  )
end

M.project_files = function()
  local opts = {
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  } -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then
    require "telescope.builtin".find_files(opts)
  end
end

M.edit_neovim = function()
  local opts_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    -- layout_config = {
    --   width = 0.9,
    --   height = 0.8,

    --   horizontal = {
    --     width = { padding = 0.15 },
    --   },
    --   vertical = {
    --     preview_height = 0.75,
    --   },
    -- },

    -- mappings = {
    --   i = {
    --     ["<C-y>"] = false,
    --   },
    -- },

    attach_mappings = function(_, map)
      map("i", "<c-y>", set_prompt_to_entry_value)
      map("i", "<M-c>", function(prompt_bufnr)
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin").find_files(opts_without_preview)
        end)
      end)

      return true
    end,
  }

  opts_without_preview = vim.deepcopy(opts_with_preview)
  opts_without_preview.previewer = false

  require("telescope.builtin").find_files(opts_with_preview)
end

function M.grep_string(opts)
  require("telescope.builtin").grep_string(opts)
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Grep String > "
  }
end

function M.grep_last_search(opts)
  opts = opts or {}

  -- \<getreg\>\C
  -- -> Subs out the search things
  local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

  opts.path_display = { "shorten" }
  opts.word_match = "-w"
  opts.search = register

  require("telescope.builtin").grep_string(opts)
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top"
    },
    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)

      local modify_cwd = function(new_cwd)
        local finder = current_picker.finder

        finder.path = new_cwd
        finder.files = true
        current_picker:refresh(false, { reset_prompt = true })
      end

      map(
        "i",
        "-",
        function()
          modify_cwd(current_picker.cwd .. "/..")
        end
      )

      map(
        "i",
        "~",
        function()
          modify_cwd(vim.fn.expand "~")
        end
      )

      -- local modify_depth = function(mod)
      --   return function()
      --     opts.depth = opts.depth + mod
      --
      --     current_picker:refresh(false, { reset_prompt = true })
      --   end
      -- end
      --
      -- map("i", "<M-=>", modify_depth(1))
      -- map("i", "<M-+>", modify_depth(-1))

      map(
        "n",
        "yy",
        function()
          local entry = action_state.get_selected_entry()
          vim.fn.setreg("+", entry.value)
        end
      )

      return true
    end
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.fd()
  -- local opts = themes.get_ivy {
  --   hidden = false,
  --   sorting_strategy = "ascending",
  --   layout_config = { height = 9 },
  -- }
  require("telescope.builtin").fd {
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    layout_config = {}
  }
end

function M.fs()
  local opts =
  themes.get_ivy {
    hidden = false,
    sorting_strategy = "descending"
  }
  require("telescope.builtin").fd(opts)
end

function M.multi_rg()
  require("telescope.builtin").live_grep {
    -- shorten_path = true,
    previewer = false,
    fzf_separator = "|>"
  }
end

function M.oldfiles()
  require("telescope").extensions.frecency.frecency(themes.get_ivy {})
end

function M.search_only_certain_files()
  require("telescope.builtin").find_files {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "Type: "
    }
  }
end

function M.buffers()
  require("telescope.builtin").buffers {
    shorten_path = false
  }
end

function M.curbuf()
  local opts =
  themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.help_tags()
  require("telescope.builtin").help_tags {
    show_version = true
  }
end

function M.search_all_files()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--no-ignore", "--files" }
  }
end

function M.vim_options()
  require("telescope.builtin").vim_options {
    layout_config = {
      width = 0.5
    },
    sorting_strategy = "ascending"
  }
end

return M
