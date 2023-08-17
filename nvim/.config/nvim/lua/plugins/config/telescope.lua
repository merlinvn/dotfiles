local M = {}

M.opts = function()
  local actions = require("telescope.actions")
  if not require("merlinvn.util").has("flash.nvim") then
    return
  end
  local function flash(prompt_bufnr)
    require("flash").jump({
      pattern = "^",
      label = { after = { 0, 0 } },
      search = {
        mode = "search",
        exclude = {
          function(win)
            return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
              ~= "TelescopeResults"
          end,
        },
      },
      action = function(match)
        local picker =
          require("telescope.actions.state").get_current_picker(prompt_bufnr)
        picker:set_selection(match.pos[1] - 1)
      end,
    })
  end
  return {
    defaults = {
      -- file_sorter = require "telescope.sorters".get_fuzzy_file(),
      generic_sorter = require("mini.fuzzy").get_telescope_sorter,
      prompt_prefix = " > ",
      color_devicons = true,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- mappings = {i = {["<C-x>"] = false, ["<C-q>"] = actions.send_to_qflist}},
      mappings = {
        i = {
          ["<C-q>"] = actions.send_to_qflist,
          ["<C-s>"] = flash,
          -- ["<c-t>"] = trouble.open_with_trouble
        },
        n = {
          s = flash,
          -- ["<c-t>"] = trouble.open_with_trouble
        },
      },
      set_env = { ["COLORTERM"] = "truecolor" },
      -- file_ignore_patterns = { "ext/.*" } -- comment this line for non C++ project
    },
    pickers = {},
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          -- even more opts
        }),
      },
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          ["i"] = {
            -- your custom insert mode mappings
          },
          ["n"] = {
            -- your custom normal mode mappings
          },
        },
      },
    },
  }
end

M.config = function()
  if require("telescope") == nil then
    return
  end
  require("telescope").setup(M.opts())
  require("telescope").load_extension("ui-select")
  require("telescope").load_extension("file_browser")
end

M.keys = function()
  local status = pcall(require, "telescope")
  if not status then
    return
  end
  local search_prefix = "<leader>s"
  local find_prefix = "<leader>f"
  local telescopeHelper = require("merlinvn.telescope")

  return {
    -- search in command
    {
      mode = "c",
      "<c-r><c-r>",
      "<Plug>(TelescopeFuzzyCommandSearch)",
      noremap = false,
      nowait = true,
    },
    {
      "<leader>p",
      telescopeHelper.find_files,
      desc = "Files / Project files",
    },
    {
      "<leader>:",
      "<cmd>Telescope command_history<cr>",
      desc = "Commands History",
    },
    {
      "<leader><space>",
      "<cmd>Telescope buffers show_all_buffers=true<cr>",
      desc = "Find Buffer",
    },
    {
      "<leader>/",
      telescopeHelper.curbuf,
      desc = "Live Grep",
    },

    {
      search_prefix .. "a",
      "<cmd>Telescope autocommands<cr>",
      desc = "Auto Commands",
    },
    {
      search_prefix .. "b",
      telescopeHelper.curbuf,
      desc = "Search current buffer",
    },
    {
      search_prefix .. "C",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
    },
    {
      search_prefix .. "c",
      "<cmd>Telescope command_history<cr>",
      desc = "Commands History",
    },
    {
      search_prefix .. "d",
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      desc = "Document diagnostics",
    },
    {
      search_prefix .. "D",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Workspace diagnostics",
    },
    {
      search_prefix .. "e",
      "<cmd>Telescope symbols<cr>",
      desc = "Emojis",
    },
    {
      search_prefix .. "g",
      telescopeHelper.multi_rg,
      desc = "Live Grep",
    },
    {
      search_prefix .. "h",
      telescopeHelper.help_tags,
      desc = "Help tags",
    },
    {
      search_prefix .. "k",
      require("telescope.builtin").keymaps,
      desc = "Keymaps",
    },
    { search_prefix .. "k", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { search_prefix .. "m", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    {
      search_prefix .. "M",
      "<cmd>Telescope man_pages<cr>",
      desc = "Man Pages",
    },
    {
      search_prefix .. "o",
      telescopeHelper.vim_options,
      desc = "Vim Options",
    },
    {
      search_prefix .. '"',
      "<cmd>lua require('telescope.builtin').registers()<cr>",
      desc = "Registers",
    },
    {
      search_prefix .. "T",
      "<cmd>lua require('telescope.builtin').treesitter()<CR>",
      desc = "Treesitter",
    },
    {
      search_prefix .. "t",
      "<cmd>Telescope<cr>",
      desc = "Telescope",
    },
    {
      search_prefix .. "s",
      "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
      desc = "Document symbols",
    },
    {
      search_prefix .. "S",
      "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
      desc = "Workspace symbols",
    },
    {
      search_prefix .. "w",
      telescopeHelper.word_under_cursor,
      desc = "Searchword under cursor",
    },
    {
      search_prefix .. "?",
      "<cmd>Telescope search_history<cr>",
      desc = "Search history",
    },

    -- FIND
    {
      find_prefix .. "a",
      telescopeHelper.search_all_files,
      desc = "All files",
    },
    {
      find_prefix .. "b",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
    },
    {
      find_prefix .. "e",
      telescopeHelper.file_browser,
      desc = "File browser",
    },
    {
      find_prefix .. "p",
      telescopeHelper.find_files,
      desc = "Files / Project files",
    },
    {
      find_prefix .. "o",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Old files",
    },
    {
      find_prefix .. "t",
      telescopeHelper.search_only_certain_files,
      desc = "Search by file type",
    },
    {
      "<Leader>vd",
      telescopeHelper.edit_dotfiles,
      desc = "Dotfiles",
    },
    {
      "<Leader>vn",
      telescopeHelper.edit_neovim,
      desc = "Neovim config",
    },
  }
end

return M
