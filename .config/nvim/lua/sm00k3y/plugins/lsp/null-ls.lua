local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier.with({
      condition = function(utils)
        return utils.root_has_file("package.json")
            or utils.root_has_file(".prettierrc")
            or utils.root_has_file(".prettierrc.json")
            or utils.root_has_file(".prettierrc.js")
      end,
    }),
    formatting.stylua,
    diagnostics.eslint_d.with({
      -- only enable eslint if root has .eslintrc.js
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
            or utils.root_has_file(".eslintrc.json")
      end,
    }),
  },
})
