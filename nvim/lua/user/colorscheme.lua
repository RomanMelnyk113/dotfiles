-- local colorscheme = "darkplus"
local colorscheme = "onedark"

vim.g.onedarker_italic_keywords = false

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = false

vim.g.onedarker_italic_conditionals = false

if colorscheme == 'onedark' then
  local status_ok, theme = pcall(require, colorscheme)
  if not status_ok then
    -- vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
  end
  local c = {
    dark = '#252525',
    white = '#d9d9d9',

		diff_add = "#31392b",
		diff_delete = "#382b2c",
		diff_change = "#1c3448",
		diff_text = "#2c5372",

    -- diff_add = "#333238"
    diff_add = '#587c0c',
    diff_change = '#0c7d9d',
    diff_delete = '#94151b',
    diff_text = '#265478',
    cyan = '#4EC9B0',
    gray = '#808080',

black = "#181a1f",
		bg0 = "#282c34",
		bg1 = "#31353f",
		bg2 = "#393f4a",
		bg3 = "#3b3f4c",
		bg_d = "#21252b",
		bg_blue = "#73b8f1",
		bg_yellow = "#ebd09c",
		fg = "#abb2bf",
		purple = "#c678dd",
		green = "#98c379",
		orange = "#d19a66",
		blue = "#61afef",
		yellow = "#e5c07b",
		cyan = "#56b6c2",
		red = "#e86671",
		grey = "#5c6370",
		light_grey = "#848b98",
		dark_cyan = "#2b6f77",
		dark_red = "#993939",
		dark_yellow = "#93691d",
		dark_purple = "#8a3fa0",
		diff_add = "#31392b",
		diff_delete = "#382b2c",
		diff_change = "#1c3448",
		diff_text = "#2c5372",

  }
  -- local c = theme.colors
  theme.setup {
      style = 'dark',
      colors={
        diff_add = '#587c0c',
        diff_delete = "#e46770",
        diff_change = "#2b6f77",
        diff_text = "#2c5372",
      },
    --   highlights= {
    --     -- DiffAdd = { fg = c.white, bg = c.diff_add },
    --     DiffAdd = { bg = c.diff_add },
    --     DiffAdded = { fg = c.diff_add },
    --     DiffChange = {  bg = c.diff_change, style = 'underline' },
    --     DiffDelete = {  bg = c.diff_delete },
    --     DiffRemoved = { fg = c.diff_delete },
    --     DiffText = { fg = c.dark, bg = c.diff_text },
    --     DiffFile = { fg = c.cyan },
    --     DiffIndexLine = { fg = c.gray },
    -- }
  }
  theme.load()
  -- theme.colorscheme()
else
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
      -- vim.notify("colorscheme " .. colorscheme .. " not found!")
      return
    end
end

