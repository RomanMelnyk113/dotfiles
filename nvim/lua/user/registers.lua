	-- -- vim.g.registers_return_symbol = "\n" --'⏎' by default
	-- -- vim.g.registers_tab_symbol = "\t" --'·' by default
	-- -- vim.g.registers_space_symbol = " " --' ' by default
	-- vim.g.registers_delay = 0 --0 by default, milliseconds to wait before opening the popup window
	-- vim.g.registers_register_key_sleep = 0 --0 by default, seconds to wait before closing the window when a register key is pressed
	-- vim.g.registers_show_empty_registers = 1 --1 by default, an additional line with the registers without content
	-- vim.g.registers_trim_whitespace = 1 --1 by default, don't show whitespace at the begin and end of the registers
	-- vim.g.registers_hide_only_whitespace = 1 --0 by default, don't show registers filled exclusively with whitespace
	-- vim.g.registers_window_border = "rounded" --'none' by default, can be 'none', 'single','double', 'rounded', 'solid', or 'shadow' (requires Neovim 0.5.0+)
	-- vim.g.registers_window_min_height = 3 --3 by default, minimum height of the window when there is the cursor at the bottom
-- vim.g.registers_window_max_width = 100 --100 by default, maximum width of the window
-- vim.g.registers_normal_mode = 1 --1 by default, open the window in normal mode
-- vim.g.registers_visual_mode = 1 --1 by default, open the window in visual mode
-- vim.g.registers_insert_mode = 1 --1 by default, open the window in insert mode
-- -- vim.g.registers_show = "*+\"" --'*+\"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz' by default, which registers to show and in what order

local registers = require("registers")
registers.setup({
        -- Show these registers in the order of the string
        show = "*+\"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:",
        -- Show a line at the bottom with registers that aren't filled
        show_empty = true,
        -- Expose the :Registers user command
        register_user_command = true,
        -- Always transfer all selected registers to the system clipboard
        system_clipboard = true,
        -- Don't show whitespace at the begin and end of the register's content
        trim_whitespace = true,
        -- Don't show registers which are exclusively filled with whitespace
        hide_only_whitespace = true,
        -- Show a character next to the register name indicating how the register will be applied
        show_register_types = true,

        bind_keys = {
            -- Show the window when pressing " in normal mode, applying the selected register as part of a motion, which is the default behavior of Neovim
            normal = registers.show_window({ mode = "motion" }),
            -- Show the window when pressing " in visual mode, applying the selected register as part of a motion, which is the default behavior of Neovim
            visual = registers.show_window({ mode = "motion" }),
            -- Show the window when pressing <C-R> in insert mode, inserting the selected register, which is the default behavior of Neovim
            insert = registers.show_window({ mode = "insert" }),

            -- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
            registers = registers.apply_register({ delay = 0.1 }),
            -- Immediately apply the selected register line when pressing the return key
            return_key = registers.apply_register(),
            -- Close the registers window when pressing the Esc key
            escape = registers.close_window(),

            -- Move the cursor in the registers window down when pressing <C-N>
            ctrl_n = registers.move_cursor_down(),
            -- Move the cursor in the registers window up when pressing <C-P>
            ctrl_p = registers.move_cursor_up(),
            -- Move the cursor in the registers window down when pressing <C-J>
            ctrl_j = registers.move_cursor_down(),
            -- Move the cursor in the registers window up when pressing <C-K>
            ctrl_k = registers.move_cursor_up(),
            -- Clear the register of the highlighted line when pressing <DEL>
            delete = registers.clear_highlighted_register(),
            -- Clear the register of the highlighted line when pressing <BS>
            backspace = registers.clear_highlighted_register(),
        },

        events = {
            -- When a register line is highlighted, show a preview in the main buffer with how the register will be applied, but only if the register will be inserted or pasted
            on_register_highlighted = registers.preview_highlighted_register({ if_mode = { "insert", "paste" } }),
        },

        symbols = {
            -- Show a special character for line breaks
            newline = "⏎",
            -- Show space characters without changes
            space = " ",
            -- Show a special character for tabs
            tab = "·",
            -- The character to show when a register will be applied in a char-wise fashion
            register_type_charwise = "ᶜ",
            -- The character to show when a register will be applied in a line-wise fashion
            register_type_linewise = "ˡ",
            -- The character to show when a register will be applied in a block-wise fashion
            register_type_blockwise = "ᵇ",
        },

        window = {
            -- The window can't be wider than 100 characters
            max_width = 100,
            -- Show a small highlight in the sign column for the line the cursor is on
            highlight_cursorline = true,
            -- Don't draw a border around the registers window
            border = "none",
            -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
            transparency = 10,
        },

        -- Highlight the sign registers as regular Neovim highlights
        sign_highlights = {
            cursorline = "Visual",
            selection = "Constant",
            default = "Function",
            unnamed = "Statement",
            read_only = "Type",
            expression = "Exception",
            black_hole = "Error",
            alternate_buffer = "Operator",
            last_search = "Tag",
            delete = "Special",
            yank = "Delimiter",
            history = "Number",
            named = "Todo",
        },
        })
