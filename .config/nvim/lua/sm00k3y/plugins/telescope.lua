local telescope = require("telescope")

telescope.setup({
  defaults = {
    preview = true, -- shows a code preview window
    layout_strategy = "vertical",
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
      n = {
        ["q"] = "close"
      }
    },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    }
  },
  -- pickers = {
  --   find_files = {
  --     theme = "dropdown", -- I don't like this theme (too small)
  --   }
  -- }
  -- extensions = {
  -- Fuzzy finding default config
  -- fzf = {
  --   fuzzy = true,                    -- false will only do exact matching
  --   override_generic_sorter = true,  -- override the generic sorter
  --   override_file_sorter = true,     -- override the file sorter
  --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                    -- the default case_mode is "smart_case"
  -- }
  -- }
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
