---@diagnostic disable: missing-fields
return {
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        "onsails/lspkind-nvim",
        event = "BufReadPre",
      },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "hrsh7th/cmp-nvim-lua" },

      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local status, cmp = pcall(require, "cmp")
      if not status then
        return
      end
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      local source_mapping = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        ultisnips = "[snip]",
        luasnip = "[snip]",
        nvim_lua = "[lua]",
        cmp_tabnine = "[T9]",
        look = "[look]",
        path = "[path]",
        spell = "[spell]",
        calc = "[calc]",
        emoji = "[emoji]",
        treesitter = "[treesitter]",
        copilot = "[copilot]",
      }

      local my_mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<C-p>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),

        ["<C-e>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),
        ["<M-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          { "i", "c" }
        ),
      }

      cmp.setup({
        mapping = my_mapping,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
              if
                entry.completion_item.data ~= nil
                and entry.completion_item.data.detail ~= nil
              then
                menu = entry.completion_item.data.detail .. " " .. menu
              end
              vim_item.kind = ""
            end
            if entry.source.name == "copilot" then
              vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
          end,
        },
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp_document_symbol" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
          -- { name = "emoji" },
          { name = "nvim_lua" },
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = require("cmp.config.default")().sorting,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      vim.cmd([[  highlight! default link CmpItemKind CmpItemMenuDefault ]])
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        -- completion = { autocomplete = true },
        mapping = cmp.mapping.preset.cmdline({}),
        sources = {
          { name = "buffer" },
          -- { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({}),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
}
