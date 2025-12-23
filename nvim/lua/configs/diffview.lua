local diffview_status_ok, diffview = pcall(require, "diffview")
if not diffview_status_ok then
  return
end

local actions = require("diffview.actions")

-- Custom close action that handles unsaved changes
local function force_close()
  -- Save all modified buffers or abandon changes
  vim.cmd("silent! wa") -- Try to save all
  -- Force close diffview
  require("diffview").close()
end

diffview.setup({
  enhanced_diff_hl = true,

  -- Handle unsaved changes when closing diffview
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },

  -- Key mappings
  keymaps = {
    view = {
      -- Close diffview and handle unsaved changes
      ["<leader>q"] = force_close,
      ["q"] = force_close,
    },
    file_panel = {
      ["<leader>q"] = force_close,
      ["q"] = force_close,
    },
    file_history_panel = {
      ["<leader>q"] = force_close,
      ["q"] = force_close,
    },
  },

  -- Hook to handle modified buffers when closing
  hooks = {
    diff_buf_read = function(bufnr)
      -- Set buffer to not be modified on read (using modern API)
      vim.bo[bufnr].modifiable = true
      vim.bo[bufnr].bufhidden = "wipe"
    end,
    view_opened = function()
      -- Disable modified flag warnings for diffview buffers
      vim.opt_local.bufhidden = "wipe"
    end,
    view_closed = function()
      -- Force close all diffview buffers when view is closed
      vim.cmd("silent! bufdo! if &filetype == 'DiffviewFiles' | bwipeout! | endif")
    end,
  },
})
