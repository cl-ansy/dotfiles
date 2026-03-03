require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'javascript', 'typescript', 'tsx', 'html', 'css', 'json', 'bash', 'markdown' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}
