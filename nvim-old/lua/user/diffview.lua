local diffview_status_ok, diffview = pcall(require, "diffview")
if not diffview_status_ok then
  return
end

diffview.setup({
    enhanced_diff_hl = true,
  })
