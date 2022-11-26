local noremap = require("clansy.keymap")
local nnoremap = noremap.nnoremap
local inoremap = noremap.inoremap
local cnoremap = noremap.cnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Close open screen
nnoremap("<C-q>", ":q!<CR>")

-- NERDTree
-- nnoremap("<leader>n", ":NERDTreeFocus<CR>")
-- nnoremap("<C-n>", ":NERDTree<CR>")
-- nnoremap("<C-t>", ":NERDTreeToggle<CR>")
-- nnoremap("<C-f>", ":NERDTreeFind<CR>")

-- nnoremap("<S-Tab>", "gT")
-- nnoremap("<Tab>", "gt")
-- nnoremap("<silent> <S-t>", ":tabnew<CR>")

-- Movement in Insert/Command Mode
inoremap("<C-h>", "<Left>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")
inoremap("<C-l>", "<Right>")

