return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sort_by = "case_sensitive",
      view = { adaptive_size = true },
      renderer = { group_empty = true },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
}
