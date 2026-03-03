local builtin = require('telescope.builtin')
local nnoremap = require('clansy.keymap').nnoremap

nnoremap('<leader>ff', builtin.find_files)
nnoremap('<leader>fg', builtin.live_grep)
nnoremap('<leader>fb', builtin.buffers)
nnoremap('<leader>fh', builtin.help_tags)
