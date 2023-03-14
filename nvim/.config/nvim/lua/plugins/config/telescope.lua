local M = {}
M.config = function()
  if require("telescope") == nil then
    return
  end
  require("telescope").setup(M.opts)
  require("telescope").load_extension("ui-select")
  require("telescope").load_extension("file_browser")
end

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

M.keys = function()
  if require("telescope") == nil then
    return
  end
  local telescope_prefix = "<leader>t"
  local MyTelescope = require("merlinvn.telescope")

  return {
    {
      mode = "c",
      "<c-r><c-r>",
      "<Plug>(TelescopeFuzzyCommandSearch)",
      noremap = false,
      nowait = true,
    },
    -- vim.keymap.set("n", "<leader><space>", require('merlinvn.telescope').buffers,  { desc = "Current buffers" })
    {
      "<leader><space>",
      "<cmd>Telescope buffers show_all_buffers=true<cr>",
      desc = "Switch Buffer",
    },

    -- FILES
    {
      "<leader>e",
      MyTelescope.find_files(),
      desc = "Files / Project files",
    },

    {
      telescope_prefix .. "f",
      MyTelescope.find_files(),
      desc = "Files / Project files",
    },
    {
      telescope_prefix .. "/",
      MyTelescope.grep_prompt,
      desc = "Global search cwd",
    },
    { "t", "<cmd>Telescope<cr>" },
    {
      telescope_prefix .. "b",
      "<cmd>Telescope buffers show_all_buffers=true<cr>",
      desc = "[B]uffers",
    },
    {
      telescope_prefix .. "o",
      "<cmd>Telescope oldfiles<cr>",
      desc = "[O]ld files",
    },
    {
      telescope_prefix .. "g",
      "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>",
      desc = "Live [G]rep",
    },
    {
      telescope_prefix .. "a",
      "<cmd>lua require('merlinvn.telescope').search_all_files()<cr>",
      desc = "[A]ll files",
    },
    {
      telescope_prefix .. "e",
      "<cmd>lua require('merlinvn.telescope').file_browser()<cr>",
      desc = "Fil[e] browser",
    },
    {
      telescope_prefix .. "z",
      "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
      desc = "Search by file type",
    },
    {
      telescope_prefix .. "y",
      "<cmd>Telescope symbols<cr>",
      desc = "[O]ld files",
    },
    -- SEARCH
    {
      "<leader>/",
      "<cmd>lua require('merlinvn.telescope').curbuf()<cr>",
      desc = "Search current buffer",
    },
    -- search word under cursor
    {
      telescope_prefix .. "w",
      "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
      desc = "Search word under cursor",
    },

    -- VIM
    {
      telescope_prefix .. "r",
      "<cmd>lua require('telescope.builtin').registers()<cr>",
      desc = "[R]egisters",
    },
    {

      telescope_prefix .. "c",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
    },
    {
      telescope_prefix .. "h",
      "<cmd>lua require('merlinvn.telescope').help_tags()<cr>",
      desc = "[H]elp tags",
    },
    {
      telescope_prefix .. "k",
      "<cmd>lua require('telescope.builtin').keymaps()<cr>",
      desc = "[K]eymaps",
    },
    {
      telescope_prefix .. "O",
      "<cmd>lua require('merlinvn.telescope').vim_options()<cr>",
      desc = "Vim Options",
    },
    -- {"m", "<cmd>Telescope marks<cr>", { desc = "Marks" })
    {
      telescope_prefix .. ";",
      "<cmd>Telescope command_history<cr>",
      desc = "Command history",
    },
    {
      telescope_prefix .. "?",
      "<cmd>Telescope search_history<cr>",
      desc = "Search history",
    },

    {
      telescope_prefix .. "d",
      "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>",
      desc = "Dotfiles",
    },
    {
      telescope_prefix .. "n",
      "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>",
      desc = "Neovim config",
    },

    -- search word from input

    -- nnoremap ("gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    -- nnoremap ("<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    --
    -- " nnoremap gs <cmd>lua vim.lsp.buf.document_symbol()<CR>
    -- " nnoremap <leader>cs <cmd>lua vim.lsp.buf.document_symbol()<CR>

    -- treesitter
    {
      telescope_prefix .. "s",
      "<cmd>lua require('telescope.builtin').treesitter()<CR>",
      { desc = "Treesitter" },
    },
  }
end
return M
