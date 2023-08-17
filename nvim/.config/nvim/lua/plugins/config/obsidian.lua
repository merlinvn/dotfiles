local M = {}

M.opts = {
  dir = "~/My zet/Neo's thought",
  notes_subdir = "000.Fleeting",
  daily_notes = {
    folder = "000.Fleeting/dailies",
    date_format = "%Y-%m-%d",
  },
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    min_chars = 2,
  },
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    -- ["gf"] = require("obsidian.mapping").gf_passthrough(),
  },

  finder = "telescope.nvim",
  open_notes_in = "current",

  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
  follow_url_func = function(url)
    vim.fn.jobstart({ "open", url })
  end,

  -- set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = true,

  -- Set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = true,

  -- customize how names/IDs for new notes are created.
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- if title is nil then add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.date("%y%m%d-%H%M%S")) .. "-" .. suffix
  end,

  disable_frontmatter = false,

  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = {
      id = note.id,
      aliases = note.aliases,
      tags = note.tags,
    }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if
      note.metadata ~= nil
      and require("obsidian").util.table_length(note.metadata) > 0
    then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    if out.created == nil then
      out.created = os.date("%Y-%m-%d %H:%M")
    end
    out.modified = os.date("%Y-%m-%d %H:%M")
    return out
  end,
}

M.newNote = function()
  -- on cancel or empty input do nothing and return
  -- otherwise create new note
  local new_note_title = vim.fn.input("New note: ")

  if new_note_title == "" then
    return
  else
    vim.cmd("ObsidianNew " .. new_note_title)
  end
  -- vim.ui.input({
  --   prompt = "New note: ",
  -- }, function(new_note)
  --   vim.cmd("ObsidianNew " .. new_note)
  -- end)
end
M.keys = {
  { "<leader>nf", ":ObsidianQuickSwitch<CR>", desc = "Find" },
  { "<leader>ng", ":ObsidianSearch<CR>", desc = "Live Grep" },
  { "<leader>no", ":ObsidianOpen<CR>", desc = "Open in Obsidian" },
  -- { "<leader>nn", ":ObsidianNew<CR>", desc = "New note" },
  { "<leader>nn", M.newNote, desc = "New note" },
  {
    "<leader>nd",
    ":ObsidianToday<CR>",
    desc = "New daily note",
  },
  {
    "<leader>nt",
    ":ObsidianTemplate<CR>",
    desc = "Templates",
  },
  -- link
  {
    "<leader>nl",
    ":ObsidianLink<CR>",
    desc = "Link",
  },
  {
    "<leader>nL",
    ":ObsidianLinkNew<CR>",
    desc = "Link (new)",
  },
  --backlinks
  {
    "<leader>nb",
    ":ObsidianBacklinks<CR>",
    desc = "Backlinks",
  },
}

return M
