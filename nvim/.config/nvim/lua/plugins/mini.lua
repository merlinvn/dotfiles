return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local mini_ai = require("mini.ai")
      return {
        custom_textobjects = {
          o = mini_ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = mini_ai.gen_spec.treesitter(
            { a = "@function.outer", i = "@function.inner" },
            {}
          ),
          c = mini_ai.gen_spec.treesitter(
            { a = "@class.outer", i = "@class.inner" },
            {}
          ),
          p = mini_ai.gen_spec.treesitter(
            { a = "@parameter.outer", i = "@parameter.inner" },
            {}
          ),
          -- Whole buffer
          g = function()
            local from = { line = 1, col = 1 }
            local to = {
              line = vim.fn.line("$"),
              col = math.max(vim.fn.getline("$"):len(), 1),
            }
            return { from = from, to = to }
          end,
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
      }
    end,
    config = function(_, opts)
      local mini_ai = require("mini.ai")
      mini_ai.setup(opts)

      -- register all textobjects with which-key
      if require("helpers.lazy").has("which-key.nvim") then
        ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          p = "Parameter",
          q = "Quote `, \", '",
          t = "Tag",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          i[key] = vim.tbl_extend(
            "force",
            { name = "Inside " .. name .. " textobject" },
            ic
          )
          a[key] = vim.tbl_extend(
            "force",
            { name = "Around " .. name .. " textobject" },
            ac
          )
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end
    end,
  },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(
              ("Save changes to %q?"):format(vim.fn.bufname()),
              "&Yes\n&No\n&Cancel"
            )
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "echasnovski/mini.basics",
    event = "VeryLazy",
    opts = {
      options = {
        basic = true,
        win_borders = "double",
      },
      mappings = {
        -- windows navigation by smart-splits.nvim
        windows = false,
      },
    },
  },
  {
    "echasnovski/mini.operators",
    events = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      -- Replace text with register
      replace = {
        prefix = 'g"',
        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },
      -- Sort text
      sort = {
        prefix = "gs",
        -- Function which does the sort
        func = nil,
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = function()
      return {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = {
            pattern = "%f[%w]()FIXME()%f[%W]",
            group = "MiniHipatternsFixme",
          },
          hack = {
            pattern = "%f[%w]()HACK()%f[%W]",
            group = "MiniHipatternsHack",
          },
          todo = {
            pattern = "%f[%w]()TODO()%f[%W]",
            group = "MiniHipatternsTodo",
          },
          note = {
            pattern = "%f[%w]()NOTE()%f[%W]",
            group = "MiniHipatternsNote",
          },
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function(_)
      require("mini.align").setup()
      require("mini.cursorword").setup()
      require("mini.move").setup({})
      require("mini.fuzzy").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()

      -- require("mini.comment").setup()

      -- require("mini.files").setup()

      -- require("mini.indentscope").setup({
      --   draw = {
      --     animation = require('mini.indentscope').gen_animation.none()
      --   }
      -- })

      -- require("mini.jump").setup()
      -- require("mini.jump2d").setup()

      -- require("mini.surround").setup({
      --   mappings = {
      --     add = "gza", -- Add surrounding in Normal and Visual modes
      --     delete = "gzd", -- Delete surrounding
      --     find = "gzf", -- Find surrounding (to the right)
      --     find_left = "gzF", -- Find surrounding (to the left)
      --     highlight = "gzh", -- Highlight surrounding
      --     replace = "gzr", -- Replace surrounding
      --     update_n_lines = "gzn", -- Update `n_lines`
      --   },
      -- })

      -- require("mini.statusline").setup()
      -- require("mini.trailspace").setup()

      -- require("mini.bracketed").setup({
      --   buffer = { suffix = "", options = {} },
      --   comment = { suffix = "", options = {} },
      --   conflict = { suffix = "", options = {} },
      --   diagnostic = { suffix = "", options = {} },
      --   file = { suffix = "", options = {} },
      --   indent = { suffix = "", options = {} },
      --   jump = { suffix = "", options = {} },
      --   location = { suffix = "", options = {} },
      --   oldfile = { suffix = "", options = {} },
      --   quickfix = { suffix = "", options = {} },
      --   treesitter = { suffix = "", options = {} },
      --   undo = { suffix = "", options = {} },
      --   window = { suffix = "", options = {} },
      --   yank = { suffix = "", options = {} },
      -- })

      -- require("mini.bufremove").setup()

      -- local miniclue = require("mini.clue")
      -- miniclue.setup({
      --   triggers = {
      --     -- Leader triggers
      --     { mode = "n", keys = "<Leader>" },
      --     { mode = "x", keys = "<Leader>" },
      --     { mode = "n", keys = "\\" },
      --
      --     -- bracketed
      --     { mode = 'n', keys = ']' },
      --     { mode = 'n', keys = '[' },
      --
      --     -- Built-in completion
      --     { mode = "i", keys = "<C-x>" },
      --
      --     -- `g` key
      --     { mode = "n", keys = "g" },
      --     { mode = "x", keys = "g" },
      --
      --     -- Marks
      --     { mode = "n", keys = "'" },
      --     { mode = "n", keys = "`" },
      --     { mode = "x", keys = "'" },
      --     { mode = "x", keys = "`" },
      --
      --     -- Registers
      --     { mode = "n", keys = '"' },
      --     { mode = "x", keys = '"' },
      --     { mode = "i", keys = "<C-r>" },
      --     { mode = "c", keys = "<C-r>" },
      --
      --     -- Window commands
      --     { mode = "n", keys = "<C-w>" },
      --
      --     -- `z` key
      --     { mode = "n", keys = "z" },
      --     { mode = "x", keys = "z" },
      --   },
      --
      --   clues = {
      --     -- Enhance this by adding descriptions for <Leader> mapping groups
      --     miniclue.gen_clues.builtin_completion(),
      --     miniclue.gen_clues.g(),
      --     miniclue.gen_clues.marks(),
      --     miniclue.gen_clues.registers(),
      --     miniclue.gen_clues.windows(),
      --     miniclue.gen_clues.z(),
      --
      --     { mode = 'n', keys = ']b', postkeys = ']' },
      --     { mode = 'n', keys = ']w', postkeys = ']' },
      --     { mode = 'n', keys = '[b', postkeys = '[' },
      --     { mode = 'n', keys = '[w', postkeys = '[' },
      --   },
      -- })
    end,
    keys = {},
  },
}
