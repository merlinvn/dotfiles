local M = {}

M.opts = {
  dir = "~/My_zet/Neo's thought",
  notes_subdir = "notes",
  daily_notes = {
    folder = "notes/dailies",
  },
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
}
return M
