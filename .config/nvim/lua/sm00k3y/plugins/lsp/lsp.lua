require("mason").setup()

local lspconfig = require("lspconfig")
local masonLSP = require("mason-lspconfig")

masonLSP.setup({
  ensure_installed = {
    "html",
    "cssls",
    "tsserver",
    "lua_ls",
    -- "tailwindcss",
    -- 'rust_analyzer',
  },
  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = false,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- keybinds
  -- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)            -- go to declaration
  -- vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)                  -- show definition, references
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)             -- see definition and make edits in window
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)         -- see available code actions
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)              -- smart rename
  vim.keymap.set("n", "[d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)       -- show  diagnostics for line
  vim.keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<CR>")             -- show diagnostics with Telescope
  vim.keymap.set("n", "]d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)     -- show diagnostics for cursor
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                    -- show documentation for what is under cursor
  vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)              -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")      -- rename file and update imports
    vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")    -- remove unused variables (not in youtube nvim video)
  end
end

-- Apply keybindings and completion to every lsp server
masonLSP.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Disabling inline diagnostics
vim.diagnostic.config {
  virtual_text = false
}
