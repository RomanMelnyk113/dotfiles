require "nvchad.autocmds"

-- Custom autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Diffview: Force close without E445 errors
augroup("DiffviewFix", { clear = true })
autocmd("FileType", {
  group = "DiffviewFix",
  pattern = "DiffviewFiles",
  callback = function()
    -- Set bufhidden to wipe to avoid E445 errors
    vim.opt_local.bufhidden = "wipe"
    -- Don't warn about unsaved changes in diffview
    vim.opt_local.buftype = "nofile"
  end,
})

-- Create a command to force close diffview
vim.api.nvim_create_user_command("DiffviewCloseForce", function()
  -- Save current hidden setting
  local hidden = vim.o.hidden
  -- Enable hidden to allow closing buffers with unsaved changes
  vim.o.hidden = true
  -- Close diffview
  vim.cmd("DiffviewClose")
  -- Restore hidden setting
  vim.o.hidden = hidden
end, { desc = "Force close Diffview without saving changes" })
