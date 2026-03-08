return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "javascript",
        "typescript",
        "python",
        "rust",
        "tsx",
        "html",
        "css",
        "json",
        "markdown",
        "lua",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
