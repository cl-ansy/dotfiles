local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    "folke/which-key.nvim",
    "folke/tokyonight.nvim",
    "airblade/vim-gitgutter",
    {"vim-airline/vim-airline",
      dependencies = {
        "vim-airline/vim-airline-themes",
      },
    },
    { "nvim-tree/nvim-tree.lua",
      opts = {
        sort_by = "case_sensitive",
        view = { adaptive_size = true },
        renderer = { group_empty = true },
      },
      dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
      },
    },
    { "nvim-treesitter/nvim-treesitter",
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
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})
