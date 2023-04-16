local saga = require("lspsaga")

saga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  -- keybinds for navigation in lspsaga window
  scroll_preview = {
    scroll_down = "<C-j>",
    scroll_up = "<C-k>",
  },
  -- request timeout for finding definitions
  request_timeout = 3000,
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      edit = "<CR>", -- I don't know if that exists. If any problems - delete
      jump_to = '<C-l>',
      expand_or_jump = 'o',
      vsplit = '\\',
      split = '-',
      -- tabe = 't',
      -- tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = { 'q', '<ESC>' },
    },
  },
  definition = {
    edit = "<CR>",
    vsplit = "\\",
    split = "-",
    quit = { "q", "<ESC>" },
  },
  -- code_action = {
  --   num_shortcut = true,
  --   keys = {
  --     -- string | table type
  --     quit = "q",
  --     exec = "<CR>",
  --   },
  -- },
  -- diagnostic = {
  --   show_code_action = true,
  --   show_source = true,
  --   jump_num_shortcut = true,
  --   keys = {
  --     exec_action = "o",
  --     quit = "q",
  --     quit_in_show = { "q", "<ESC>" },
  --     go_action = "g",
  --   },
  -- },
  symbol_in_winbar = {
    enable = true,
    -- separator = "  ",
    separator = "  ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
})
