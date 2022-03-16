local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")
local luasnip = require("luasnip")

-- require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      -- set a name for each source
      vim_item.menu =
        ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        ultisnips = "[UltiSnips]",
        nvim_lua = "[Lua]",
        -- cmp_tabnine = "[TabNine]",
        look = "[Look]",
        path = "[Path]",
        spell = "[Spell]",
        calc = "[Calc]",
        emoji = "[Emoji]",
        treesitter = "[treesitter]"
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ["<Tab>"] = cmp.mapping(
    --   function(fallback)
    --     if cmp.visible() then
    --       cmp.select_next_item()
    --     elseif luasnip.expand_or_jumpable() then
    --       luasnip.expand_or_jump()
    --     elseif has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end,
    --   {"i", "s"}
    -- ),
    -- ["<S-Tab>"] = cmp.mapping(
    --   function(fallback)
    --     if cmp.visible() then
    --       cmp.select_prev_item()
    --     elseif luasnip.jumpable(-1) then
    --       luasnip.jump(-1)
    --     else
    --       fallback()
    --     end
    --   end,
    --   {"i", "s"}
    -- )
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  sources = {
    {name = "buffer"},
    {name = "nvim_lsp"},
    {name = "luasnip"},
    {name = "nvim_lua"},
    {name = "look"},
    {name = "path"},
    {name = "calc"},
    {name = "spell"},
    {name = "emoji"},
    {name = "treesitter"} -- {name = 'cmp_tabnine'}
  },
  completion = {completeopt = "menu,menuone,noinsert"}
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  "/",
  {
    sources = {
      {name = "buffer"}
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)

-- Autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
-- require("nvim-autopairs.completion.cmp").setup(
--   {
--     map_cr = true,
--     map_complete = true,
--     auto_select = true
--   }
-- )

-- TabNine
--   local tabnine = require("cmp_tabnine.config")
--   tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})
--
-- Database completion
vim.api.nvim_exec(
  [[
        autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
    ]],
  false
)
