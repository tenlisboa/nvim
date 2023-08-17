local lspconfig = require('lspconfig')

lspconfig.cssls.setup{}
lspconfig.dockerls.setup{}
lspconfig.docker_compose_language_service.setup{}
lspconfig.eslint.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.tsserver.setup{}
lspconfig.lua_ls.setup{}
lspconfig.prismals.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.intelephense.setup {}
lspconfig.vuels.setup {}
lspconfig.pyright.setup {}

-- GoTO
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function (ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end
})

