-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-tree/nvim-web-devicons'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  
  use 'airblade/vim-gitgutter'

  use 'navarasu/onedark.nvim'

  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'

  use 'ThePrimeagen/vim-be-good'
end)

