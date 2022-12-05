local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local status, cmp = pcall(require, "cmp")
if (not status) then return end

local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  ultisnips = "[UltiSnips]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[T9]",
  look = "[Look]",
  path = "[Path]",
  spell = "[Spell]",
  calc = "[Calc]",
  emoji = "[Emoji]",
  treesitter = "[treesitter]",
  copilot = "[copilot]",
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      if entry.source.name == "copilot" then
        vim_item.kind = ""
      end
      vim_item.menu = menu
      return vim_item
    end
    -- format = lspkind.cmp_format({cmp
    --   mode = 'symbol_text', -- show only symbol annotations
    --   maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    --
    --   -- The function below will be called before any actual modifications from lspkind
    --   -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    --   before = function(entry, vim_item)
    --     vim_item.kind = lspkind.presets.default[vim_item.kind]
    --
    --     local menu = source_mapping[entry.source.name]
    --     if entry.source.name == "cmp_tabnine" then
    --       print("hello")
    --       if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
    --         menu = entry.completion_item.data.detail .. " " .. menu
    --       end
    --       vim_item.kind = ""
    --     end
    --
    --     vim_item.menu = menu
    --     return vim_item
    --   end
    -- }),
  },
  mapping = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
    ['<Esc>'] = cmp.mapping({
      c = function()
        if cmp.visible() then
          cmp.close()
        else
          vim.api.nvim_feedkeys(t('<C-c>'), 'n', true)
        end
      end
    }),
    ["<CR>"] = cmp.mapping(
      {
        i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
          else
            fallback()
          end
        end
      }
    ),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.SelectBehavior })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end,
      { "i", "s" }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({behavior = cmp.SelectBehavior.SelectBehavior})
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      { "i", "s" }
    ),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Select
    }), { "i" }),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select
    }), { "i" }),
    ["<C-Down>"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }
    ),
    ["<C-Up>"] = cmp.mapping(
      {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            vim.api.nvim_feedkeys(t("<Up>"), "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end
      }
    )
  },
  sources = {
    { name = 'copilot'},
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
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

vim.cmd [[
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  "/",
  {
    -- completion = { autocomplete = true },
    sources = {
      { name = "buffer" }
      -- { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":",
  {
    completion = { autocomplete = true },
    sources = cmp.config.sources(
      {
        { name = "path" }
      } ,
      {
        { name = "cmdline" }
      }
    )
  }
)

-- Autopairs
-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- require("nvim-autopairs.completion.cmp").setup(
--   {
--     map_cr = true,
--     map_complete = true,
--     auto_select = true
--   }
-- )

-- TabNine
-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 20,
--   sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = '..',
--   ignored_file_types = {
--     -- default is not to ignore
--     -- uncomment to ignore in lua:
--     -- lua = true
--   },
--   show_prediction_strength = false
-- })
--
-- Database completion
vim.api.nvim_exec(
  [[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]],
  false
)

-- cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)
--
-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false

