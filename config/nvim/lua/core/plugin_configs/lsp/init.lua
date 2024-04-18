local lsp = require('lsp-zero').preset({ 'recommended' })

lsp.ensure_installed({
})
lsp.setup()

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

  -- just and example to set other keybindings
  -- vim.keymap.set('n', 'xx', '<cmd>Telescope lsp_definitions<cr>')
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup {
  cmd = {
    "clangd",
    "--header-insertion=never",
    "--query-driver=/usr/lib/llvm-14/bin/clang",
    "--all-scopes-completion",
    "--completion-style=detailed",
  },
  capabilities = capabilities
}
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').gopls.setup({
  capabilities = capabilities
})

require('lspconfig').tsserver.setup({
  capabilities = capabilities
})

require('lspconfig').intelephense.setup({
  capabilities = capabilities
})

require('lspconfig').clangd.setup({
  capabilities = capabilities
})

require('lspconfig').cmake.setup({
  capabilities = capabilities
})

require('lspconfig').ccls.setup {
  capabilities = capabilities,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0,
    },
    clang = {
      excludeArgs = { "-frounding-math" },
    },
  }
}

lsp.setup()
