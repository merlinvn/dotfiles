return {
  -- switch to mini.fuzzy
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable 'make' == 1 },
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-smart-history.nvim",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "echasnovski/mini.fuzzy" },
    opts = function()
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
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      local telescope_prefix = "<leader>t"

      local map_telescope = function(lhs, rhs, opts_in)
        vim.keymap.set("n", telescope_prefix .. lhs, rhs, opts_in)
      end
      -- local sorters = require "telescope.sorters"

      -- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
      -- paste.
      vim.api.nvim_set_keymap(
        "c",
        "<c-r><c-r>",
        "<Plug>(TelescopeFuzzyCommandSearch)",
        { noremap = false, nowait = true }
      )
      -- vim.keymap.set("n", "<leader><space>", require('merlinvn.telescope').buffers,  { desc = "Current buffers" })
      vim.keymap.set(
        "n",
        "<leader><space>",
        require("telescope.builtin").buffers,
        { desc = "Current buffers" }
      )

      -- FILES
      vim.keymap.set(
        "n",
        "<leader>e",
        require("merlinvn.telescope").find_files(),
        { desc = "Files / Project files" }
      )

      map_telescope(
        "f",
        require("merlinvn.telescope").find_files(),
        { desc = "Files / Project files" }
      )
      map_telescope(
        "s",
        "<cmd>lua require('merlinvn.telescope').grep_prompt()<cr>",
        { desc = "Global search cwd" }
      )
      map_telescope("t", "<cmd>Telescope<cr>")
      map_telescope(
        "b",
        require("telescope.builtin").buffers,
        { desc = "[B]uffers" }
      )
      map_telescope(
        "o",
        require("telescope.builtin").oldfiles,
        { desc = "[O]ld files" }
      )
      map_telescope(
        "g",
        "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>",
        { desc = "Live [G]rep" }
      )
      map_telescope(
        "a",
        require("merlinvn.telescope").search_all_files,
        { desc = "[A]ll files" }
      )
      map_telescope(
        "e",
        "<cmd>lua require('merlinvn.telescope').file_browser()<cr>",
        { desc = "Fil[e] browser" }
      )
      map_telescope(
        "z",
        "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
        { desc = "Search by file type" }
      )

      -- SEARCH
      vim.keymap.set(
        "n",
        "<leader>/",
        "<cmd>lua require('merlinvn.telescope').curbuf()<cr>",
        { desc = "Search current buffer" }
      )
      -- search word under cursor
      map_telescope(
        "w",
        "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
        { desc = "Search word under cursor" }
      )

      -- VIM
      map_telescope(
        "r",
        "<cmd>lua require('telescope.builtin').registers()<cr>",
        { desc = "[R]egisters" }
      )
      map_telescope("c", "<cmd>Telescope commands<cr>", { desc = "Commands" })
      map_telescope(
        "h",
        "<cmd>lua require('merlinvn.telescope').help_tags()<cr>",
        { desc = "[H]elp tags" }
      )
      map_telescope(
        "k",
        "<cmd>lua require('telescope.builtin').keymaps()<cr>",
        { desc = "[K]eymaps" }
      )
      map_telescope(
        "O",
        "<cmd>lua require('merlinvn.telescope').vim_options()<cr>",
        { desc = "Vim Options" }
      )
      -- map_telescope("m", "<cmd>Telescope marks<cr>", { desc = "Marks" })
      map_telescope(
        ";",
        "<cmd>Telescope command_history<cr>",
        { desc = "Command history" }
      )
      map_telescope(
        "?",
        "<cmd>Telescope search_history<cr>",
        { desc = "Search history" }
      )

      map_telescope(
        "d",
        "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>",
        { desc = "Dotfiles" }
      )
      map_telescope(
        "n",
        "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>",
        { desc = "Neovim config" }
      )

      -- search word from input

      -- nnoremap ("gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
      -- nnoremap ("<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
      --
      -- " nnoremap gs <cmd>lua vim.lsp.buf.document_symbol()<CR>
      -- " nnoremap <leader>cs <cmd>lua vim.lsp.buf.document_symbol()<CR>

      -- treesitter
      map_telescope(
        "s",
        "<cmd>lua require('telescope.builtin').treesitter()<CR>",
        { desc = "Treesitter" }
      )
    end,
  },
}
