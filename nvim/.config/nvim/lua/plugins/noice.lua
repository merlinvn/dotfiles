return {
  {
    -- enabled = false,
    "folke/noice.nvim",
    version = false,
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
      {
        "rcarriga/nvim-notify",
        keys = {
          {
            "<leader>vo",
            function()
              require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Delete all Notifications",
          },
        },
        -- opts = {
        --   timeout = 3000,
        --   max_height = function()
        --     return math.floor(vim.o.lines * 0.75)
        --   end,
        --   max_width = function()
        --     return math.floor(vim.o.columns * 0.75)
        --   end,
        -- },
      },
    },
    opts = {
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      lsp = {
        -- disable the following features in orther for lsp-zero works
        hover = {
          -- enabled = false,
        },
        signature = {
          -- enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    keys = {
      -- {
      --   "<S-Enter>",
      --   function()
      --     require("noice").redirect(vim.fn.getcmdline())
      --   end,
      --   mode = "c",
      --   desc = "Redirect Cmdline",
      -- },
      -- { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      -- { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      -- { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      -- {
      --   "<c-f>",
      --   function()
      --     if not require("noice.lsp").scroll(4) then
      --       return "<c-f>"
      --     end
      --   end,
      --   silent = true,
      --   expr = true,
      --   desc = "Scroll forward",
      --   mode = { "i", "n", "s" },
      -- },
      -- {
      --   "<c-b>",
      --   function()
      --     if not require("noice.lsp").scroll(-4) then
      --       return "<c-b>"
      --     end
      --   end,
      --   silent = true,
      --   expr = true,
      --   desc = "Scroll backward",
      --   mode = { "i", "n", "s" },
      -- },
    },
  },
}
