require('Comment').setup({
  -- For context commentign, e.g. inside jsx/tsx
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
