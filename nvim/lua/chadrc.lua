-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  extended_integrations = { "trouble", "alpha", "dap", "todo", "codeactionmenu" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
