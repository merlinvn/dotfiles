local loadTextobjects = false

return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = "VeryLazy",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
      },
    },
    init = function()
      -- disable rtp plugin, as we only need its queries for mini.ai
      -- In case other textobject modules are enabled, we will load them
      -- once nvim-treesitter is loaded
      require("lazy.core.loader").disable_rtp_plugin(
        "nvim-treesitter-textobjects"
      )
      loadTextobjects = true
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ignore_install = { "help" }, -- List of parsers to ignore installing
      -- A list of parser names, or "all"
      ensure_installed = {
        "bash",
        "c",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "rust",
        "toml",
        "typescript",
        "vim",
        "yaml",
      },
      auto_install = true,
      sync_install = false,
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
        disable = { "conf" },
      },
      indent = {
        enable = true,
        disable = { "python" },
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },

        smart_rename = {
          enable = false,
          keymaps = {
            -- mapping to rename reference under cursor
            smart_rename = "grr",
          },
        },

        navigation = {
          enable = false,
          keymaps = {
            goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
            list_definitions = "gnD", -- mapping to list all definitions in current file
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      context_commentstring = {
        enable = true,

        -- With Comment.nvim, we don't need to run this on the autocmd.
        -- Only run it in pre-hook
        enable_autocmd = false,

        config = {
          c = "// %s",
          lua = "-- %s",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- keymaps is now defined by mini.ai plugin
            -- You can use the capture groups defined in textobjects.scm
            -- ["ap"] = "@parameter.outer",
            -- ["ip"] = "@parameter.inner",
            --
            -- ["af"] = "@function.outer",
            -- ["if"] = "@function.inner",
            --
            -- ["ac"] = "@class.outer",
            -- ["ic"] = "@class.inner",

            -- ['ab'] = '@block.outer',
            -- ['ib'] = '@block.inner',

            -- ["ao"] = "@conditional.outer",
            -- ["io"] = "@conditional.inner",
            --
            -- ["av"] = "@variable.outer",
            -- ["iv"] = "@variable.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
            ["]f"] = { query = "@function.outer", desc = "Next function" },
            ["]c"] = { query = "@class.outer", desc = "Next class" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
            ["[f"] = {
              query = "@function.outer",
              desc = "Previous function start",
            },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
          },
          goto_previous_end = {
            ["[F"] = {
              query = "@function.outer",
              desc = "Previous function end",
            },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>csp"] = {
              query = "@parameter.inner",
              desc = "Next parameter",
            },
            ["<leader>csf"] = {
              query = "@function.outer",
              desc = "Next function",
            },
            ["<leader>csc"] = { query = "@class.outer", desc = "Next class" },
          },
          swap_previous = {
            ["<leader>csP"] = {
              query = "@parameter.inner",
              desc = "Previous parameter",
            },
            ["<leader>csF"] = {
              query = "@function.outer",
              desc = "Previous function",
            },
            ["<leader>csC"] = {
              query = "@class.outer",
              desc = "Previous class",
            },
          },
        },
      },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = true,
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",

          -- This shows stuff like literal strings, commas, etc.
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
      if loadTextobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require("lazy.core.loader")
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin =
                require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 5,
        multiline_threshold = 20,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPost",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/playground",
    event = "BufReadPre",
  },
}
