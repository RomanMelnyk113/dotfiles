-- OneDark colorscheme
-- https://github.com/navarasu/onedark.nvim

return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('onedark').setup {
      style = 'darker', -- Use 'darker' variant for better match with NvChad OneDark
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      -- Change code style
      code_style = {
        comments = 'none', -- No italics for comments
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
      },

      -- Custom colors to match NvChad OneDark
      colors = {
        bright_orange = '#ff8800', -- For highlights like BaselineParams
        green = '#98c379', -- Brighter green
        purple = '#c678dd', -- Brighter purple
        blue = '#61afef', -- Brighter blue
        yellow = '#e5c07b', -- Yellow for warnings
        cyan = '#56b6c2', -- Cyan for types
        red = '#e06c75', -- Red for errors
        orange = '#d19a66', -- Orange for numbers
        dark_yellow = '#d19a66', -- Dark yellow
      },

      -- Highlight overrides for better syntax highlighting
      highlights = {
        -- Make function parameters and type parameters more visible
        ['@parameter'] = { fg = '#d19a66' }, -- Orange for parameters
        ['@type.builtin'] = { fg = '#c678dd' }, -- Purple for built-in types
        ['@type'] = { fg = '#e5c07b' }, -- Yellow for custom types
        ['@field'] = { fg = '#e06c75' }, -- Red for fields
        ['@property'] = { fg = '#e06c75' }, -- Red for properties
        ['@variable'] = { fg = '#abb2bf' }, -- Normal text for variables
        ['@constant'] = { fg = '#d19a66' }, -- Orange for constants
        ['@string'] = { fg = '#98c379' }, -- Green for strings
        ['@function'] = { fg = '#61afef' }, -- Blue for functions
        ['@keyword'] = { fg = '#c678dd' }, -- Purple for keywords
        ['@operator'] = { fg = '#56b6c2' }, -- Cyan for operators
        ['@punctuation'] = { fg = '#abb2bf' }, -- Normal for punctuation

        -- Make LSP semantic highlights match
        ['@lsp.type.parameter'] = { fg = '#d19a66' }, -- Orange
        ['@lsp.type.type'] = { fg = '#e5c07b' }, -- Yellow
        ['@lsp.type.struct'] = { fg = '#e5c07b' }, -- Yellow
        ['@lsp.type.interface'] = { fg = '#e5c07b' }, -- Yellow
        ['@lsp.type.variable'] = { fg = '#abb2bf' }, -- Normal
        ['@lsp.type.property'] = { fg = '#e06c75' }, -- Red

        -- Search highlights (for the yellow boxes)
        Search = { bg = '#e5c07b', fg = '#282c34' }, -- Yellow background
        IncSearch = { bg = '#d19a66', fg = '#282c34' }, -- Orange background
        CurSearch = { bg = '#e5c07b', fg = '#282c34' }, -- Yellow background
      },

      -- Plugins Config
      diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
      },
    }

    -- Load the colorscheme
    require('onedark').load()
  end,
}
