-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

-- local c = {
--   dark = "#252525",
--   white = "#d9d9d9",
--
--   -- diff_add = "#333238"
--   diff_add = "#587c0c",
--   diff_change = "#2b6f77",
--   diff_delete = "#e46770",
--   diff_text = "#2c5372",
--   cyan = "#4EC9B0",
--   gray = "#808080",
-- }

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  -- DiffAdd = { bg = c.diff_add },
  -- DiffChange = { bg = c.diff_change },
  -- DiffDelete = { bg = c.diff_delete },
  -- DiffText = { fg = c.dark, bg = c.diff_text },

  -- DiffAdded = { fg = c.diff_add },
  -- DiffRemoved = { bg = c.diff_delete },
  -- DiffFile = { fg = c.cyan },
  -- DiffIndexLine = { fg = c.gray },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },

  -- WinBar = { link = "Normal" },
  -- WinBarNC = { link = "Normal" },
    -- DiffviewDiffAdd = {fg = "black", bg = "#98c379", blend=10, sp="pink" },
    -- DiffviewDiffChange = {fg = "white", bg = "#6183bb" },
    -- DiffviewDiffModified = {fg = "black", bg = "#f6955b" },
    -- DiffviewDiffDelete = {fg = "black", bg = "#ee6d85" },
    -- DiffviewDiffAddAsDelete = {fg = "black", bg = "#ee6d85" },
    -- DiffviewDiffText = { fg = "white", bg = "#394b70", bold = true },

  -- DiffviewDim1 = { fg = "grey" },
  -- DiffviewReference = { fg = "cyan" },
  -- DiffviewPrimary = { fg = "cyan" },
  -- DiffviewSecondary = { fg = "blue" },
  -- DiffviewNonText = { link = "DiffviewDim1" },
  -- DiffviewStatusUnmerged = { link = "GitMerge" },
  -- DiffviewStatusUntracked = { link = "GitNew" },
  -- DiffviewStatusModified = { link = "GitDirty" },
  -- DiffviewStatusRenamed = { link = "GitRenamed" },
  -- DiffviewStatusDeleted = { link = "GitDeleted" },
  -- DiffviewStatusAdded = { link = "GitStaged" },
  -- DiffviewFilePanelRootPath = { link = "NvimTreeRootFolder" },
  -- DiffviewFilePanelTitle = { link = "Title" },
  -- DiffviewFilePanelCounter = { fg = "cyan" },
  -- DiffviewFilePanelInsertions = { link = "GitNew" },
  -- DiffviewFilePanelDeletions = { link = "GitDeleted" },
  -- DiffviewFilePanelConflicts = { link = "GitMerge" },
  -- DiffviewFolderSign = { link = "NvimTreeFolderIcon" },
  -- DiffviewDiffDelete = { link = "Comment" }, 
}

return M
