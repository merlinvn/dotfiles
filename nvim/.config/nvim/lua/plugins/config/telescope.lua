local M = {}

M.opts = function()
  local actions = require("telescope.actions")
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
          -- ["<c-t>"] = trouble.open_with_trouble
        },
        n = {
          -- ["<c-t>"] = trouble.open_with_trouble
        },
      },
      set_env = { ["COLORTERM"] = "truecolor" },
      -- file_ignore_patterns = { "ext/.*" } -- comment this line for non C++ project
    },
    pickers = {
      -- find_files = {
      --   mappings = {
      --     n = {
      --       ["cd"] = function(prompt_bufnr)
      --         local selection = require("telescope.actions.state").get_selected_entry()
      --         local dir = vim.fn.fnamemodify(selection.path, ":p:h")
      --         require("telescope.actions").close(prompt_bufnr)
      --         -- Depending on what you want put `cd`, `lcd`, `tcd`
      --         vim.cmd(string.format("silent lcd %s", dir))
      --       end
      --     }
      --   }
      -- }
    },
    extensions = {
      -- fzf = {
      --   fuzzy = true,
      --   override_generic_sorter = true,
      --   override_file_sorter = true,
      --   case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      --   -- the default case_mode is "smart_case"
      -- },
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
    -- top level search
    {
      "<leader>p",
      telescopeHelper.find_files(),
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
      "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>",
      desc = "Live Grep",
    },

    -- SEARCH
    {
      search_prefix .. "a",
      "<cmd>Telescope autocommands<cr>",
      desc = "Auto Commands",
    },
    {
      search_prefix .. "b",
      "<cmd>lua require('merlinvn.telescope').curbuf()<cr>",
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
      "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>",
      desc = "Live Grep",
    },
    {
      search_prefix .. "h",
      "<cmd>lua require('merlinvn.telescope').help_tags()<cr>",
      desc = "Help tags",
    },
    {
      search_prefix .. "k",
      "<cmd>lua require('telescope.builtin').keymaps()<cr>",
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
      "<cmd>lua require('merlinvn.telescope').vim_options()<cr>",
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
      { desc = "Treesitter" },
    },
    {
      search_prefix .. "t",
      "<cmd>Telescope<cr>",
      desc = "Telescope",
    },
    {
      search_prefix .. "s",
      "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
      "Document symbols",
    },
    {
      search_prefix .. "S",
      "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
      "Workspace symbols",
    },
    {
      search_prefix .. "w",
      "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
      desc = "Search word under cursor",
    },
    {
      search_prefix .. "?",
      "<cmd>Telescope search_history<cr>",
      desc = "Search history",
    },

    -- FIND
    {
      find_prefix .. "a",
      "<cmd>lua require('merlinvn.telescope').search_all_files()<cr>",
      desc = "All files",
    },
    {
      find_prefix .. "b",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers",
    },
    {
      find_prefix .. "d",
      "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>",
      desc = "Dotfiles",
    },
    {
      find_prefix .. "e",
      "<cmd>lua require('merlinvn.telescope').file_browser()<cr>",
      desc = "File browser",
    },
    {
      find_prefix .. "f",
      telescopeHelper.find_files(),
      desc = "Files / Project files",
    },
    {
      find_prefix .. "n",
      "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>",
      desc = "Neovim config",
    },
    {
      find_prefix .. "o",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Old files",
    },
    {
      find_prefix .. "t",
      "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
      desc = "Search by file type",
    },
  }
end

return M
