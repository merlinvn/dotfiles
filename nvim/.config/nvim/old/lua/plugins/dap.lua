return {
  {
    enabled = false,
    "mfussenegger/nvim-dap",
    -- ft = { "rb", "rs", "cpp", "h" },
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        opts = { handlers = {} },
      },
      {
        "rcarriga/nvim-dap-ui",
        ft = { "rb", "rs", "cpp", "h" },
        keys = {
          {
            "<leader>du",
            function()
              require("dapui").toggle({})
            end,
            desc = "Dap UI",
          },
          {
            "<leader>de",
            function()
              require("dapui").eval()
            end,
            desc = "Eval",
            mode = { "n", "v" },
          },
        },
        opts = {
          expand_lines = true,

          icons = {
            expanded = "",
            collapsed = "",
            circular = "",
          },

          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },

          layouts = {
            {
              elements = {
                { id = "scopes",      size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks",      size = 0.25 },
                { id = "watches",     size = 0.25 },
              },
              size = 0.33,
              position = "right",
            },
            {
              elements = {
                { id = "repl",    size = 0.50 },
                { id = "console", size = 0.50 },
              },
              size = 0.25,
              position = "bottom",
            },
          },

          floating = {
            max_height = 0.9,
            max_width = 0.5,
            border = vim.g.border_chars,
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
        },
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        event = "BufReadPre",
        opts = {
          enabled = true,
          enabled_commands = false,
          highlight_changed_variables = true,
          highlight_new_as_changed = true,
          commented = false,
          show_stop_reason = true,
          virt_text_pos = "eol",
          all_frames = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader>dB",
        function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
        desc =
        "Breakpoint Condition"
      },
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc =
        "Toggle Breakpoint"
      },
      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc =
        "Continue"
      },
      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc =
        "Run to Cursor"
      },
      {
        "<leader>dg",
        function() require("dap").goto_() end,
        desc =
        "Go to line (no execute)"
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        desc =
        "Step Into"
      },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,   desc = "Up" },
      {
        "<leader>dl",
        function() require("dap").run_last() end,
        desc =
        "Run Last"
      },
      {
        "<leader>do",
        function() require("dap").step_out() end,
        desc =
        "Step Out"
      },
      {
        "<leader>dO",
        function() require("dap").step_over() end,
        desc =
        "Step Over"
      },
      {
        "<leader>dp",
        function() require("dap").pause() end,
        desc =
        "Pause"
      },
      {
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        desc =
        "Toggle REPL"
      },
      {
        "<leader>ds",
        function() require("dap").session() end,
        desc =
        "Session"
      },
      {
        "<leader>dt",
        function() require("dap").terminate() end,
        desc =
        "Terminate"
      },
      {
        "<leader>dw",
        function() require("dap.ui.widgets").hover() end,
        desc =
        "Widgets"
      },
    },
  },
}
