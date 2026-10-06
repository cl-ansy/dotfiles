return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sort_by = "case_sensitive",
      view = { adaptive_size = true },
      renderer = { group_empty = true },
      on_attach = function(bufnr)
        require("nvim-tree.keymap").on_attach_default(bufnr)
        local api = require("nvim-tree.api")
        vim.keymap.set("n", ".", api.tree.change_root_to_node, { buffer = bufnr, desc = "CD" })
        vim.keymap.set("n", "<leader>cd", function()
          local node = api.tree.get_node_under_cursor()
          if not node then
            return
          end
          local dir = node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
          vim.cmd.cd(dir)
        end, { buffer = bufnr, desc = "Set nvim cwd to directory under cursor" })
      end,
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
}
