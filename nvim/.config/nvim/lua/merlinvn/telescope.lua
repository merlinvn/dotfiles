require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("fzy_native")
local M = {}

function M.reload_modules()
  -- from ThePrimeagen
  -- Because TJ gave it to me.  Makes me happpy.  Put it next to his other
  -- awesome things.
  local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
  for _, dir in ipairs(lua_dirs) do
    dir = string.gsub(dir, "./lua/", "")
    require("plenary.reload").reload_module(dir)
  end
end

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

local neovim_opts_with_preview, opts_without_preview

neovim_opts_with_preview = {
  prompt_title = "~ dotfiles ~",
  shorten_path = false,
  cwd = "~/.config/nvim",

  layout_strategy = "flex",
  layout_config = {
    width = 0.9,
    height = 0.8,

    horizontal = {
      width = { padding = 0.15 },
    },
    vertical = {
      preview_height = 0.75,
    },
  },

  mappings = {
    i = {
      ["<C-y>"] = false,
    },
  },

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

opts_without_preview = vim.deepcopy(neovim_opts_with_preview)
opts_without_preview.previewer = false

M.edit_dotfiles = function()
  local opts = vim.deepcopy(opts_without_preview)
  local m = {
    prompt_title = "< My dotfiles >",
    cwd = dotfiles_path,
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  }

  for k, v in pairs(m) do opts[k] = v end

  require("telescope.builtin").find_files(opts)
end


M.edit_neovim = function()
  local opts = vim.deepcopy(opts_without_preview)
  local m = {
    prompt_title = "< Neovim Configurations >",
    cwd = "~/.config/nvim",
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  }
  for k, v in pairs(m) do opts[k] = v end
  require("telescope.builtin").find_files(opts)
end

function M.grep_string(opts)
  require("telescope.builtin").grep_string(opts)
end

function M.word_under_cursor()
  local sorters = require "telescope.sorters"
  M.grep_string(
    { short_path = true,
      word_match = '-w',
      only_sort_text = true,
      layout_strategy = 'vertical',
      sorter = sorters.get_fzy_sorter()
    })
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Global search: "
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

-- find all files but respect the .gitignore
function M.fd()
  local opts = {
    hidden = true,
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    layout_config = {
      -- height = 9
    },
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  }
  require("telescope.builtin").fd(opts)
end

-- use git_files as source, if not in git folder use the normal fd
M.project_files = function()
  local opts = {
    -- find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" }
  } -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then
    M.fd()
  end
end

-- all hidden files include ignored files but not include the .git folder
function M.search_all_files()
  require("telescope.builtin").find_files {
    hidden = true,
    find_command = { "rg", "--no-ignore", "--files", "-g", "!.git/" }
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
  local opts = themes.get_ivy {
    shorten_path = false,
    border = true,
    layout_config = {
      height = 9,
    },
    previewer = false
  }
  require("telescope.builtin").buffers(opts)
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

function M.vim_options()
  require("telescope.builtin").vim_options {
    layout_config = {
      width = 0.5
    },
    sorting_strategy = "ascending"
  }
end

return M
