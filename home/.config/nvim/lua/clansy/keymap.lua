local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

local nnoremap = M.nnoremap
local inoremap = M.inoremap
local cnoremap = M.cnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Close open screen
nnoremap("<C-q>", ":q!<CR>")

-- Movement in Insert/Command Mode
inoremap("<C-h>", "<Left>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")
inoremap("<C-l>", "<Right>")
