---@diagnostic disable: missing-fields
local M = {}

M.config = function()
  local status, cmp = pcall(require, "cmp")
  if not status then
    return
  end

  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  require("luasnip.loaders.from_vscode").lazy_load()

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
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
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
    -- `complete` function show selection menu
    ["<C-space>"] = cmp.mapping.complete(),
  }
  cmp.setup({
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
    mapping = my_mapping,
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp_document_symbol" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "emoji" },
      { name = "nvim_lua" },
      -- { name = "cmp_tabnine" },
      -- { name = "treesitter" },
      -- { name = "calc" },
      -- { name = "spell" },
      -- { name = "look" },
    },
    completion = { completeopt = "menu,menuone,noinsert" },
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    sorting = require("cmp.config.default")().sorting,
    -- sorting = {
    --   priority_weight = 2,
    --   comparators = {
    --     -- require("copilot_cmp.comparators").prioritize,
    --     -- require("copilot_cmp.comparators").score,
    --
    --     -- Below is the default comparitor list and order for nvim-cmp
    --     cmp.config.compare.offset,
    --     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
    --     cmp.config.compare.exact,
    --     cmp.config.compare.score,
    --     cmp.config.compare.recently_used,
    --     cmp.config.compare.locality,
    --     cmp.config.compare.kind,
    --     cmp.config.compare.sort_text,
    --     cmp.config.compare.length,
    --     cmp.config.compare.order,
    --   },
    -- },
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

  -- Database completion
  vim.api.nvim_exec(
    [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]],
    false
  )
end

return M
