require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'ts_ls', 'cssls', 'html' },
  automatic_installation = true,
}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  local nnoremap = require('clansy.keymap').nnoremap
  local opts = { buffer = bufnr }
  nnoremap('gd', vim.lsp.buf.definition, opts)
  nnoremap('K', vim.lsp.buf.hover, opts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, opts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, opts)
  nnoremap('[d', vim.diagnostic.goto_prev, opts)
  nnoremap(']d', vim.diagnostic.goto_next, opts)
end

local servers = { 'lua_ls', 'ts_ls', 'cssls', 'html' }
for _, server in ipairs(servers) do
  lspconfig[server].setup { capabilities = capabilities, on_attach = on_attach }
end

-- Autocompletion
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
